return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  opts = {
    winopts = {
      width = 0.80,
      height = 0.60,
    },
    files = {
      prompt = '❯ ',
      -- prompt = '>>> ',
      previewer = false,
      cwd_prompt = false,
      -- absolute_path = true,
      rg_opts = [[--color=never --hidden --files -g "!.git"]],
    },
  },
  init = function ()
    local function find_files_ext()
      vim.ui.input({ prompt = "Extensions (example: lua py md): " }, function(input)
        -- Case 1: user pressed ESC / cancelled
        if input == nil then
          return
        end

        -- Case 2: user pressed Enter without typing
        if input == "" then
          require("fzf-lua").files({})
          return
        end

        local exts = vim.split(input, " ")
        local cmd = "rg --files --color=never -g '!.git'"

        for _, ext in ipairs(exts) do
          cmd = cmd .. " --iglob '*." .. ext .. "'"
        end

        require("fzf-lua").files({raw_cmd = cmd})

      end)
    end
    vim.keymap.set("n", "<leader>sf", find_files_ext, { desc = "[S]earch [F]iles by extension" })
  end
}

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
      -- width = 0.80,
      height = 0.60,
      -- title_flags = false,
      preview = {
        hidden = true,
        -- layout = "vertical", -- horizontal|vertical|flex
      },
    },
    files = {
      prompt = '❯ ',
      cwd_prompt = false,
      absolute_path = false,
      hidden = false, -- disable hidden files
      rg_opts = [[--color=never --hidden --files -g "!.git"]],
    },
  },
  init = function ()
    local FzfLua = require("fzf-lua")

    -- search files by extensions
    local function find_files_ext()
      vim.ui.input({ prompt = "Extensions (example: lua py md): " }, function(input)
        -- Case 1: user pressed ESC / cancelled
        if input == nil then
          return
        end

        -- Case 2: user pressed Enter without typing
        if input == "" then
          FzfLua.files({})
          return
        end

        local exts = vim.split(input, " ")
        local cmd = "rg --files --color=never -g '!.git'"

        for _, ext in ipairs(exts) do
          cmd = cmd .. " --iglob '*." .. ext .. "'"
        end

        FzfLua.files({raw_cmd = cmd, winopts = {title=" Files with extensions: " .. input .. " "}})

      end)
    end
    vim.keymap.set("n", "<leader>sf", find_files_ext, { desc = "[S]earch [F]iles by extension" })

    -- -- search nvim configuration files
    -- vim.keymap.set('n', '<leader>sc', function()
    --   FzfLua.files({cwd = vim.fn.stdpath('config'), winopts = {title=" 🔧 Search Neovim Config "}})
    -- end, { desc = '[S]earch Neovim [C]onfig files' })
  end
}

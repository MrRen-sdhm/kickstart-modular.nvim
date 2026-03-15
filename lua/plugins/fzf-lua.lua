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

    local function get_repo_root()
      local current_file_dir = vim.fn.expand("%:p:h")
      local repo_dir = vim.fn.finddir(".repo", current_file_dir .. ";") -- /home/sdhm/test/.repo

      if repo_dir == "" then
        return nil, "Not inside a repo project"
      end
      -- vim.notify("Repo dir: " .. repo_dir)

      local repo_root = vim.fn.fnamemodify(repo_dir, ":p:h:h")
      -- vim.notify("Repo root: " .. repo_root)
      return repo_root
    end

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

    -- find files in repo dirs
    local function files_in_repo_dirs()
      local repo_root, error_message = get_repo_root()

      if not repo_root then
        vim.notify(error_message, vim.log.levels.WARN)
        return
      end

      local search_directories = {
        repo_root .. "/test1",
        repo_root .. "/test2",
      }

      local cmd = "rg --files --color=never -g '!.git'"

      -- cmd = cmd .. " " .. table.concat(search_directories, " ")
      cmd = cmd .. " " .. table.concat(search_directories, " ") .. " -t c" -- search c files only
      -- vim.notify(cmd)

      FzfLua.files({raw_cmd = cmd, winopts = {title=" files in repo directories "},})
    end
    vim.keymap.set("n", "<leader>p", files_in_repo_dirs, { desc = "Search File in repo dirs"})

    -- -- search nvim configuration files
    -- vim.keymap.set('n', '<leader>sc', function()
    --   FzfLua.files({cwd = vim.fn.stdpath('config'), winopts = {title=" 🔧 Search Neovim Config "}})
    -- end, { desc = '[S]earch Neovim [C]onfig files' })
  end
}

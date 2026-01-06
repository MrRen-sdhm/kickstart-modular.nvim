-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

-- if true then return {} end

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- Create custom actions
      local transform_mod = require("telescope.actions.mt").transform_mod

      local my_custom_actions = transform_mod({
        switch_to_normal_mode = function(prompt_bufnr)
          vim.cmd.stopinsert()
        end,
      })

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        defaults = {
          dynamic_preview_title = true, -- for yank_history
          layout_strategy = "vertical",
          layout_config = {
            vertical = {
              prompt_position = "top",
              mirror = true,
              height = 0.8,
              width = 0.8,
            }
          },
          sorting_strategy = "ascending",
          mappings = {
            i = {
              ["<Esc>"] = require("telescope.actions").close, -- close telescope
              ['<C-f>'] = require("telescope.actions").to_fuzzy_refine, -- search based on current result
              -- ["<C-n>"] = { "<cmd>stopinsert<cr>", type = "command" }, -- switch to normal mode
              ["<C-n>"] = my_custom_actions.switch_to_normal_mode, -- swith to normal mode
              ["<C-j>"] = require("telescope.actions").move_selection_next,
              ["<C-k>"] = require("telescope.actions").move_selection_previous,
            },
          },
        },
        pickers = {
          buffers = {
            -- sort_lastused = true,
            sort_mru = true,
            ignore_current_buffer = true,
            previewer = false, -- do not show preview

            layout_strategy = "vertical",
            layout_config = {
              vertical = {
                prompt_position = "top",
                mirror = true,
                height = 0.4,
                width = 0.6
              }
            },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          ['aerial'] = {
            aerial = {
              -- Set the width of the first two columns (the second
              -- is relevant only when show_columns is set to 'both')
              col1_width = 4,
              col2_width = 30,
              -- How to format the symbols
              format_symbol = function(symbol_path, filetype)
                if filetype == "json" or filetype == "yaml" then
                  return table.concat(symbol_path, ".")
                else
                  return symbol_path[#symbol_path]
                end
              end,
              -- Available modes: symbols, lines, both
              show_columns = "both",
            },
          }
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'aerial')
      pcall(require('telescope').load_extension, 'yank_history')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sH', builtin.command_history, { desc = '[S]earch command [H]istory' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sT', builtin.builtin, { desc = '[S]earch select [T]slescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sm', builtin.oldfiles, { desc = '[S]earch [M]ost Recent Files' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set("n", "<leader>ff", function()
        builtin.lsp_document_symbols {
          symbols = { "Function", "Method" },
          prompt_title = 'Find Functions'
        }
      end, { desc = "[F]ind [F]unctions"})

      vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find,
        { desc = 'Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader>l', builtin.current_buffer_fuzzy_find,
        { desc = 'Fuzzily search in current buffer' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sc', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config', prompt_title = "🔧 Search Neovim Config", }
      end, { desc = '[S]earch Neovim [C]onfig files' })

      vim.keymap.set('n', '<leader>uc', function()
        builtin.colorscheme { enable_preview = true }
      end, { desc = '[U]i [C]olorscheme' })

      -- Simple function to get the git root of the current file
      local function get_git_root()
        -- Get the directory of the current file
        local file_dir = vim.fn.expand('%:p:h')
        -- Run git command to get the top-level directory
        local result = vim.fn.systemlist('git -C "' .. file_dir .. '" rev-parse --show-toplevel')
        -- Check for errors (not in git repo)
        if vim.v.shell_error ~= 0 or #result == 0 then
          return nil, "Not inside a Git repository"
        end
        return result[1] -- git root path
      end

      -- Telescope live_grep in the git root
      local function live_grep_git_root()
        local git_root, err = get_git_root()
        if git_root then
          vim.notify("Git root: " .. git_root)
          require('telescope.builtin').live_grep({ cwd = git_root })
        else
          vim.notify(err, vim.log.levels.WARN)
        end
      end

      -- Keymap example (leader + fg)
      vim.keymap.set('n', '<leader>sG', live_grep_git_root, { desc = "[S]earch by live [G]rep in git repo" })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et

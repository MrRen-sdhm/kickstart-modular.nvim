return {
  { -- Autocompletion
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      -- Snippet Engine
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
        config = function()
          -- load snipmate formate snippets (e.g. ~/.config/nvim/snippets/c.snippets)
          require("luasnip.loaders.from_snipmate").lazy_load()

          -- register `LuaSnipEdit` command to edit snippets
          vim.api.nvim_create_user_command("LuaSnipEdit", function()
            require("luasnip.loaders").edit_snippet_files()
          end, { desc = "Edit LuaSnip snippet files", })
        end,
        opts = {},
      },
      -- Dictionary Engine
      {
        'Kaiser-Yang/blink-cmp-dictionary',
        dependencies = { 'nvim-lua/plenary.nvim' }
      },
      -- Copilot
      "fang2hou/blink-copilot",

      'folke/lazydev.nvim',
    },
    --- @module 'blink.cmp'
    --- @type blink.cmp.Config
    opts = {
      keymap = {
        -- 'default' (recommended) for mappings similar to built-in completions
        --   <c-y> to accept ([y]es) the completion.
        --    This will auto-import if your LSP supports it.
        --    This will expand snippets if the LSP sent a snippet.
        -- 'super-tab' for tab to accept
        -- 'enter' for enter to accept
        -- 'none' for no mappings
        --
        -- For an understanding of why the 'default' preset is recommended,
        -- you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        --
        -- All presets have the following mappings:
        -- <tab>/<s-tab>: move to right/left of your snippet expansion
        -- <c-space>: Open menu or open docs if already open
        -- <c-n>/<c-p> or <up>/<down>: Select next/previous item
        -- <c-e>: Hide menu
        -- <c-k>: Toggle signature help
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        preset = 'enter',

        -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
        --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono',
      },

      completion = {
        -- By default, you may press `<c-space>` to show the documentation.
        -- Optionally, set `auto_show = true` to show the documentation after a delay.
        documentation = { auto_show = true, auto_show_delay_ms = 500 },
        menu = {
          -- Automatically show the completion menu
          auto_show = true,

          -- nvim-cmp style menu
          draw = {
            columns = {
              -- { "kind_icon" },
              { "label", "label_description", gap = 10 },
              { "kind_icon", "kind", gap = 0 },
              -- { "kind" },
            },
          }
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'omni', 'lazydev', 'dictionary', 'copilot' },

        -- NOTE: You can use `score_offset` to set the priority of providers:
        -- https://cmp.saghen.dev/configuration/reference#providers
        providers = {
          lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
          -- https://cmp.saghen.dev/configuration/sources.html#show-buffer-completions-with-lsp
          -- By default, the buffer source will only show when the LSP source is disabled or returns no items.
          -- You may always show the buffer source via:
          lsp = {
            fallbacks = {}, -- defaults to `{ 'buffer' }`
            score_offset = 0, -- lsp default score_offset (priority) = 0
          },
          path = { score_offset = 3 }, -- path default score_offset (priority) = 3
          buffer = { score_offset = -3 }, -- buffer default score_offset (priority) = -3
          snippets = { score_offset = 1 }, -- snippets default score_offset (priority) = -1
          dictionary = {
              -- https://github.com/Kaiser-Yang/blink-cmp-dictionary
              module = 'blink-cmp-dictionary',
              name = 'Dict',
              -- Make sure this is at least 2.
              -- 3 is recommended
              min_keyword_length = 3,
              opts = {
                  -- options for blink-cmp-dictionary
                  -- english words txt: https://raw.githubusercontent.com/dwyl/english-words/refs/heads/master/words.txt
                  dictionary_directories = { vim.fn.expand('~/.config/nvim/dictionary') }
              },
              score_offset = -100, -- lowest priority
          },
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            opts = {
              -- Local options override global ones
              max_completions = 3,  -- Override global max_completions
              max_attempts = 4,
            }
          },
        },
      },

      snippets = { preset = 'luasnip' },

      -- Blink.cmp includes an optional, recommended rust fuzzy matcher,
      -- which automatically downloads a prebuilt binary when enabled.
      --
      -- By default, we use the Lua implementation instead, but you may enable
      -- the rust implementation via `'prefer_rust_with_warning'`
      --
      -- See :h blink-cmp-config-fuzzy for more information
      fuzzy = {
        implementation = 'lua',
        sorts = {
          -- custom sort function (based on priority) WARN: In the official documentation, `score_offset` is used to set the priority.
          -- https://cmp.saghen.dev/configuration/fuzzy.html#sorting
          -- https://github.com/saghen/blink.cmp/issues/1098#issuecomment-2679295335
          -- function(a, b)
          --   local source_priority = {
          --     snippets = 4,
          --     lsp = 3,
          --     path = 2,
          --     buffer = 1,
          --     dictionary = 0,
          --   }
          --   local a_priority = source_priority[a.source_id]
          --   local b_priority = source_priority[b.source_id]
          --   if a_priority ~= b_priority then return a_priority > b_priority end
          -- end,
          'score',      -- Primary sort: by fuzzy matching score
          'sort_text',  -- Secondary sort: by sortText field if scores are equal
          'label',      -- Tertiary sort: by label if still tied
        }
      },

      -- Shows a signature help window while you type arguments for a function
      signature = { enabled = true },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et

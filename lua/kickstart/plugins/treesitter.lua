return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    enabled = true,
    build = ':TSUpdate',
    branch = 'master',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    dependencies = {
      {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = "main",
        config = function ()
          local move = require("nvim-treesitter-textobjects.move")
          -- function move
          vim.keymap.set("n", "]f", function() move.goto_next_start("@function.outer")
          end, { desc = "TS next function start" })
          vim.keymap.set("n", "[f", function() move.goto_previous_start("@function.outer")
          end, { desc = "TS prev function start" })

          -- loop move
          vim.keymap.set("n", "]l", function() move.goto_next_start("@loop.outer")
          end, { desc = "TS next loop start" })
          vim.keymap.set("n", "[l", function() move.goto_previous_start("@loop.outer")
          end, { desc = "TS prev loop start" })

          -- condictional move
          vim.keymap.set("n", "]i", function() move.goto_next_start("@conditional.outer")
          end, { desc = "TS next conditional start" })
          vim.keymap.set("n", "[i", function() move.goto_previous_start("@conditional.outer")
          end, { desc = "TS prev conditional start" })
        end
      },
    },
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'cpp', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
        },
      },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
}
-- vim: ts=2 sts=2 sw=2 et

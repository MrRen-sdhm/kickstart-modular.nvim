-- Highlight todo, notes, etc in comments
return {
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      keywords = {
        DEBUG = { icon = "", color = "error", alt = { "DBG", "DEBG" } }, -- add key words for debug
      },
      highlight = {
        multiline = false, -- disable multiline comment
      }
    }
  },
}

-- TODO: xxxx
-- xxxx
-- FIXME: xxxx
-- xxxx
-- NOTE: xxxx
-- HACK: xxxx
-- WARN: xxxx
-- PERF: xxxx
-- TEST: xxxx
-- DEBUG: xxxx

-- vim: ts=2 sts=2 sw=2 et

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
    }
  },
}

-- TODO:
-- FIXME:
-- NOTE:
-- HACK:
-- WARN:
-- PERF:
-- TEST:
-- DEBUG:

-- vim: ts=2 sts=2 sw=2 et

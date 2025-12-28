return {
  "inkarkat/vim-mark",
  dependencies = {
    "inkarkat/vim-ingo-library",
  },
  event = "VeryLazy",
  init = function ()
    vim.g.mw_no_mappings = 1 -- turn off the default mappings
    -- vim.g.mwDefaultHighlightingPalette = "maximum"
    vim.keymap.set("n", "<leader>m", "<Plug>MarkSet", { desc = "Mark word" })
    vim.keymap.set("x", "<leader>m", "<Plug>MarkSet", { desc = "Mark selection" })
    vim.keymap.set("n", "<leader>M", "<Plug>MarkAllClear", { desc = "Mark all clear" })
  end
}

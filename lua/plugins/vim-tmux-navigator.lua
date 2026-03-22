return {
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    vim.g.tmux_navigator_disable_when_zoomed = 1
    vim.g.tmux_navigator_no_mappings = 1
    vim.keymap.set("n", "<M-Left>", "<cmd>TmuxNavigateLeft<CR>")
    vim.keymap.set("n", "<M-Down>", "<cmd>TmuxNavigateDown<CR>")
    vim.keymap.set("n", "<M-Up>", "<cmd>TmuxNavigateUp<CR>")
    vim.keymap.set("n", "<M-Right>", "<cmd>TmuxNavigateRight<CR>")
    vim.keymap.set("n", "<M-\\>", "<cmd>TmuxNavigatePrevious<CR>")
  end,
}

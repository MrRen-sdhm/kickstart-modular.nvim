return {
  'stevearc/aerial.nvim',
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    -- backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
    -- backends = { "lsp", "markdown", "asciidoc", "man" },
    -- filter_kind = {
    --   "Function",
    --   "Method",
    -- },
  },
  keys = {
    { "<leader>ss", "<cmd>Telescope aerial<cr>", desc = "[S]earch [S]ymbols" },
    { "<M-f>", "j<cmd>AerialPrev<cr>", desc = "Jump to current function name" }, -- move to next line and then jump
    { "[[", "<cmd>AerialPrev<cr>", desc = "Jump to prev symbol" },
    { "]]", "<cmd>AerialNext<cr>", desc = "Jump to next symbol" },
  },
}

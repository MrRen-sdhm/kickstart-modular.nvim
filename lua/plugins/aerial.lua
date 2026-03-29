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
    layout = {
      min_width = 40,
      default_direction = "prefer_left",
    },
    -- auto open aerial if markdown
    open_automatic = function(bufnr) return vim.bo[bufnr].filetype == "markdown" end,
  },
  init = function()
    local aerial = require("aerial")

    -- auto close aerial if not markdown
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function(args)
        local ft = vim.bo[args.buf].filetype

        if ft ~= "markdown" then
          if aerial.is_open() then
            aerial.close()
          end
        end
      end,
    })
  end,
  keys = {
    { "<leader>ss", "<cmd>Telescope aerial<cr>", desc = "[S]earch [S]ymbols" },
    { "<M-f>", "j<cmd>AerialPrev<cr>", desc = "Jump to current function name" }, -- move to next line and then jump
    { "[[", "<cmd>AerialPrev<cr>", desc = "Jump to prev symbol" },
    { "]]", "<cmd>AerialNext<cr>", desc = "Jump to next symbol" },
  },
}

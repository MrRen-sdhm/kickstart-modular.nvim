return {
  "RRethy/vim-illuminate",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    delay = 200, -- delay in milliseconds
    large_file_cutoff = 2000, -- number of lines at which to use large_file_config
    large_file_overrides = { -- config to use for large files (based on large_file_cutoff)
      providers = { "lsp" }, -- large file only use LSP
    },
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    filetypes_denylist = {
      "NvimTree",
      "TelescopePrompt",
      "lazy",
      "help",
      "alpha",
      "dashboard",
      "neo-tree",
    },
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
  end,
}


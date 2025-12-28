return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    -- Setup colorizer for all filetypes (you can restrict to specific ones if needed)
    require("colorizer").setup({
      -- "*", -- Enable in all buffers
      -- Example: only enable in certain filetypes:
      -- "css", "html", "javascript", "vue", "svelte"
      "lua"
    }, {
      -- Color formats to highlight
      RGB = true,       -- #RGB hex codes (e.g. #f00)
      RRGGBB = true,    -- #RRGGBB hex codes (e.g. #ff0000)
      RRGGBBAA = false, -- #RRGGBBAA hex codes (e.g. #ff000088)
      names = false,    -- Color names (e.g. "red", "blue") – disabled by default for performance
      rgb_fn = false,   -- CSS rgb() functions (e.g. rgb(255, 0, 0))
      hsl_fn = false,   -- CSS hsl() functions
      css = false,      -- Enable all CSS-related features (implies RGB, RRGGBB, rgb_fn, etc.)
      css_fn = false,   -- Enable CSS functional notations
    })
  end,
}

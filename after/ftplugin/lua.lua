-- Lua indentation configuration (2-space style per Lua community best practices)
vim.bo.expandtab = true      -- Enable soft tabs (convert tab characters to spaces)
vim.bo.tabstop = 2           -- Set visual width of a tab character to 2 columns
vim.bo.softtabstop = 2       -- Number of spaces inserted when Tab key is pressed
vim.bo.shiftwidth = 2        -- Number of spaces used for auto-indentation
vim.bo.autoindent = true     -- Preserve indent level from current line to new line
vim.bo.smartindent = true    -- Context-aware indentation for Lua syntax (functions, conditionals, loops)
vim.wo.linebreak = true      -- Wrap long lines at word boundaries (avoids splitting Lua identifiers)

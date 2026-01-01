-- expandtab by default
-- vim.bo.expandtab = true      -- Convert tabs to spaces (soft tabs)
-- vim.bo.tabstop = 4           -- Number of columns a tab character occupies
-- vim.bo.softtabstop = 4       -- Spaces inserted when pressing Tab key
-- vim.bo.shiftwidth = 4        -- Spaces for auto-indent (code blocks)

-- not expandtab by default
vim.bo.expandtab = false     -- Do not convert tabs to spaces (soft tabs)
vim.bo.tabstop = 8           -- Number of columns a tab character occupies
vim.bo.softtabstop = 8       -- Spaces inserted when pressing Tab key
vim.bo.shiftwidth = 8        -- Spaces for auto-indent (code blocks)

-- Toggle indent: <leader><Tab> (4 spaces <-> 8 hard tabs)
vim.keymap.set('n', '<leader><Tab>', function()
  local use_spaces = not vim.bo.expandtab
  vim.bo.expandtab, vim.bo.tabstop, vim.bo.shiftwidth, vim.bo.softtabstop = use_spaces, use_spaces and 4 or 8, use_spaces and 4 or 8, use_spaces and 4 or 8
  vim.notify(use_spaces and "Indent: 4 spaces" or "Indent: 8 hard tabs")
end, {noremap=true, silent=true, desc="Toggle indent style (spaces/tabs)"})

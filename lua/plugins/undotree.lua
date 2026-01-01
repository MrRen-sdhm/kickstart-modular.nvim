return {
  "mbbill/undotree",
  cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
  config = function()
    -- vim.g.undotree_WindowLayout = 2
    -- vim.g.undotree_ShortIndicators = 1
    vim.g.undotree_SetFocusWhenToggle = 1
    vim.opt.undofile = true
  end,
  keys = {
    { "<leader>tu", vim.cmd.UndotreeToggle, desc = "[T]oggle [U]ndoTree" },
  },
}

return {
  "nvim-pack/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },  -- 依赖库（Neovim 常用）
  keys = {
    { "<leader>sr", mode = "v", desc = "Spectre 可视选中替换" },
  },
  config = function()
    require("spectre").setup({
      open_cmd = "vnew",  -- 侧边栏打开面板（默认水平分割，改为垂直）
      live_update = true, -- 实时预览替换效果
    })
    vim.keymap.set('v', '<leader>sr', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
      desc = "Search current word"
    })
    -- 配置：可视选中内容 → 打开 Spectre 并自动填充搜索词
    -- vim.keymap.set('v', '<leader>sr', function()
    --   local selected = vim.fn.getreg('"')
    --   require('spectre').open({
    --     search_text = selected,  -- 自动填入选中的内容
    --     replace_text = "",       -- 替换框为空，手动输入
    --   })
    -- end)
  end,
}

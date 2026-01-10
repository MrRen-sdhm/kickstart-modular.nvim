return {
  'jedrzejboczar/possession.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require("possession").setup({
      autosave = {
          current = true, -- auto save current session
          cwd = false,
          tmp = false,
          tmp_name = 'tmp',
          on_load = true,
          on_quit = true,
      },
      plugins = {
         delete_hidden_buffers = false, -- disable auto delete hidden buffers
      },
      hooks = {
        after_load = function()
          vim.cmd("nohlsearch") -- nohlsearch after load session
        end,
      },
      -- commands = {
      --     save = 'SSave',
      --     load = 'SLoad',
      --     delete = 'SDelete',
      --     list = 'SList',
      --     pick = 'SPick',
      -- }
    })

    vim.keymap.set('n', '<leader>sS', "<cmd>PossessionSave<CR>", { desc = '[S]ession save' })
    -- vim.keymap.set('n', '<leader>sS', "<cmd>PossessionSaveCwd<CR>", { desc = '[S]ession save Cwd' })
    vim.keymap.set('n', '<leader>sp', "<cmd>PossessionPick<CR>", { desc = '[S]ession pick' })
  end
}

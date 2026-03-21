-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear search highlights when opening a new file
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("nohlsearch")
  end,
})

-- Toggle signcolumn
vim.keymap.set('n', '<leader>ts', function()
  local sc = vim.wo.signcolumn
  vim.wo.signcolumn = (sc == 'no') and 'yes' or 'no'
end, { desc = '[T]oggle [S]igncolumn' })

-- Toggle relative number
vim.keymap.set('n', '<leader>tr', function()
  vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = '[T]oggle [R]elative Number' })

-- Toggle warp
vim.keymap.set('n', '<leader>t<enter>', '<cmd>set wrap!<CR>', { desc = '[T]oggle [W]rap' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Add a new line below
vim.keymap.set("n", "<M-CR>", "o<Esc>", { desc = "Add a new line below" })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- move multi-line
vim.keymap.set({'n', 'v'}, "<C-Up>", "3k", { noremap = true, silent = true, desc = "move up 3 line" })
vim.keymap.set({'n', 'v'}, "<C-Down>", "3j", { noremap = true, silent = true, desc = "move down 3 line" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<M-Left>',  '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<M-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<M-Down>',  '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<M-Up>',    '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<C-]>', '<C-w>v', { desc = 'Split window vertically' })

vim.keymap.set('n', '<M-->', '<C-w>|' , { desc = 'Max out the window width' }) -- <alt + ->
vim.keymap.set('n', '<M-=>', '<C-w>=' , { desc = 'Equally window high and wide' }) -- <alt + =>
vim.keymap.set('n', '<M-.>', '4<C-w>>' , { desc = 'Increase window width' }) -- <alt + .>
vim.keymap.set('n', '<M-,>', '4<C-w><' , { desc = 'Decrease window width' }) -- <alt + ,>

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- disable auto comment
vim.cmd [[ autocmd FileType * setlocal formatoptions-=cro ]]

-- add colorcolumn for gitcommit filetype
vim.cmd [[ autocmd FileType gitcommit set colorcolumn=71 ]]

-- replace the word under cursor in normal mode use \r
vim.keymap.set('n', '\\r', [[:%s/<C-r><C-w>/]], { desc = 'replace the word under cursor' })

-- toggle mouse（mouse=a <-> mouse=）
local toggle_mouse = function()
  local current_mouse = vim.o.mouse
  if current_mouse == 'a' then
    vim.o.mouse = ''  -- disable
    vim.notify('Mouse disabled (mouse=)')
  else
    vim.o.mouse = 'a' -- enable in all mode
    vim.notify('Mouse enabled (mouse=a)')
  end
end

-- toggle mouse
vim.keymap.set('n', '<leader>tm', toggle_mouse, { desc = '[T]oggle [M]ouse' })
vim.keymap.set('n', '<M-m>', toggle_mouse, { desc = 'Toggle Mouse' })
vim.keymap.set('n', '<C-m>', toggle_mouse, { desc = 'Toggle Mouse' })
vim.keymap.set('n', '<leader>v', toggle_mouse, { desc = 'Toggle Mouse' })

-- Alt+d delete word in insert mode
vim.keymap.set('i', '<M-d>', '<C-o>dw')

-- switch to last used buffer
vim.keymap.set('n', '<leader><tab>', ':b#<CR>', { noremap = true, silent = true, desc = 'switch to last used buffer' })

-- Toggle tab indent: <leader>tt (4 spaces <-> 8 hard tabs)
vim.keymap.set('n', '<leader>tt', function()
  local use_spaces = not vim.bo.expandtab
  vim.bo.expandtab, vim.bo.tabstop, vim.bo.shiftwidth, vim.bo.softtabstop = use_spaces, use_spaces and 4 or 8, use_spaces and 4 or 8, use_spaces and 4 or 8
  vim.notify(use_spaces and "Tab Indent: 4 spaces" or "Tab Indent: 8 hard tabs")
end, { desc="[T]oggle [T]ab indent (spaces/tabs)" })

-- Visual mode text substitution
vim.cmd [[
function! GetVisualSelect()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "")
endfunction

function! SubstitueVisualSelect()
    let mode=visualmode()
    if mode==# "v"
        let str = GetVisualSelect()
        call feedkeys(printf(":%%s/%s", str), 'n')
    elseif mode==# "V"
        call feedkeys(":'<,'>s/", 'n')
    elseif mode==# "\<C-v>"
        call feedkeys(":'<,'>s/", 'n')
    endif
endfunction

xnoremap s :<c-u>call SubstitueVisualSelect()<cr>
]]

-- clang-format
vim.keymap.set({"n", "v"}, "<M-c>", "<cmd>py3f ~/clang-format.py<CR>", { desc = "Run clang-format" })
vim.keymap.set("i", "<M-c>", "<C-o>:py3f ~/clang-format.py<CR>", { desc = "Run clang-format" })

-- vim: ts=2 sts=2 sw=2 et

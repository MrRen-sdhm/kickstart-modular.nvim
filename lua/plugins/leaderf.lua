return {
  {
    "Yggdroot/LeaderF",
    lazy = false,

    build = function()
      vim.fn["LeaderfInstallCExtension"]()
    end,

    init = function()
      vim.g.Lf_HideHelp = 1
      vim.g.Lf_UseCache = 0
      vim.g.Lf_UseVersionControlTool = 0
      vim.g.Lf_StlSeparator = { left = '', right = '' }
      vim.g.Lf_ShowDevIcons = 1
      vim.g.Lf_SpacesAfterIcon = " "
      vim.g.Lf_IgnoreCurrentBufferName = 1
      vim.g.Lf_ShowRelativePath = 0
      vim.g.Lf_DefaultMode = 'NameOnly'
      vim.g.Lf_AutoResize = 0
      vim.g.Lf_UseVersionControlTool = 0
      vim.g.Lf_RootMarkers = {'.repo'}
      vim.g.Lf_WorkingDirectoryMode = 'AF'
      vim.g.Lf_JumpToExistingWindow = 1
      vim.g.Lf_TabpagePosition = 3
      vim.g.Lf_QuickSelect = 0

      vim.g.Lf_WildIgnore = { ['dir'] = {}, ['file'] = {'*.[!ch]*', '*.c[a-z]*', '*.h[a-z]*'} }
      vim.g.Lf_RgConfig = {"-g=!*.mk", "-g=!*.cc"}
      vim.g.Lf_CommandMap = {['<C-K>'] = {'<C-K>', '<Up>'}, ['<C-J>'] = {'<C-J>', '<Down>'}, ['<C-T>'] = {'<C-T>', '<C-\\>'} }
      vim.g.Lf_ShortcutF = '<C-P>'
      vim.g.Lf_PreviewResult = { ['File'] = 0, ['Buffer'] = 0, ['Mru'] = 0, ['Tag'] = 1, ['BufTag'] = 1, ['Function'] = 1, ['Line'] = 1, ['Rg'] = 0, ['Gtags'] = 1 }

      -- popup config
      vim.g.Lf_WindowPosition = "popup"
      vim.g.Lf_PopupHeight = 0.3
      vim.g.Lf_PopupPosition = {8, 0}
      vim.g.Lf_PopupWidth = 0.9
      vim.g.Lf_PreviewInPopup = 1
      vim.g.Lf_PopupPreviewPosition = 'bottom'
      vim.g.Lf_PopupColorscheme = 'default'
      vim.g.Lf_PopupShowFoldcolumn = 0
      vim.g.Lf_PopupShowBorder = 1
      -- vim.g.Lf_PopupBorders = {"─","│","─","│","┌","┐","┘","└"}
      -- vim.g.Lf_PopupBorders = {"━","┃","━","┃","┏","┓","┛","┗"}
      vim.g.Lf_PopupBorders = {"─","│","─","│","╭","╮","╯","╰"}
      vim.g.Lf_PreviewScrollStepSize = 3

      -- popup color scheme for tokyonight
      vim.g.Lf_PopupPalette = {
      dark = {
        Lf_hl_match              = { gui='NONE', font='NONE', guifg='#ff5f00', guibg='NONE', cterm='NONE', ctermfg='202', ctermbg='NONE' }, -- match
        Lf_hl_match0             = { gui='NONE', font='NONE', guifg='#ff5f00', guibg='NONE', cterm='NONE', ctermfg='202', ctermbg='NONE' }, -- match
        Lf_hl_popup_blank        = { gui='NONE', font='NONE', guifg='NONE',    guibg='#1e2030', cterm='NONE', ctermfg='239', ctermbg='NONE' }, -- status line

        Lf_hl_popup_inputText    = { gui='NONE', font='NONE', guifg='#87d7pf', guibg='#1e2030', cterm='NONE', ctermfg='117', ctermbg='239' }, -- input text
        Lf_hl_cursorline         = { gui='NONE', font='NONE', guifg='#ffff00', guibg='NONE',    cterm='NONE', ctermfg='226', ctermbg='NONE' }, -- cursor line

        Lf_hl_popup_prompt       = { gui='NONE', font='NONE', guifg='#ffd75f', guibg='NONE', cterm='NONE', ctermfg='221', ctermbg='NONE' }, -- top left
        Lf_hl_popup_spin         = { gui='NONE', font='NONE', guifg='#d7d75f', guibg='NONE', cterm='NONE', ctermfg='185', ctermbg='NONE' }, -- top right

        Lf_hl_popup_normalMode   = { gui='bold', font='bold', guifg='#1b1d2b', guibg='#5d91fd', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- section_a
        Lf_hl_popup_inputMode    = { gui='bold', font='bold', guifg='#1b1d2b', guibg='#5d91fd', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- section_a
        Lf_hl_popup_category     = { gui='NONE', font='NONE', guifg='#1b1d2b', guibg='#82aaff', cterm='NONE', ctermfg='255', ctermbg='241' }, -- section_b
        Lf_hl_popup_nameOnlyMode = { gui='NONE', font='NONE', guifg='#1c1c1c', guibg='#9ab8ff', cterm='NONE', ctermfg='234', ctermbg='179' }, -- section_c
        Lf_hl_popup_fullPathMode = { gui='NONE', font='NONE', guifg='#1c1c1c', guibg='#9ab8ff', cterm='NONE', ctermfg='234', ctermbg='249' }, -- section_c
        Lf_hl_popup_fuzzyMode    = { gui='NONE', font='NONE', guifg='#1c1c1c', guibg='#9ab8ff', cterm='NONE', ctermfg='234', ctermbg='249' }, -- section_c
        Lf_hl_popup_regexMode    = { gui='NONE', font='NONE', guifg='#1c1c1c', guibg='#9ab8ff', cterm='NONE', ctermfg='234', ctermbg='108' }, -- section_c
        Lf_hl_popup_cwd          = { gui='NONE', font='NONE', guifg='#82aaff', guibg='#3b4261', cterm='NONE', ctermfg='228', ctermbg='243' }, -- section_d
        Lf_hl_popup_lineInfo     = { gui='NONE', font='NONE', guifg='#303030', guibg='#9ab8ff', cterm='NONE', ctermfg='236', ctermbg='254' }, -- top right
        Lf_hl_popup_total        = { gui='NONE', font='NONE', guifg='#303030', guibg='#82aaff', cterm='NONE', ctermfg='236', ctermbg='151' }, -- top right

        Lf_hl_popup_window       = { gui='NONE', font='NONE', guifg='NONE', guibg='NONE', cterm='NONE', ctermfg='NONE', ctermbg='NONE' }, -- background
        Lf_hl_popupBorder        = { gui='bold', font='bold', guifg='#5d91fd', guibg='NONE', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- border
      },
    }
    end,

    config = function()
      vim.keymap.set("n", "<leader>f", "<cmd>LeaderfBuffer<cr>", { desc = "Leaderf Buffer" })
      vim.keymap.set("n", "<leader>l", "<cmd>LeaderfLine<cr>", { desc = "Leaderf Line" })
    end,
  },
}


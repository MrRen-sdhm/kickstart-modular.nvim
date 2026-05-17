return {
  {
    "MrRen-sdhm/LeaderF",
    event = "VeryLazy",

    dependencies = {
      'skywind3000/Leaderf-snippet',
      config = function()
        vim.keymap.set('i', '<C-x><C-x>', '<C-\\><C-O>:Leaderf snippet<CR>')
        vim.cmd([[
          let g:Lf_PreviewResult = get(g:, 'Lf_PreviewResult', {})
          let g:Lf_PreviewResult.snippet = 0
          ]]
        )
      end
    },

    init = function()
      vim.g.Lf_HideHelp = 1
      vim.g.Lf_UseCache = 1
      vim.g.Lf_UseVersionControlTool = 0
      -- vim.g.Lf_StlSeparator = { left = '', right = '' }
      vim.g.Lf_StlSeparator = { left = '', right = '' }
      vim.g.Lf_ShowDevIcons = 1
      vim.g.Lf_SpacesAfterIcon = " "
      vim.g.Lf_IgnoreCurrentBufferName = 1
      vim.g.Lf_ShowRelativePath = 1
      vim.g.Lf_DefaultMode = 'NameOnly'
      vim.g.Lf_AutoResize = 0
      vim.g.Lf_RootMarkers = {'.repo'}
      vim.g.Lf_WorkingDirectoryMode = 'AF'
      vim.g.Lf_JumpToExistingWindow = 0
      vim.g.Lf_TabpagePosition = 3
      vim.g.Lf_QuickSelect = 0
      vim.g.Lf_GtagsAutoGenerate = 0
      vim.g.Lf_GtagsAutoUpdate = 0
      vim.g.Lf_GtagsGutentags = 1

      -- vim.g.Lf_WildIgnore = { ['dir'] = {}, ['file'] = {'*.[!ch]*', '*.c[a-z]*', '*.h[a-z]*'} }
      vim.g.Lf_RgConfig = {"-g=!*.mk", "-g=!*.cc"}
      vim.g.Lf_CommandMap = {['<C-K>'] = {'<C-K>', '<Up>'}, ['<C-J>'] = {'<C-J>', '<Down>'}, ['<C-T>'] = {'<C-T>', '<C-\\>'} }
      -- vim.g.Lf_ShortcutF = '<C-P>'
      vim.g.Lf_ShortcutF = ''
      vim.g.Lf_ShortcutB = ''
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
      -- tokyonight style
      dark = {
        Lf_hl_match              = { gui='NONE', font='NONE', guifg='#ff5f00', guibg='NONE', cterm='NONE', ctermfg='202', ctermbg='NONE' }, -- match
        Lf_hl_match0             = { gui='NONE', font='NONE', guifg='#ff5f00', guibg='NONE', cterm='NONE', ctermfg='202', ctermbg='NONE' }, -- match
        -- Lf_hl_popup_blank        = { gui='NONE', font='NONE', guifg='NONE',    guibg='#1e2030', cterm='NONE', ctermfg='239', ctermbg='NONE' }, -- status line
        Lf_hl_popup_blank        = { gui = "NONE", font = "NONE", guifg = "NONE",    guibg = "#202020", cterm = "NONE", ctermfg = 239, ctermbg = "NONE" },

        -- Lf_hl_popup_inputText    = { gui='NONE', font='NONE', guifg='#87d7pf', guibg='#1e2030', cterm='NONE', ctermfg='117', ctermbg='239' }, -- input text (use bg same to status line)
        Lf_hl_popup_inputText    = { gui='NONE', font='NONE', guifg='#87d7pf', guibg='NONE', cterm='NONE', ctermfg='117', ctermbg='239' }, -- input text
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
        -- Lf_hl_popup_cwd          = { gui='NONE', font='NONE', guifg='#82aaff', guibg='#3b4261', cterm='NONE', ctermfg='228', ctermbg='243' }, -- section_d
        Lf_hl_popup_cwd          = { gui='NONE', font='NONE', guifg='#eeeeee', guibg='#202020', cterm='NONE', ctermfg='228', ctermbg='243' }, -- section_d
        -- Lf_hl_popup_cwd          = { gui='NONE', font='NONE', guifg='#eeeeee', guibg='#3b4261', cterm='NONE', ctermfg='228', ctermbg='243' }, -- section_d
        Lf_hl_popup_lineInfo     = { gui='NONE', font='NONE', guifg='#303030', guibg='#9ab8ff', cterm='NONE', ctermfg='236', ctermbg='254' }, -- top right
        Lf_hl_popup_total        = { gui='NONE', font='NONE', guifg='#303030', guibg='#82aaff', cterm='NONE', ctermfg='236', ctermbg='151' }, -- top right

        Lf_hl_popup_window       = { gui='NONE', font='NONE', guifg='NONE', guibg='NONE', cterm='NONE', ctermfg='NONE', ctermbg='NONE' }, -- background
        -- Lf_hl_popupBorder        = { gui='bold', font='bold', guifg='#5d91fd', guibg='NONE', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- border
        Lf_hl_popupBorder        = { gui='bold', font='bold', guifg='#82aaff', guibg='NONE', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- border
      },

      -- default
      -- dark = {
      --   Lf_hl_match              = { gui = "NONE", font = "NONE", guifg = "#ff5f00", guibg = "NONE",    cterm = "NONE", ctermfg = 202, ctermbg = "NONE" },
      --   Lf_hl_match0             = { gui = "NONE", font = "NONE", guifg = "#ff5f00", guibg = "NONE",    cterm = "NONE", ctermfg = 202, ctermbg = "NONE" },
      --   -- Lf_hl_popup_blank        = { gui = "NONE", font = "NONE", guifg = "NONE",    guibg = "#4e4e4e", cterm = "NONE", ctermfg = 239, ctermbg = "NONE" },
      --   -- Lf_hl_popup_inputText    = { gui = "NONE", font = "NONE", guifg = "#87d7ff", guibg = "#4e4e4e", cterm = "NONE", ctermfg = 117, ctermbg = 239 },
      --   Lf_hl_popup_inputText    = { gui='NONE', font='NONE', guifg='#87d7pf', guibg='NONE', cterm='NONE', ctermfg='117', ctermbg='239' }, -- input text
      --   Lf_hl_cursorline         = { gui = "NONE", font = "NONE", guifg = "#ffff00", guibg = "NONE",    cterm = "NONE", ctermfg = 226, ctermbg = "NONE" },
      --   Lf_hl_popup_prompt       = { gui = "NONE", font = "NONE", guifg = "#ffd75f", guibg = "NONE",    cterm = "NONE", ctermfg = 221, ctermbg = "NONE" },
      --   Lf_hl_popup_spin         = { gui = "NONE", font = "NONE", guifg = "#d7d75f", guibg = "NONE",    cterm = "NONE", ctermfg = 185, ctermbg = "NONE" },
      --   Lf_hl_popup_normalMode   = { gui = "bold", font = "bold", guifg = "#5f5f00", guibg = "#d7d7af", cterm = "bold", ctermfg = 58,  ctermbg = 187 },
      --   Lf_hl_popup_inputMode    = { gui = "bold", font = "bold", guifg = "#005f5f", guibg = "#87afaf", cterm = "bold", ctermfg = 23,  ctermbg = 109 },
      --   Lf_hl_popup_category     = { gui = "NONE", font = "NONE", guifg = "#eeeeee", guibg = "#626262", cterm = "NONE", ctermfg = 255, ctermbg = 241 },
      --   Lf_hl_popup_nameOnlyMode = { gui = "NONE", font = "NONE", guifg = "#1c1c1c", guibg = "#d7af5f", cterm = "NONE", ctermfg = 234, ctermbg = 179 },
      --   Lf_hl_popup_fullPathMode = { gui = "NONE", font = "NONE", guifg = "#1c1c1c", guibg = "#b2b2b2", cterm = "NONE", ctermfg = 234, ctermbg = 249 },
      --   Lf_hl_popup_fuzzyMode    = { gui = "NONE", font = "NONE", guifg = "#1c1c1c", guibg = "#b2b2b2", cterm = "NONE", ctermfg = 234, ctermbg = 249 },
      --   Lf_hl_popup_regexMode    = { gui = "NONE", font = "NONE", guifg = "#1c1c1c", guibg = "#87af87", cterm = "NONE", ctermfg = 234, ctermbg = 108 },
      --   Lf_hl_popup_cwd          = { gui = "NONE", font = "NONE", guifg = "#eeeeee", guibg = "#767676", cterm = "NONE", ctermfg = 228, ctermbg = 243 },
      --   Lf_hl_popup_lineInfo     = { gui = "NONE", font = "NONE", guifg = "#303030", guibg = "#e4e4e4", cterm = "NONE", ctermfg = 236, ctermbg = 254 },
      --   Lf_hl_popup_total        = { gui = "NONE", font = "NONE", guifg = "#303030", guibg = "#afd7af", cterm = "NONE", ctermfg = 236, ctermbg = 151 },
      --   -- Lf_hl_popup_window       = { gui = "NONE", font = "NONE", guifg = "#eeeeee", guibg = "#262626", cterm = "NONE", ctermfg = 255, ctermbg = 235 },
      --
      --   Lf_hl_popupBorder        = { gui='bold', font='bold', guifg='#82aaff', guibg='NONE', cterm='bold', ctermfg='NONE', ctermbg='NONE' }, -- border
      -- },

    }
    end,

    config = function()
      local function get_git_root()
        local file_dir = vim.fn.expand("%:p:h")
        local result = vim.fn.systemlist('git -C "' .. file_dir .. '" rev-parse --show-toplevel')

        if vim.v.shell_error ~= 0 or #result == 0 then
          return nil, "Not inside a Git repository"
        end

        return result[1]
      end

      local function get_repo_root()
        local current_file_dir = vim.fn.expand("%:p:h")
        local repo_dir = vim.fn.finddir(".repo", current_file_dir .. ";") -- /home/sdhm/test/.repo

        if repo_dir == "" then
          return nil, "Not inside a repo project"
        end
        -- vim.notify("Repo dir: " .. repo_dir)

        local repo_root = vim.fn.fnamemodify(repo_dir, ":p:h:h")
        -- vim.notify("Repo root: " .. repo_root)
        return repo_root
      end

      vim.keymap.set("n", "<leader><leader>", "<cmd>LeaderfBuffer<cr>", { desc = "Leader[F] Buffer" })
      vim.keymap.set("n", "<leader>fb", "<cmd>LeaderfBuffer<cr>", { desc = "Leader[F] [B]uffer" })
      vim.keymap.set("n", "<leader>fM", "<cmd>LeaderfMru<cr>", { desc = "Leader[F] [M]ru" })
      vim.keymap.set("n", "<leader>fm", "<cmd>Leaderf mru --project<cr>", { desc = "Leader[F] [M]ru in project" })
      vim.keymap.set("n", "<leader>ff", "<cmd>Leaderf function<cr>", { desc = "Leader[F] [F]unction" })
      vim.keymap.set("n", "<leader>ft", "<cmd>LeaderfBufTag<cr>", { desc = "Leader[F] BufTag ([S]ymbols)" })
      vim.keymap.set("n", "<leader>fh", "<cmd>LeaderfHistoryCmd<cr>", { desc = "Leader[F] [H]istoryCmd" })
      vim.keymap.set("n", "<leader>fR", "<cmd>Leaderf gtags --remove<cr>", { desc = "Leader[F] [R]emove gtags" })
      -- vim.keymap.set("n", "<leader>fu", "<cmd>Leaderf gtags --update<cr>", { desc = "Leader[F] [U]pdate gtags" })
      vim.keymap.set("n", "<leader>fG", function() vim.cmd("Leaderf rg -F " .. vim.fn.expand("<cword>")) end, { desc = "Leader[F] [G]rep" })
      vim.keymap.set("n", "<leader>fd", function() vim.api.nvim_feedkeys((":Leaderf gtags -d %s"):format(""), "n", false) end, { desc = "Leader[F] [G]rep" })
      -- vim.keymap.set("n", "<leader>f",  "<cmd>LeaderfBufTag<cr>", { desc = "Leader[F] BufTag" })
      -- vim.keymap.set("n", "<leader>p", "<cmd>LeaderfFile<cr>", { desc = "Leader[F] File" })
      vim.keymap.set("n", "<leader>P", ":Leaderf file --input ", { desc = "Leader[F] File with input" })
      vim.keymap.set("n", "<leader>o", "<cmd>Leaderf --recall<cr>", { desc = "Leader[F] [R]ecall" })
      vim.keymap.set("n", "<leader>r", function() vim.cmd("Leaderf gtags -r " .. vim.fn.expand("<cword>")) end, { desc = "Leader[F] gtags [R]eference" })
      vim.keymap.set("n", "<leader>d", function() vim.cmd("Leaderf gtags -d " .. vim.fn.expand("<cword>")) end, { desc = "Leader[F] gtags [D]efine" })
      vim.keymap.set("n", "<leader>l", "<cmd>LeaderfLine<cr>", { desc = "Leader[F] [L]ine" })
      vim.keymap.set("n", "<leader>b", "<cmd>Leaderf git blame<cr>", { desc = "Leader[F] git [B]lame" })
      -- vim.keymap.set("n", "<leader>i", "Leaderf snippet<cr>", { desc = "Leader[F] snippet" }) -- Insert snippet at current cursor position
      vim.keymap.set("n", "<leader>i", "o<C-\\><C-O>:Leaderf snippet<CR>", { desc = "Leader[F] snippet" }) -- Insert line below and insert snippet

      -- find gtags in git repo
      local function gtags_cur_gitdir(tag)
        local git_root, err = get_git_root()
        if not git_root then
          vim.notify(err, vim.log.levels.WARN)
          return
        end

        vim.notify("Find gtags in git dir: " .. git_root)

        vim.cmd(("Leaderf gtags -d %s -S %s"):format(tag, git_root)) -- will not add to cmd history
        -- vim.api.nvim_feedkeys((":Leaderf gtags -d %s -S %s\n"):format(tag, git_root), "n", false) -- will not add to cmd history (because of \n)

        -- local cmd = ("Leaderf gtags -d %s -S %s"):format(tag, git_root)
        -- vim.fn.histadd("cmd", cmd) -- add to cmd history
        -- vim.cmd(cmd)
      end
      vim.keymap.set("n", "<Leader>D", function() gtags_cur_gitdir(vim.fn.expand("<cword>")) end, { desc = "Leader[F] gtags [D]efine in git repo" })

      -- find files in git repo
      local function files_cur_gitdir()
        local git_root, err = get_git_root()
        if not git_root then
          vim.notify(err, vim.log.levels.WARN)
          return
        end

        vim.notify("Find files in git dir: " .. git_root)

        -- NOTE: support cmd: file <dir1> <dir2> --input <filename>
        -- NOTE: dir should be in subdirectory of cwd
        vim.api.nvim_feedkeys((":Leaderf file %s --input "):format(git_root), "n", false) -- will add to cmd history (because there is no \n)
      end
      vim.keymap.set("n", "<Leader>fp", function() files_cur_gitdir() end, { desc = "Leader[F] files in git repo" })

      -- find files in specific dirs
      -- vim.keymap.set("n", "<leader>p", function()
      --   local cmd = "Leaderf file ~/test/test1 ~/test/test2"
      --   vim.notify(cmd)
      --   vim.cmd("Leaderf file ~/test/test1 ~/test/test2")
      --   vim.fn.histadd("cmd", cmd)
      -- end, { desc = "Leader[F] File in specific dirs" })

      -- find files in repo dirs
      local function files_in_repo_dirs()
        local repo_root, error_message = get_repo_root()

        if not repo_root then
          vim.notify(error_message, vim.log.levels.WARN)
          return
        end

        local search_directories = {
          repo_root .. "/test1",
          repo_root .. "/test2",
        }

        local cmd = "Leaderf file " .. table.concat(search_directories, " ") .. " --nameOnly"
        vim.notify(cmd)
        vim.cmd(cmd)
        vim.fn.histadd("cmd", cmd)
      end
      vim.keymap.set("n", "<leader>P", files_in_repo_dirs, { desc = "Leader[F] File in repo dirs"})

      -- grep in git repo
      local function grep_cur_gitdir(word)
        local git_root, err = get_git_root()
        if not git_root then
          vim.notify(err, vim.log.levels.WARN)
          return
        end

        vim.notify("Grep in git dir: " .. git_root)

        -- NOTE: support cmd: rg foo <dir1> <dir2> -e <string>
        -- NOTE: dir need not be in subdirectory of cwd
        vim.api.nvim_feedkeys((":Leaderf rg -F %s -e %s"):format(git_root, word), "n", false) -- will add to cmd history (because there is no \n)
      end
      vim.keymap.set("n", "<Leader>fg", function() grep_cur_gitdir(vim.fn.expand("<cword>")) end, { desc = "Leader[F] [G]rep in git repo" })


      -- GTAGS async generator with heartbeat and command display
      local running = false

      -- Find project root based on Lf_RootMarkers
      local function find_root()
        local markers = vim.g.Lf_RootMarkers
        if not markers or type(markers) ~= "table" or #markers == 0 then
          error("Lf_RootMarkers is not defined or empty")
        end

        local dir = vim.fn.expand("%:p:h")
        while dir ~= "/" do
          for _, m in ipairs(markers) do
            if vim.fn.isdirectory(dir .. "/" .. m) == 1 then
              return dir
            end
          end
          dir = vim.fn.fnamemodify(dir, ":h")
        end
      end

      -- Convert root to LeaderF GTAGS path
      local function gtags_path(root)
        return vim.fn.expand("~/.cache/LeaderF/gtags/" .. root:gsub("^/",""):gsub("/","-"))
      end

      -- Main GTAGS generator
      local function gen_gtags()
        if running then return vim.notify("GTAGS is already running") end
        if vim.fn.executable("gtags") == 0 then return vim.notify("gtags not found") end

        local root = find_root()
        if not root then return vim.notify("No project root found") end

        local out = gtags_path(root)
        vim.fn.mkdir(out, "p")

        -- Heartbeat interval in seconds
        local interval = vim.g.gtags_heartbeat_interval or 1

        local cmd = { "gtags", "-i", "--skip-symlink", "--statistics", "--gtagslabel", "default", out }
        vim.notify("🔄 GTAGS started:\n" .. table.concat(cmd, " "))

        running = true
        local start = vim.loop.hrtime()

        -- Heartbeat timer
        local timer = vim.loop.new_timer()
        timer:start(interval * 1000, interval * 1000, function()
          vim.schedule(function()
            local elapsed = (vim.loop.hrtime() - start) / 1e9
            vim.notify(string.format("⏳ GTAGS running: %.1fs elapsed", elapsed))
          end)
        end)

        local output = {}

        vim.fn.jobstart(cmd, {
          cwd = root,
          stdout_buffered = true,
          stderr_buffered = true,
          on_stdout = function(_, data)
            if data then for _, l in ipairs(data) do if l~="" then table.insert(output,l) end end end
          end,
          on_stderr = function(_, data)
            if data then for _, l in ipairs(data) do if l~="" then table.insert(output,l) end end end
          end,
          on_exit = function(_, code)
            running = false
            timer:stop(); timer:close()
            local elapsed = (vim.loop.hrtime()-start)/1e9

            vim.schedule(function()
              if code == 0 then
                vim.notify(string.format("✅ GTAGS done (%.2fs)", elapsed))
              else
                vim.notify(string.format("❌ GTAGS failed (code=%d, %.2fs)", code, elapsed), vim.log.levels.ERROR)
              end

              if #output > 0 then
                vim.notify(table.concat(output,"\n"))
              end
            end)
          end
        })
      end
      vim.keymap.set("n","<leader>fU",gen_gtags,{desc="Leader[F] [U]pdate gtags"})
    end,
  },
}


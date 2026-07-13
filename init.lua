--Plugins
require("config.lazy")
require("config.colors")

--lualine
--minimal: require('lualine').setup()
--alternative (super configurable)
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    always_show_tabline = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
      refresh_time = 16, -- ~60fps
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

--colorscheme/syntax
vim.cmd.colorscheme("catppuccin-nvim")
--vim.cmd.colorscheme("tokyonight-night")
vim.cmd("syntax on") --supposedly this is unnecessary in neovim since colorschemes and configs usually enable this automatically, but I'll keep it until I understand how things work a little bit better
vim.cmd("highlight CursorColumn ctermbg=white")

--setting options
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.matchpairs:append("<:>")
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.wildmenu = true
vim.opt.background = 'dark'
vim.opt.timeout = false --keys requiring additional keys will wait forever until a key combo triggers an event
vim.opt.ttimeout = true
vim.opt.ttimeoutlen = 500
vim.opt.hlsearch = false

--tab stuff
--tab should ALWAYS be 2 spaces; quit trying to get wise, special filetypes (looking at you, /usr/share/nvim/runtime/ftplugin/*.vim)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.bo.shiftwidth = 2
    vim.bo.softtabstop = 2
    vim.bo.tabstop = 2
  end,
})

vim.g.mapleader = " "

vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

--util functions
local function move_cursor_left(n)
  return vim.api.nvim_replace_termcodes(
    string.rep("<Left>", n),
    true,
    false,
    true
  )
end

local function flashCursor()
  vim.opt.cursorline = true
  vim.opt.cursorcolumn = true
  vim.defer_fn(function()
    vim.opt.cursorline = false
    vim.opt.cursorcolumn = false
  end, 500)
end

vim.api.nvim_create_user_command("W", "write", {})

--flash cursor
vim.keymap.set("n", "<leader><leader>", flashCursor)

--disable Q since I never enter Ex mode
vim.keymap.set("n", "Q", "<Nop>")

--generic movement helps
vim.keymap.set("n", "<leader>i", "ggVG:s/  /  /g<CR>")

--filesystem manipulation
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wa<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>X", ":xa<CR>")
vim.keymap.set("n", "ZA", ":xa<CR>")
vim.keymap.set("n", "<leader>Q", "ZQ")

--filesystem with fill-in-the-blank functionality
vim.keymap.set("n", "<leader>e", ":e ")
vim.keymap.set("n", "<leader>s", ":split ")
vim.keymap.set("n", "<leader>S", ":vsplit ")

vim.keymap.set("n", "<leader>ve", ":w<CR>viWy:e <C-r>0<CR>:echo 'remember you can switch between files with leader+o or Ctl+^'<CR>")
vim.keymap.set("n", "<leader>vs", "viWy:split <C-r>0<CR>")
vim.keymap.set("n", "<leader>vS", "viWy:vsplit <C-r>0<CR>")
vim.keymap.set("n", "<leader>vt", "viWy:tabnew <C-r>0<CR>")

vim.keymap.set("v", "<leader>ve", "<Esc>:w<CR>gvy:e <C-r>0<CR>:echo 'remember you can switch between files with leader+o or Ctl+^'<CR>")
vim.keymap.set("v", "<leader>vs", "y:split <C-r>0<CR>")
vim.keymap.set("v", "<leader>vS", "y:vsplit <C-r>0<CR>")
vim.keymap.set("v", "<leader>vt", "y:tabnew <C-r>0<CR>")

--filesystem
local function rename_file()
  local old = vim.fn.expand("%:t")
  local file_head = vim.fn.expand("%:h")
  local new = vim.fn.input("New name: ")
  if new == "" then
    vim.cmd("redraw")
    print("Rename cancelled")
    return
  end
  vim.cmd("file " .. file_head .. "/" .. new)
  vim.cmd("write")
  vim.fn.delete(old)
end 

--window/pane navigation
vim.keymap.set("n", "<leader>h", "<C-w>h")
vim.keymap.set("n", "<leader>j", "<C-w>j")
vim.keymap.set("n", "<leader>k", "<C-w>k")
vim.keymap.set("n", "<leader>l", "<C-w>l")
vim.keymap.set("n", "<leader>H", "<C-w>H")
vim.keymap.set("n", "<leader>J", "<C-w>J")
vim.keymap.set("n", "<leader>K", "<C-w>K")
vim.keymap.set("n", "<leader>L", "<C-w>L")
vim.keymap.set("n", "<leader>r", "<C-w>r")
vim.keymap.set("n", "<leader>=", "<C-w>=")
vim.keymap.set("n", "<leader>o", ":w<CR><C-^>")

--echo output keymaps
vim.keymap.set("n", "<leader>%", function()
  print(vim.fn.expand("%:p"))
end)

--tab navigation
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>te", ":tabnew ")
vim.keymap.set("n", "<leader>tE", "viWy:tabnew <C-r>0<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tO", ":tab split<CR>gT:x<CR>gt")
vim.keymap.set("n", "K", "<cmd>tabnext<CR>")
vim.keymap.set("n", "J", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "<leader>t>", "<cmd>tabmove<CR>")
vim.keymap.set("n", "<leader>1", "<cmd>tabn 1<CR>")
vim.keymap.set("n", "<leader>2", "<cmd>tabn 2<CR>")
vim.keymap.set("n", "<leader>3", "<cmd>tabn 3<CR>")
vim.keymap.set("n", "<leader>4", "<cmd>tabn 4<CR>")
vim.keymap.set("n", "<leader>5", "<cmd>tabn 5<CR>")
vim.keymap.set("n", "<leader>6", "<cmd>tabn 6<CR>")
vim.keymap.set("n", "<leader>7", "<cmd>tabn 7<CR>")
vim.keymap.set("n", "<leader>8", "<cmd>tabn 8<CR>")
vim.keymap.set("n", "<leader>9", "<cmd>tabn 9<CR>")
vim.keymap.set("n", "<leader>0", "<cmd>tabn 10<CR>")

--keymap settings
vim.keymap.set("n", "<leader>mh", ":set hlsearch<CR>")
vim.keymap.set("n", "<leader>mH", ":set nohlsearch<CR>")
vim.keymap.set("n", "<leader>mn", ":set number<CR>")
vim.keymap.set("n", "<leader>mN", ":set nonumber<CR>")
vim.keymap.set("n", "<leader>mr", ":set relativenumber<CR>")
vim.keymap.set("n", "<leader>mR", ":set norelativenumber<CR>")
vim.keymap.set("n", "<leader>mt", ":set textwidth=")
vim.keymap.set("n", "<leader>mT", ":set textwidth=0<CR>")
vim.keymap.set("n", "<leader>mw", ":set wrap<CR>")
vim.keymap.set("n", "<leader>mW", ":set nowrap<CR>")

--copy/paste/clipboard
local function copy_whole_file()
  local buffer_as_file = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local buffer_as_string = table.concat(buffer_as_file, "\n")
  vim.fn.setreg("+", buffer_as_string) --copies buffer as string to clipboard
  local file_name = vim.fn.expand("%")
  print("copied entire current file '" .. file_name .. "' to clipboard")
end

vim.keymap.set("n", "<leader>ya", copy_whole_file)

vim.keymap.set("n", "<leader>yp", function()
  vim.cmd([[normal! mmvap"+y'm]])
  print("copied paragraph to clipboard")
end)

vim.keymap.set("n", "<leader>yw", function()
  vim.cmd([[normal! yiw]])
  local word = vim.fn.getreg("0")
  vim.fn.setreg("+", word)
  print("copied current word '" .. word .. "' to clipboard")
end)

vim.keymap.set("n", "<leader>yW", function()
  vim.cmd([[normal! yiW]])
  local word = vim.fn.getreg("0")
  vim.fn.setreg("+", word)
  print("copied current WORD '" .. word .. "' to clipboard")
end)

vim.keymap.set("n", "<leader>yy", function()
  vim.cmd([[normal! yy]])
  local line = vim.fn.getreg("0")
  vim.fn.setreg("+", line)
  print("copied current line to clipboard")
end)

vim.keymap.set("n", "<leader>y$", function()
  vim.cmd([[normal! y$]])
  local cursor_to_line_end = vim.fn.getreg("0")
  vim.fn.setreg("+", cursor_to_line_end)
  print("copied cursor through end of line to clipboard")
end)

vim.keymap.set("n", "<leader>y%", function()
  local absolute_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", absolute_path)
  print("copied " .. absolute_path)
end)

vim.keymap.set("n", "<leader>y}", function()
  vim.cmd([[normal! y}]])
  local cursor_to_paragraph_end = vim.fn.getreg("0")
  vim.fn.setreg("+", cursor_to_paragraph_end)
  print("copied cursor through end of paragraph to clipboard")
end)

vim.keymap.set("n", "<leader>y'", function()
  vim.cmd([[normal! yi']])
  local text_in_single_quotes = vim.fn.getreg("0")
  vim.fn.setreg("+", text_in_single_quotes)
  print("copied text inside single quotes")
end)

vim.keymap.set("n", '<leader>y"', function()
  vim.cmd([[normal! yi"]])
  local text_in_double_quotes = vim.fn.getreg("0")
  vim.fn.setreg("+", text_in_double_quotes)
  print("copied text inside double quotes")
end)

vim.keymap.set("v", '<leader>y', "\"+y")

vim.keymap.set("n", "<leader>p", function()
  vim.cmd([[normal! "+p]])
  print("pasted from clipboard")
end)

vim.keymap.set("n", "<leader>P", function()
  vim.cmd([[normal! "+P]])
  print("pasted above from clipboard")
end)

vim.keymap.set("v", "<leader>x", function()
  vim.cmd([[normal! "+d]])
  print("cut current selection to clipboard")
end)

--replacement
vim.keymap.set("n", "<leader>R", function()
  local current_word = vim.fn.expand("<cword>")
  local move_left_thrice_term_codes = move_cursor_left(3)
  vim.fn.feedkeys(":%s/" .. current_word .. "//gc" .. move_left_thrice_term_codes) --n flag at the end tells neovim not to remap the keys
end)

--open something from vim
vim.keymap.set("n", "<leader>G", function() 
  vim.fn.feedkeys(":!xdg-open 'https://www.google.com/search?q='" .. move_cursor_left(1))
end)

vim.keymap.set("v", "<leader>g", function()
  vim.cmd([[normal! y]])
  local search_query = vim.fn.getreg("0")
  vim.fn.system(
    "xdg-open 'https://google.com/search?q=" .. search_query .. "'"
  )
end)

--language-specific keymaps
--get markdownlivepreview of current file
vim.keymap.set("n", "<leader>M", function()
  copy_whole_file()
  vim.fn.system('xdg-open "https://markdownlivepreview.com/"')
end)

--inline bash keymaps
vim.keymap.set("n", "!@", ":%!")
vim.keymap.set("n", "!#", "ggO#!/bin/bash<esc>j0")

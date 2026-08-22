--Plugins
require("config.lazy")

require("config.colors")
require("config.diagnostics")
require("config.mermaid")
--require("config.evil_lualine")
require("config.main_lualine")

--colorscheme/syntax
vim.cmd.colorscheme("catppuccin-nvim")
--vim.cmd.colorscheme("tokyonight-night")

--keymaps
require("keymaps.lsp")

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
vim.opt.relativenumber = true
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
vim.g.harpoonmode = true --this one I made up for leader+num custom navigation behavior

vim.keymap.set("n", ">", ">>")
vim.keymap.set("n", "<", "<<")

--sessions
vim.api.nvim_create_user_command("SaveSession", function()
  vim.cmd("wa")
  local session_name = vim.fn.input("What would you like to name session before saving? ")
  if session_name == "" then
    print("Session save cancelled")
    return
  end
  local session_dir = "~/.config/nvim/sessions"
  local session_file = session_dir .. "/" .. session_name .. ".vim"
  vim.cmd("mksession! " .. vim.fn.fnameescape(session_file))
  print("Session saved in file \"" .. session_file .. "\"")
end, {})

--[[
vim.api.nvim_create_user_command("LoadSession", function()
  local session_dir = "~/.config/nvim/sessions"
  local sessions = vim.fn.glob(session_dir .. "/*.vim", false, true)
  if #sessions == 0 then
    print("No sessions found")
    return
  end
  print("Sessions:")
  for _, path in ipairs(sessions) do
    local name = vim.fn.fnamemodify(path, ":t:r")
    print("  - " .. name)
  end
  local session_name = vim.fn.input("Session to load: ")
  if session_name == "" then
    print("Session load cancelled")
  end
  local session_file = session_dir .. "/" .. session_name .. ".vim"
  print("Session file = \"" .. session_file .. "\"")
  if vim.fn.filereadable(vim.fn.expand(session_file)) == 1 then
    print()
    print("session not found: " .. session_name)
    return
  end
  vim.cmd("source " .. vim.fn.fnameescape(session_file))
  print("Loaded session: " .. session_name)
end, {})
--]]

vim.keymap.set("n", "<leader>qw", ":SaveSession<CR>")
vim.keymap.set("n", "<leader>qe", ":LoadSession<CR>")

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

local function follow_link(link)
  link = link:gsub("^.*%(+", ""):gsub("%)+.*$", "")
  print(link)
  if link:match("^http") then
    vim.fn.system(
      "xdg-open '" .. link .. "'"
    )
  elseif vim.uv.fs_stat(link) then
    vim.cmd("edit " .. link)
  else
    vim.fn.system(
      "xdg-open 'https://google.com/search?q=" .. link .. "'"
    )
  end
end

vim.api.nvim_create_user_command("W", "write", {})

--flash cursor
vim.keymap.set("n", "<leader><leader>", flashCursor)

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

vim.keymap.set("v", "<leader>h", "<Esc><C-w>h")
vim.keymap.set("v", "<leader>j", "<Esc><C-w>j")
vim.keymap.set("v", "<leader>k", "<Esc><C-w>k")
vim.keymap.set("v", "<leader>l", "<Esc><C-w>l")

--file keymaps
vim.keymap.set("n", "<leader>%%", function()
  print(vim.fn.expand("%:p"))
end)

--note: this keymap is identical to "<leader>y%"
vim.keymap.set("n", "<leader>%y", function()
  local absolute_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", absolute_path)
  print("copied " .. absolute_path)
end)

vim.keymap.set("n", "<leader>%h", function()
  if vim.bo.filetype == "html" then
    local absolute_path = vim.fn.expand("%:p")
    vim.fn.jobstart({ "xdg-open", absolute_path }, { detach = true })
    print("opened '" .. absolute_path .. "' file in browser")
  else
    print("refused to open non-html file in browser")
  end
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

--tab/harpoon navigation
local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>1", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 1")
    harpoon:list():select(1)
  else
    print("Select tab 1")
    if 1 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 1")
    end
  end
end)
vim.keymap.set("n", "<leader>2", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 2")
    harpoon:list():select(2)
  else
    print("Select tab 2")
    if 2 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 2")
    end
  end
end)
vim.keymap.set("n", "<leader>3", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 3")
    harpoon:list():select(3)
  else
    print("Select tab 3")
    if 3 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 3")
    end
  end
end)
vim.keymap.set("n", "<leader>4", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 4")
    harpoon:list():select(4)
  else
    print("Select tab 4")
    if 4 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 4")
    end
  end
end)
vim.keymap.set("n", "<leader>5", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 5")
    harpoon:list():select(5)
  else
    print("Select tab 5")
    if 5 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 5")
    end
  end
end)
vim.keymap.set("n", "<leader>6", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 6")
    harpoon:list():select(6)
  else
    print("Select tab 6")
    if 6 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 6")
    end
  end
end)
vim.keymap.set("n", "<leader>7", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 7")
    harpoon:list():select(7)
  else
    print("Select tab 7")
    if 7 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 7")
    end
  end
end)
vim.keymap.set("n", "<leader>8", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 8")
    harpoon:list():select(8)
  else
    print("Select tab 8")
    if 8 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 8")
    end
  end
end)
vim.keymap.set("n", "<leader>9", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 9")
    harpoon:list():select(9)
  else
    print("Select tab 9")
    if 9 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 9")
    end
  end
end)
vim.keymap.set("n", "<leader>0", function()
  if vim.g.harpoonmode == true then
    print("Select harpoon file 10")
    harpoon:list():select(10)
  else
    print("Select tab 10")
    if 10 <= vim.fn.tabpagenr("$") then
      vim.cmd("tabn 10")
    end
  end
end)

--keymap settings
vim.keymap.set("n", "<leader>ma", function()
  if vim.g.harpoonmode == true then
    vim.g.harpoonmode = false
    print("harpoonmode = false")
  else
    vim.g.harpoonmode = true
    print("harpoonmode = true")
  end
end)
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

vim.keymap.set("n", "<leader>y)", "\"+yi):lua print(\"copied content within parentheses to clipboard\")<CR>")
vim.keymap.set("n", "<leader>y]", "\"+yi]:lua print(\"copied content within square brackets to clipboard\")<CR>")
vim.keymap.set("n", "<leader>y}", "\"+yi}:lua print(\"copied content within curly braces to clipboard\")<CR>")
vim.keymap.set("n", "<leader>y'", "\"+yi':lua print(\"copied content within single quotes to clipboard\")<CR>")
vim.keymap.set("n", '<leader>y"', '\"+yi\":lua print(\"copied content within double quotes to clipboard\")<CR>')
vim.keymap.set("n", '<leader>y`', "\"+yi`:lua print(\"copied content within backticks to clipboard\")<CR>")

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

vim.keymap.set("n", "<leader>O", function()
  vim.cmd([[normal! yiW]])
  local link = vim.fn.getreg("0")
  follow_link(link)
end)

vim.keymap.set("v", "<leader>O", function()
  vim.cmd([[normal! y]])
  local link = vim.fn.getreg("0")
  follow_link(link)
end)

--enter case-insensitive search
vim.keymap.set("n", "<leader>/", function()
  vim.fn.feedkeys("/\\c" .. move_cursor_left(2))
end)

--inline bash keymaps
vim.keymap.set("n", "!@", ":%!")
vim.keymap.set("n", "!#", "ggO#!/bin/bash<esc>j0")

--lazy.nvim
vim.keymap.set("n", "<leader>Z", ":Lazy<CR>")

--priorities and to-do list work
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.keymap.set("n", "<leader>T", function()
      local filename = vim.fn.expand("%:t")
      local title = filename
        :gsub("%_", " ")
        :gsub("%.md$", "")
        :gsub("%S+", function(word)
          return word:sub(1, 1):upper() .. word:sub(2):lower()
        end)
        vim.api.nvim_buf_set_lines(0, 0, 0, false, {
          "# " .. title,
        })
        vim.cmd("startinsert")
    end, { desc = "Convert .md file to heading for said .md file" })
  end
})

--language-specific keymaps
--get markdownlivepreview of current file
vim.keymap.set("n", "<leader>M", function()
  copy_whole_file()
  vim.fn.system('xdg-open "https://markdownlivepreview.com/"')
end)

--insert mode
--for some reason, Ctrl+h is also the same as Ctrl+Backspace, so this works as a platform-independent way to backspace a word at a time in insert mode:
vim.keymap.set("i", "<C-h>", "<C-w>")

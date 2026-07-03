vim.cmd("syntax on") --supposedly this is unnecessary in neovim since colorschemes and configs usually enable this automatically, but I'll keep it until I understand how things work a little bit better
vim.cmd("highlight CursorColumn ctermbg=white")

vim.opt.fileencoding = 'utf-8'
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

vim.api.nvim_create_user_command("W", "write", {})

--disable Q since I never enter Ex mode
vim.keymap.set("n", "Q", "<Nop>")

--generic movement helps
vim.keymap.set("n", "<leader>i", "ggVG:s/  /  /g<CR>")

--page navigation
vim.keymap.set("n", "<leader>d", "<C-d>zz")
vim.keymap.set("n", "<leader>u", "<C-u>zz")
vim.keymap.set("n", "<leader>f", "<C-f>zz")
vim.keymap.set("n", "<leader>b", "<C-b>Hzz")

--filesystem manipulation
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wa<CR>")
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>X", ":xa<CR>")
vim.keymap.set("n", "ZA", ":xa<CR>")
vim.keymap.set("n", "<leader>Q", "ZQ")

--filesystem with fill-in-the-blank functionality
vim.keymap.set("n", "<leader>e", ":e ")
vim.keymap.set("n", "<leader>E", ":wa<CR>:windo e ")
vim.keymap.set("n", "<leader>s", ":split ")
vim.keymap.set("n", "<leader>S", ":vsplit ")

vim.keymap.set("n", "<leader>ve", ":w<CR>viwy:e <C-r>0<CR>:echo 'remember you can switch between files with leader+o or Ctl+^'<CR>")
vim.keymap.set("n", "<leader>vs", "viwy:split <C-r>0<CR>")
vim.keymap.set("n", "<leader>vS", "viwy:vsplit <C-r>0<CR>")
vim.keymap.set("n", "<leader>vt", "viwy:tabnew <C-r>0<CR>")

vim.keymap.set("v", "<leader>ve", "<Esc>:w<CR>gvy:e <C-r>0<CR>:echo 'remember you can switch between files with leader+o or Ctl+^'<CR>")
vim.keymap.set("v", "<leader>vs", "y:split <C-r>0<CR>")
vim.keymap.set("v", "<leader>vS", "y:vsplit <C-r>0<CR>")
vim.keymap.set("v", "<leader>vt", "y:tabnew <C-r>0<CR>")

--fancy
local function rename_file()
  local old = vim.fn.expand("%:t")
  local new = vim.fn.input("New name: ")
  if new == "" then
    vim.cmd("redraw")
    print("Rename cancelled")
    return
  end
  vim.cmd("file " .. new)
  vim.cmd("write")
  vim.fn.delete(old)
end 
vim.keymap.set("n", "<leader>n", rename_file)

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
vim.keymap.set("n", "<leader>ya", function()
  local buffer_as_file = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local buffer_as_string = table.concat(buffer_as_file, "\n")
  vim.fn.setreg("+", buffer_as_string) --copies buffer as string to clipboard
  local file_name = vim.fn.expand("%")
  print("copied entire current file '" .. file_name .. "' to the clipboard")
end)

vim.keymap.set(
  "n",
  "<leader>yp",
  'mmvap"+y`m:echo "copied paragraph to clipboard"<CR>'
)

vim.keymap.set("n", "<leader>yw", function()
  vim.cmd([[normal! yiW]])
  local word = vim.fn.getreg("0")
  vim.fn.setreg("+", word)
  print("copied current word '" .. vim.fn.getreg("+") .. "' to clipboard")
end)

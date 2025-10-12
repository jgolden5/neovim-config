print("keymaps.lua loaded") --
vim.cmd("command! W w") --equivalent to: vim.api.nvim_set_keymap('c', 'W', 'w', { noremap = true }), EXCEPT that in the latter, hitting :W actually displays :w, which it is effectively treated as

vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = "move left window" })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = "move down window" })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = "move up window" })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = "move right window" })
vim.keymap.set('n', '<leader>u', '<C-u>zz', { desc = "move up 1/2 page and recenter" })
vim.keymap.set('n', '<leader>d', '<C-d>zz', { desc = "move down 1/2 page and recenter" })
vim.keymap.set('n', '<leader>b', '<C-b>zz', { desc = "move up 1 page and recenter" })
vim.keymap.set('n', '<leader>f', '<C-f>zz', { desc = "move down 1 page and recenter" })
vim.keymap.set('n', '<leader>r', function()
  vim.cmd("source ~/.config/nvim/init.lua")
  print("Sourced nvim init.lua config file")
end, { desc = "Reload nvim init.lua config" })

vim.keymap.set('n', 'ZA', ':qa<CR>', { desc = "quit all shortcut" })

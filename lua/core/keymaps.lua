vim.cmd("command! W w") --equivalent to: vim.api.nvim_set_keymap('c', 'W', 'w', { noremap = true }), EXCEPT that in the latter, hitting :W actually displays :w, which it is effectively treated as

vim.keymap.set('n', '<leader>h', '<C-w>h', { desc = "move left window" })
vim.keymap.set('n', '<leader>j', '<C-w>j', { desc = "move down window" })
vim.keymap.set('n', '<leader>k', '<C-w>k', { desc = "move up window" })
vim.keymap.set('n', '<leader>l', '<C-w>l', { desc = "move right window" })
vim.keymap.set('n', '<leader>r', function()
  vim.cmd("source ~/.config/nvim/init.lua")
  print("Sourced nvim init.lua config file")
end, { desc = "Reload nvim init.lua config" })
print("keymaps.lua loaded") --

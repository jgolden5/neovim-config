vim.cmd("command! W w") --equivalent to: vim.api.nvim_set_keymap('c', 'W', 'w', { noremap = true }), EXCEPT that in the latter, hitting :W actually displays :w, which it is effectively treated as

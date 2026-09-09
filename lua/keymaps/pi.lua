-- Ask pi with the current buffer as context
vim.keymap.set("n", "<leader>A", ":PiAsk<CR>", { desc = "Ask pi" })

-- Ask pi with visual selection as context
vim.keymap.set("v", "<leader>A", ":PiAskSelection<CR>", { desc = "Ask pi (selection)" })

vim.keymap.set("n", "<leader>zs", ":PiLog<CR>", { desc = "Open session log in a new split" })

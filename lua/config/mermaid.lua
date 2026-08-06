vim.api.nvim_create_autocmd("FileType", {
  pattern = { "mermaid", },
  callback = function()
    vim.keymap.set("n", "<leader>mmp", ":MermaidPreview<CR>")
    vim.keymap.set("n", "<leader>mmf", ":MermaidFormat<CR>")
    vim.keymap.set("n", "<leader>mmr", ":MermaidRender<CR>")
    vim.keymap.set("n", "<leader>mmc", ":MermaidCopyURL<CR>")
    vim.keymap.set("n", "<leader>mmx", ":MermaidPreviewStop<CR>")
  end,
})

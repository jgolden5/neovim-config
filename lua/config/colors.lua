vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0000ff" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#00bbff" })
  end,
})

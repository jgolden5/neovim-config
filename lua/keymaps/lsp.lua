--basic lsp functionality
vim.keymap.set("n", "<leader>bd", function() vim.lsp.buf.definition() end, opts)
vim.keymap.set("n", "<leader>bh", function() vim.lsp.buf.hover() end, opts)
vim.keymap.set("n", "<leader>bi", function() vim.lsp.buf.incoming_calls() end, opts)
vim.keymap.set("n", "<leader>bj", function() vim.lsp.buf.document_symbol() end, opts)
vim.keymap.set("n", "<leader>bJ", function() vim.lsp.buf.workspace_symbol() end, opts)

--diagnostics
vim.keymap.set("n", "<leader>dd", function()
  vim.diagnostic.open_float()
end, { desc = "open diagnostic on current line, regardless of diagnostic type" })
vim.keymap.set("n", "<leader>de", function()
  vim.diagnostic.open_float(0, {
    severity = vim.diagnostic.severity.ERROR
  })
end, { desc = "show errors in current buffer" })
vim.keymap.set("n", "<leader>dw", function()
  vim.diagnostic.open_float(0, {
    severity = vim.diagnostic.severity.WARN
  })
end, { desc = "show warnings in current buffer" })
vim.keymap.set("n", "<leader>di", function()
  vim.diagnostic.open_float(0, {
    severity = vim.diagnostic.severity.INFO
  })
end, { desc = "show info in current buffer" })
vim.keymap.set("n", "<leader>dh", function()
  vim.diagnostic.open_float(0, {
    severity = vim.diagnostic.severity.HINT
  })
end, { desc = "show hints in current buffer" })

vim.keymap.set("n", "<leader>da", function()
  local diags = vim.diagnostic.get(0)
  if vim.tbl_isempty(diags) then
    vim.notify("No diagnostics")
    return
  end

  local lines = {}

  for _, d in ipairs(diags) do
    table.insert(
      lines,
      string.format(
        "L%d:C%d %s",
        d.lnum + 1,
        d.col + 1,
        d.message
      )
    )
  end

  vim.lsp.util.open_floating_preview(
    lines,
    "text",
    { border = "rounded" }
  )
end, { desc = "Show all diagnostics in file", })

--md keymaps
vim.keymap.set("n", "<leader>D", ":Telescope lsp_document_symbols<CR>", opts)

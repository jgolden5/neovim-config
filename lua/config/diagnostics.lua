return {
  {
    vim.diagnostic.config({
      virtual_text = {
        current_line = true, -- Only shows diagnostics for the current cursor line
      },
    })
  }
}

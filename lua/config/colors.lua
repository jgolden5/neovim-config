vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0000ff" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#00bbff" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffff00" })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.codes",
  callback = function()
    vim.bo.filetype = "codes"

    vim.cmd([[
      syntax clear
      syntax keyword alarisCode ALARIS
      syntax keyword nvimCode NVIM
      syntax keyword CQ40Code CQ40
      syntax keyword planCode PLAN

      highlight default alarisCode guifg=#ff0000 ctermfg=Red
      highlight default nvimCode guifg=#00ffff ctermfg=Cyan
      highlight default CQ40Code guifg=#008080 ctermfg=6
      highlight default planCode guifg=#9010F0 ctermfg=DarkMagenta
    ]])

    vim.cmd("highlight! link redCode redCode")
    vim.cmd("highlight! link ilearnCode ilearnCode")
    vim.cmd("highlight! link nvimCode nvimCode")
    vim.cmd("highlight! link CQ40Code CQ40Code")
  end,
  })

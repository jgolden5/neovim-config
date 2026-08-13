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
      syntax keyword CQ40Code CQ40
      syntax keyword SeekerCode SEEKER
      syntax keyword alarisCode ALARIS
      syntax keyword nvimCode NVIM
      syntax keyword planCode PLAN
      syntax keyword jobsearchCode JOBSEARCH
      syntax keyword crosserCode CROSSER
      syntax keyword tutorCode TUTOR

      highlight default planCode guifg=#9010F0 ctermfg=DarkMagenta
      highlight default alarisCode guifg=#ff0000 ctermfg=Red
      highlight default nvimCode guifg=#00aa00 ctermfg=DarkGreen
      highlight default CQ40Code guifg=#008080 ctermfg=6
      highlight default SeekerCode guifg=#00ffff ctermfg=Cyan
      highlight default jobsearchCode guifg=#ffff00 ctermfg=Yellow
      highlight default crosserCode guifg=#ffaa00 ctermfg=214
      highlight default tutorCode guifg=#dd8800 ctermfg=94
    ]])

    vim.cmd("highlight! link redCode redCode")
    vim.cmd("highlight! link ilearnCode ilearnCode")
    vim.cmd("highlight! link nvimCode nvimCode")
    vim.cmd("highlight! link CQ40Code CQ40Code")
  end,
  })

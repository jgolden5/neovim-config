vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#0000ff" })
    vim.api.nvim_set_hl(0, "CursorColumn", { bg = "#00bbff" })
    vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffff00" })
    vim.api.nvim_set_hl(0, "DapBreakpoint", {
      fg="#ff0000",
    })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", {
      fg="#880088",
    })
    vim.api.nvim_set_hl(0, "SignColumn", {
      fg = "#ffff00",
    })
    vim.api.nvim_set_hl(0, "NvimDapVirtualText", {
      fg = "#00ff00",
    })
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
    syntax keyword homeCode HOME
    syntax keyword planCode PLAN
    syntax keyword jobsearchCode JOBSEARCH
    syntax keyword crosserCode CROSSER
    syntax keyword trueflowCode TRUEFLOW
    syntax keyword tutorCode TUTOR
    syntax keyword reconCode RECON
    syntax keyword denaliCode DENALI

    highlight default planCode guifg=#9010F0 ctermfg=DarkMagenta
    highlight default alarisCode guifg=#ff0000 ctermfg=Red
    highlight default homeCode guifg=#00aa00 ctermfg=DarkGreen
    highlight default CQ40Code guifg=#008080 ctermfg=6
    highlight default SeekerCode guifg=#00ffff ctermfg=Cyan
    highlight default jobsearchCode guifg=#ffff00 ctermfg=Yellow
    highlight default crosserCode guifg=#ffbb00 ctermfg=215
    highlight default trueflowCode guifg=#ff9900 ctermfg=214
    highlight default tutorCode guifg=#dd8800 ctermfg=94
    highlight default reconCode guifg=#aa00ff ctermfg=181
    highlight default denaliCode guifg=#999999 ctermfg=Gray
    ]])

  end,
})


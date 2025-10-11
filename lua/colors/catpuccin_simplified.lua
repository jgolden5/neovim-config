-- ~/.config/nvim/lua/themes/catppuccin.lua
local colors = {
    base = "#1e1e2e",
    mantle = "#181825",
    text = "#cdd6f4",
    overlay0 = "#9399b2",
    red = "#f38ba8",
    green = "#a6e3a1",
    yellow = "#f9e2af",
    blue = "#89b4fa",
    mauve = "#cba6f7",
    peach = "#fab387",
}

-- basic syntax highlights
vim.cmd("highlight Normal guifg="..colors.text.." guibg="..colors.base)
vim.cmd("highlight Comment guifg="..colors.overlay0.." gui=italic")
vim.cmd("highlight Constant guifg="..colors.peach)
vim.cmd("highlight Identifier guifg="..colors.mauve)
vim.cmd("highlight Statement guifg="..colors.red)
vim.cmd("highlight Type guifg="..colors.yellow)
vim.cmd("highlight Special guifg="..colors.blue)

vim.opt.background = "dark"


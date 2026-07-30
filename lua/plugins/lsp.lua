return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("keymaps.lsp")
    end,
  },
}

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "cpp",
        "java",
        "lua",
        "python",
      },
      highlight = {
        enable = true,
      },
    },
  },
}

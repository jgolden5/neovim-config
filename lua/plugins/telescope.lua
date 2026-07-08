return {
  {
    'nvim-telescope/telescope.nvim', version = '*',
    --tag = 'v0.2.2',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- optional but recommended
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
      require("telescope").setup {
        pickers = {
          find_files = {
            theme = "ivy"
          }
        },
        extensions = {
          fzf = {}
        }
      }
      vim.keymap.set("n", "<leader>fs", function()
        require('telescope.builtin').find_files {
          cwd = "~/bd/stretch/stretch-work/"
        }
      end)
      vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files, { desc = "Fuzzy find files in current working directory" })
      vim.keymap.set("n", "<leader>ff", function ()
        require('telescope.builtin').find_files {
          cwd = "~"
        }
      end, { desc = "Fuzzy find files in home directory" })
      vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = "Fuzzy search nvim help" })
      vim.keymap.set("n", "<leader>fp", function ()
        require('telescope.builtin').find_files {
          cwd = '/mnt/c/Users/11045964/OneDrive - BD/Documents/Products'
        }
      end, { desc = "Fuzzy find files in windows/.../documents/.../products directory" })
    end
  }
}

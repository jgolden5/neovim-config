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
      vim.keymap.set("n", "<leader>fa", function()
        require('telescope.builtin').find_files ({
          search_dirs = {
            "~/bd/stretch/2/",
            "~/bd/stretch/stretch-work/alaris/",
          },
        })
      end, { desc = "Fuzzy find files in alaris WSL directories" })
      vim.keymap.set("n", "<leader>fA", function()
        require('telescope.builtin').find_files {
          cwd = "/mnt/c/wsl/alaris-repos/"
        }
      end, { desc = "Fuzzy find files in alaris Windows directory" })
      vim.keymap.set("n", "<leader>fs", function()
        require('telescope.builtin').find_files {
          cwd = "~/bd/stretch/stretch-work/"
        }
      end, { desc = "Fuzzy find files in stretch work directory" })
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

      vim.keymap.set("n", "<leader>ga", function()
        require('telescope.builtin').live_grep ({
          search_dirs = {
            "~/bd/stretch/2/",
            "~/bd/stretch/stretch-work/alaris/",
          },
        })
      end, { desc = "Live grep files in alaris WSL directories" })
      vim.keymap.set("n", "<leader>gA", function()
        require('telescope.builtin').live_grep {
          cwd = "/mnt/c/wsl/alaris-repos/"
        }
      end, { desc = "Live grep files in alaris Windows directory" })
      vim.keymap.set("n", "<leader>gd", require('telescope.builtin').live_grep, { desc = "Live grep current working directory" })
      vim.keymap.set("n", "<leader>gs", function()
        require('telescope.builtin').live_grep {
          cwd = "~/bd/stretch/stretch-work/"
        }
      end, { desc = "Live grep files in stretch work directory" })
      vim.keymap.set("n", "<leader>gd", require('telescope.builtin').live_grep, { desc = "Live grep files in current working directory" })
      vim.keymap.set("n", "<leader>gf", function ()
        require('telescope.builtin').live_grep {
          cwd = "~"
        }
      end, { desc = "Live grep files in home directory" })
      vim.keymap.set("n", "<leader>gh", require('telescope.builtin').help_tags, { desc = "Live grep nvim help" })
      vim.keymap.set("n", "<leader>gp", function ()
        require('telescope.builtin').live_grep {
          cwd = '/mnt/c/Users/11045964/OneDrive - BD/Documents/Products'
        }
      end, { desc = "Live grep files in windows/.../documents/.../products directory" })
    end
  }
}

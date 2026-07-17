return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
    opts = {
      model = 'auto',              -- AI model to use
      temperature = 0.1,           -- Lower = focused, higher = creative
      trusted_tools = nil,         -- Require approval for all tool calls
      auto_insert_mode = true,     -- Enter insert mode when opening
      window = {
        layout = 'vertical',       -- 'vertical', 'horizontal', 'float'
        width = 0.5,              -- 50% of screen width
        height = 20, -- Fixed height in rows
        border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
        title = '🤖 AI Assistant',
        zindex = 100, -- Ensure window stays on top
      },

      headers = {
        user = '👤 You',
        assistant = '🤖 Copilot',
        tool = '🔧 Tool',
      },

      vim.api.nvim_set_hl(0, 'CopilotChatHeader', { fg = '#7C3AED', bold = true }),
      vim.api.nvim_set_hl(0, 'CopilotChatSeparator', { fg = '#374151' }),

      separator = '━━',
      auto_fold = true,
    },
  },
}

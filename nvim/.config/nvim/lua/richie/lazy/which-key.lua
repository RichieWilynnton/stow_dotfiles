return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    defaults = {
      ["<leader>"] = {
        f = {
          name = "file",  -- optional group name
          t = { "<cmd>Neotree toggle<cr>", "Toggle file tree" },
          f = { "<cmd>Telescope find_files<cr>", "Find files" },
          g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
          b = { "<cmd>Telescope buffers<cr>", "Find buffers" },
        },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}

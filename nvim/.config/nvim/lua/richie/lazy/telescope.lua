return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    -- Custom action to copy file path to clipboard
    local function copy_file_path(prompt_bufnr)
      local entry = action_state.get_selected_entry()
      local file_path = entry.cwd .. "/" .. entry.value  -- Full path
      vim.fn.setreg("+", file_path)  -- Copy to system clipboard
      vim.notify("Copied to clipboard: " .. file_path, vim.log.levels.INFO)
      actions.close(prompt_bufnr)
    end

    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-x>"] = false,                          -- Disable default C-x (optional)
          },
          n = {
            ["<leader>h"] = actions.select_horizontal,  -- Open in horizontal split
            ["<leader>v"] = actions.select_vertical,    -- Open in vertical split
            ["<leader>t"] = actions.select_tab,
            ["<C-y>"] = copy_file_path,                 -- Copy in insert mode
            ["<C-x>"] = false,                          -- Disable default C-x (optional)
          },
        },
      },
    })

    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]iles" })
    vim.keymap.set("n", "<leader>pg", builtin.git_files, { desc = "[G]it files" })
    vim.keymap.set("n", "<leader>ps", builtin.live_grep, { desc = "[P]roject [S]earch" })
    vim.keymap.set("n", "<leader>pd", builtin.lsp_document_symbols, { desc = "[P]roject [D]efinitions" })
    vim.keymap.set("n", "<leader>pws", function()
    vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]iles" })
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end, { desc = "[P]roject [W]ord [S]earch (current word)" })

    vim.keymap.set("n", "<leader>pWs", function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
    end, { desc = "[P]roject [W]ORD [S]earch (current WORD)" })

  end,
}

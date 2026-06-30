return {
    "princejoogie/dir-telescope.nvim",
    requires = { "nvim-telescope/telescope.nvim" },
    config = function()
        require("dir-telescope").setup({
            hidden = true,
            no_ignore = false,
            show_preview = true,
            follow_symlinks = false,
        })
        vim.keymap.set("n", "<leader>pS", "<cmd>GrepInDirectory<CR>", { noremap = true, silent = true })
        vim.keymap.set("n", "<leader>pF", "<cmd>FileInDirectory<CR>", { noremap = true, silent = true })
    end,
}

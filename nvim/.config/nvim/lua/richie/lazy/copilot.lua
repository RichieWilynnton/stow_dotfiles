return {
    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            -- Optional: Set up key mappings
            vim.g.copilot_no_tab_map = true
            vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.g.copilot_assume_mapped = true
        end
    },
}

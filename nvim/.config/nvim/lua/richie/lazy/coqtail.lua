return {
    {
        "whonore/Coqtail",
        config = function()
            vim.g.Coqtail_auto_set_filetype = 1 -- Auto-detect Coq files
            -- Set background highlighting instead of text color
            vim.api.nvim_set_hl(0, 'CoqtailChecked', { bg = '#3a3b02' })
            vim.api.nvim_set_hl(0, 'CoqtailSent', { bg = '#333300' })            -- Dark yellow background for sent but unchecked
            vim.api.nvim_set_hl(0, 'CoqtailError', { bg = '#330000', fg = '#ffffff' }) -- Dark red background + white text for errors
            vim.api.nvim_set_hl(0, 'CoqtailProof', { bg = '#003333' })           -- Dark cyan background for proof keywords
        end,
        ft = { "coq", "v" },                                                     -- Load only for Coq files (.v files)
    },
}

vim.keymap.set(
    "n",
    "<leader>e",
    function() vim.diagnostic.open_float({ focusable = true }) end,
    { desc = "Expand an Error into a float" }
)

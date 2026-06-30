local opt = vim.diagnostic

opt.config({
  virtual_text = true,  -- Optional: Disable if you prefer only underlines
  underline = true,     -- MUST be true for red underlines
  signs = true,         -- Shows icons in the gutter
  update_in_insert = false,  -- Avoid distractions while typing
  severity_sort = true,
})

vim.keymap.set(
    "n",
    "<leader>e",
    function() vim.diagnostic.open_float({ focusable = true }) end,
    { desc = "Expand an Error into a float" }
)



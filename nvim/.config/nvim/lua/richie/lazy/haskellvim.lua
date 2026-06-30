return {
  {
    "neovimhaskell/haskell-vim",
    ft = "haskell", -- Only load for Haskell files
    config = function()
      vim.g.haskell_enable_quantification = 1   -- Enable quantification syntax (e.g., forall)
      vim.g.haskell_enable_recursivedo = 1      -- Enable recursive do notation (e.g., mdo, rec)
      vim.g.haskell_enable_arrowsyntax = 1      -- Enable arrow syntax (e.g., proc)
      vim.g.haskell_enable_pattern_synonyms = 1 -- Enable pattern synonyms
      vim.g.haskell_enable_typeroles = 1        -- Enable type roles
      vim.g.haskell_enable_static_pointers = 1  -- Enable static pointers
      vim.g.haskell_backpack = 1                -- Enable Backpack keywords
    end,
  },
}

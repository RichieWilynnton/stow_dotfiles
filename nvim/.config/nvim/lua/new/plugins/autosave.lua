return {
  {
    "Pocco81/auto-save.nvim",
    lazy = false, -- load immediately (not lazy-loaded)
    config = function()
      require("auto-save").setup({
        -- Your config here (or leave empty for defaults)
      })
    end,
  },
}

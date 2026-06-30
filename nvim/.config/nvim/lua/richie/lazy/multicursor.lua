return {
  -- Other plugins...
  {
    "mg979/vim-visual-multi",
    config = function()
      -- Lua configuration (optional)
      vim.g.VM_theme = 'ocean'  -- 'iceblue', 'light', 'neon'
      vim.g.VM_maps = {
        ["Find Under"] = "<C-n>",       -- Ctrl+n to add next occurrence
        ["Find Subword Under"] = "<C-n>",
        ["Add Cursor Down"] = "<C-Down>",
        ["Add Cursor Up"] = "<C-Up>",
      }
    end
  }
}

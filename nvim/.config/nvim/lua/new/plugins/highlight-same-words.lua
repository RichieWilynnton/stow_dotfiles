return {
  "RRethy/vim-illuminate",
  event = "BufReadPost",
  opts = {
    -- providers: provider used to get references in the buffer, ordered by priority
    providers = {
      "lsp",
      "treesitter",
      "regex",
    },
    -- delay: delay in milliseconds
    delay = 100,
    -- filetype_overrides: filetype specific overrides.
    filetype_overrides = {},
    -- filetypes to not illuminate
    filetypes_denylist = {
      "dirbuf",
      "dirvish",
      "fugitive",
    },
    -- modes to not illuminate
    modes_denylist = {},
    -- syntax to not illuminate (for regex provider)
    providers_regex_syntax_denylist = {},
    -- whether or not to illuminate under the cursor
    under_cursor = true,
    -- large file handling
    large_file_cutoff = 10000,
    large_file_overrides = nil,
    -- minimum number of matches required to perform highlighting
    min_count_to_highlight = 1,
    -- callback to enable/disable illumination
    should_enable = function(bufnr) return true end,
    -- case insensitive regex
    case_insensitive_regex = false,
  },
  config = function(_, opts)
    require("illuminate").configure(opts)
    
    -- Change the highlight style (optional)
    vim.api.nvim_set_hl(0, "IlluminatedWordText", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordRead", { underline = true })
    vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { underline = true })
  end
}

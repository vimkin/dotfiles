-- ============================================================================
-- Language-specific Plugins
-- ============================================================================

return {
  -- Go language support
  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
  },

  -- JavaScript support
  {
    "pangloss/vim-javascript",
    ft = "javascript",
  },

  -- Rust support
  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
}

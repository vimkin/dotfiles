return {
  "dense-analysis/ale",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    vim.g.ale_lint_on_text_changed = 0
    -- Additional ALE configuration can go here
  end,
}

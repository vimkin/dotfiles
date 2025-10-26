return {
  -- Comment toggling
  {
    "vim-scripts/tComment",
    keys = {
      { "gc", mode = { "n", "v" }, desc = "Toggle comment" },
    },
  },

  -- Automatically create missing directories
  {
    "pbrisbin/vim-mkdir",
    event = "BufWritePre",
  },

  -- Run interactive shell commands
  {
    "christoomey/vim-run-interactive",
    cmd = "RunInInteractiveShell",
  },
}

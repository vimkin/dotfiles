return {
  "vim-test/vim-test",
  keys = {
    { "<Leader>t", "<cmd>TestFile<cr>", desc = "Test File" },
    { "<Leader>s", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
    { "<Leader>l", "<cmd>TestLast<cr>", desc = "Test Last" },
    { "<Leader>a", "<cmd>TestSuite<cr>", desc = "Test Suite" },
    { "<Leader>gt", "<cmd>TestVisit<cr>", desc = "Test Visit" },
  },
}

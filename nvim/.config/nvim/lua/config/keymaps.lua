local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Switch between last two files
keymap("n", "<Leader><Leader>", "<C-^>", opts)

-- vim-test mappings
keymap("n", "<Leader>t", ":TestFile<CR>", opts)
keymap("n", "<Leader>s", ":TestNearest<CR>", opts)
keymap("n", "<Leader>l", ":TestLast<CR>", opts)
keymap("n", "<Leader>a", ":TestSuite<CR>", opts)
keymap("n", "<Leader>gt", ":TestVisit<CR>", opts)

-- Run commands that require an interactive shell
keymap("n", "<Leader>r", ":RunInInteractiveShell ", { noremap = true })

-- Quicker window movement
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Move between linting errors (ALE)
keymap("n", "]r", ":ALENextWrap<CR>", opts)
keymap("n", "[r", ":ALEPreviousWrap<CR>", opts)



-- Tab completion
-- Insert tab at beginning of line, use completion if not at beginning
function _G.insert_tab_wrapper()
  local col = vim.fn.col(".") - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
    return "<Tab>"
  else
    return "<C-p>"
  end
end

keymap("i", "<Tab>", "v:lua.insert_tab_wrapper()", { expr = true, noremap = true })
keymap("i", "<S-Tab>", "<C-n>", { noremap = true })

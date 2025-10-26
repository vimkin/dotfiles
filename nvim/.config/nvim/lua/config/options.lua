local opt = vim.opt

-- Encoding
vim.cmd("set encoding=utf-8")

-- General
opt.backspace = "2" -- Backspace deletes like most programs in insert mode
opt.backup = false -- No backup files
opt.writebackup = false -- No backup files
opt.swapfile = false -- No swap files
opt.history = 50 -- Command history
opt.ruler = true -- Show cursor position
opt.showcmd = true -- Display incomplete commands
opt.laststatus = 2 -- Always display status line
opt.autowrite = true -- Automatically write before running commands
opt.modelines = 0 -- Disable modelines as security precaution
opt.modeline = false

-- Search
opt.incsearch = true -- Incremental searching
opt.hlsearch = true -- Highlight search results

-- Display
opt.number = true -- Show line numbers
opt.numberwidth = 5 -- Line number column width
opt.textwidth = 80 -- Maximum text width
opt.colorcolumn = "+1" -- Highlight column after textwidth
opt.list = true -- Show invisible characters
opt.listchars = { tab = "»·", trail = "·", nbsp = "·" }
opt.signcolumn = "yes" -- Always show sign column

-- Indentation
opt.tabstop = 2 -- Tab width
opt.shiftwidth = 2 -- Indent width
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.expandtab = true -- Use spaces instead of tabs

-- Formatting
opt.joinspaces = false -- Use one space after punctuation

-- Completion
opt.wildmode = "list:longest,list:full" -- Command-line completion
opt.complete:append("kspell") -- Autocomplete with dictionary when spell check is on

-- Splits
opt.splitbelow = true -- Open horizontal splits below
opt.splitright = true -- Open vertical splits to the right

-- Diff
opt.diffopt:append("vertical") -- Always use vertical diffs

-- Spell check
opt.spellfile = vim.fn.expand("$HOME/.vim-spell-en.utf-8.add")

-- Performance
opt.updatetime = 1000 -- Faster completion and better UX

-- Shell
vim.g.is_posix = 1 -- Assume POSIX-compatible shell for syntax highlighting

-- Syntax highlighting
if (vim.fn.has("termguicolors") == 1) then
  opt.termguicolors = true
end

vim.cmd("syntax on")
vim.cmd("filetype plugin indent on")

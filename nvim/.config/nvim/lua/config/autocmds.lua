local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- General autocommands
local vimrc_group = augroup("vimrcEx", { clear = true })

-- Jump to last known cursor position when opening a file
autocmd("BufReadPost", {
  group = vimrc_group,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
  desc = "Jump to last known cursor position",
})

-- Set filetype for specific files
autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = "*.md",
  command = "set filetype=markdown",
  desc = "Set markdown filetype",
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = { ".jscsrc", ".jshintrc", ".eslintrc" },
  command = "set filetype=json",
  desc = "Set JSON filetype for config files",
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = { "aliases.local", "zshrc.local", "*/zsh/configs/*" },
  command = "set filetype=sh",
  desc = "Set shell filetype for zsh config files",
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = "gitconfig.local",
  command = "set filetype=gitconfig",
  desc = "Set gitconfig filetype",
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = "tmux.conf.local",
  command = "set filetype=tmux",
  desc = "Set tmux filetype",
})

autocmd({ "BufRead", "BufNewFile" }, {
  group = vimrc_group,
  pattern = "vimrc.local",
  command = "set filetype=vim",
  desc = "Set vim filetype",
})

-- ALE linting events
local ale_group = augroup("ale", { clear = true })

autocmd("VimEnter", {
  group = ale_group,
  callback = function()
    if vim.fn.exists("*ale#Queue") == 1 then
      vim.opt.updatetime = 1000
      vim.g.ale_lint_on_text_changed = 0

      local ale_events = augroup("ale_events", { clear = true })

      autocmd({ "CursorHold", "CursorHoldI", "InsertEnter", "InsertLeave" }, {
        group = ale_events,
        callback = function()
          vim.fn["ale#Queue"](0)
        end,
        desc = "Queue ALE linting",
      })
    end
  end,
  desc = "Setup ALE linting",
})

-- HTML indentation
vim.g.html_indent_tags = "li\\|p"

-- Set tags for vim-fugitive
vim.opt.tags:prepend(".git/tags")

return {
  "junegunn/fzf.vim",
  dependencies = {
    {
      "junegunn/fzf",
      build = function()
        vim.fn["fzf#install"]()
      end,
    },
  },
  cmd = { "Files", "Rg", "Buffers", "Lines", "GFiles" },
  keys = {
    { "<C-p>", "<cmd>Files<cr>", desc = "Find Files" },
    { "\\", "<cmd>Rg<cr>", desc = "Ripgrep Search" },
  },
  config = function()
    -- Use ripgrep for FZF file search (respects .gitignore)
    if vim.fn.executable("rg") == 1 then
      vim.env.FZF_DEFAULT_COMMAND = "rg --files --hidden --follow --glob '!.git'"
      -- Set ripgrep as the grep program
      vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
      vim.opt.grepformat = "%f:%l:%c:%m"
    end
  end,
}

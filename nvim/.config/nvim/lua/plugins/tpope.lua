return {
  -- Fugitive - Git integration
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gdiffsplit", "Gread", "Gwrite", "Ggrep", "GMove", "GDelete", "GBrowse", "GRemove", "GRename", "Glgrep", "Gedit" },
    ft = { "fugitive" },
  },

  -- Rhubarb - GitHub integration for fugitive
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },

  -- Surround - Manipulate surrounding characters
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Repeat - Enable repeating plugin maps with .
  {
    "tpope/vim-repeat",
    event = "VeryLazy",
  },

  -- Endwise - Automatically add end keywords
  {
    "tpope/vim-endwise",
    event = "InsertEnter",
  },

  -- Eunuch - Unix shell commands
  {
    "tpope/vim-eunuch",
    cmd = { "Delete", "Unlink", "Move", "Rename", "Chmod", "Mkdir", "Cfind", "Clocate", "Lfind", "Llocate", "Wall", "SudoWrite", "SudoEdit" },
  },

  -- Projectionist - Project configuration
  {
    "tpope/vim-projectionist",
    event = "VeryLazy",
  },
}

{pkgs ? import <nixpkgs> {}}:

with pkgs; [
  atuin
  bat
  carapace
  delta
  docker
  fastfetch
  ffmpeg
  fzf
  gh
  git
  htop
  imagemagick
  jq
  ncdu
  neovim
  nushell
  p7zip
  qpdf
  ripgrep
  sd
  starship
  stow
  tree
  uv
  zellij
  zoxide
]

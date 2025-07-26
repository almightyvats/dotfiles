#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting package installation...${NC}"

# Ensure yay is installed
if ! command -v yay &> /dev/null; then
  echo -e "${GREEN}yay not found. Installing yay (AUR helper)...${NC}"
  sudo pacman -S --needed git base-devel
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  cd /tmp/yay
  makepkg -si --noconfirm
  cd -
fi

# Install packages via pacman and yay
PACKAGES_PACMAN=(
  zsh
  polybar
  copyq
  picom
  fzf
  ripgrep
  fd
  neovim
  vlc
  tmux
)

PACKAGES_YAY=(
  nerd-fonts-meslo
  oh-my-zsh-git
  sdkman
  atuin
  visual-studio-code-bin
  discord
  obsidian
  ghostty
  stow
)

echo -e "${GREEN}Installing pacman packages...${NC}"
sudo pacman -S --noconfirm --needed "${PACKAGES_PACMAN[@]}"

echo -e "${GREEN}Installing AUR packages via yay...${NC}"
yay -S --noconfirm --needed "${PACKAGES_YAY[@]}"

# Optional: change shell to zsh
if [[ "$SHELL" != "/bin/zsh" ]]; then
  echo -e "${GREEN}Changing default shell to zsh...${NC}"
  chsh -s /bin/zsh
fi

# Atuin: init if not already
if ! grep -q 'eval "$(atuin init zsh)"' ~/.zshrc 2>/dev/null; then
  echo -e "${GREEN}Adding Atuin init to .zshrc...${NC}"
  echo 'eval "$(atuin init zsh)"' >> ~/.zshrc
fi

# SDKMAN: install from the provided script
if [ ! -d "$HOME/.sdkman" ]; then
  echo -e "${GREEN}Installing SDKMAN...${NC}"
  curl -s "https://get.sdkman.io" | bash
fi

echo -e "${GREEN}All packages installed successfully.${NC}"
echo -e "${GREEN}You may need to restart your session or source your .zshrc.${NC}"


#  SavvyHex Neovim Configuration

> **My Supreme Neovim Config**, built on the foundation of NvChad.

##  Overview

This is a personalized configuration for [Neovim](https://neovim.io), structured in Lua and inspired by the flexibility and modularity of NvChad. It’s designed to streamline your development workflow with optimized performance, useful plugins, and intuitive keybindings.

---

##  Features

- **Modular and Maintainable** setup in Lua (`init.lua`, `lua/`), offering cleaner structure than traditional Vimscript configs
- **Plugin-driven**, typically powered by managers like `Packer.nvim` or `lazy.nvim`, for easy plugin management
- **Pre-configured plugins**, enhancing LSP, autocompletion, code navigation, theming, and UI enhancements
- **Custom key mappings and helper functions** for faster editing and navigation
- **Fully customizable**—tweak options, plugins, and themes to suit your workflow

---

##  Requirements

- Neovim **v0.7+** (compatibility may vary; NVim v0.8+ recommended)
- Git (for cloning plugins)
- Optional: Nerd Font (for icons), Ripgrep, fd, C compiler (for building Treesitter), etc.

---

##  Installation

```shell
# Clone this repository as your Neovim configuration
git clone https://github.com/SavvyHex/nvim.git ~/.config/nvim

# Launch Neovim to trigger plugin installation (if using a plugin manager like lazy.nvim or packer.nvim)
nvim --headless +"Lazy! sync" +qa

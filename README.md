# neovim-dotfile

# Introduction

This repository provides the lightweight and amusing neovim experience with simple configuration.

* No complex keybindings with complex call
* With easy use LSP system
* Clear project structure
* Use Lazy to manage plugins

# Installation

Just clone this repo and copy it to your nvim config folder.

# Structure

`lsp/` for LSP config;

`lua/config/` for neovim detailed config;

`lua/plugins/` for plugins config and keybindings;

`init.lua` for core config call.

# Keybindings

`lua/config/keybindings.lua` is for nvim keybindings.

There are multiple keybindings in the `lua/plugins/.` in order to maintain simple.
You can find them by typing `<Leader>g` or `:Telescope live_grep<CR>` to search `[KEY_BINDING]`.

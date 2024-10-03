# Neovim Configuration with Lazy.nvim

This is a minimal and efficient Neovim configuration using **Lazy.nvim** as the plugin manager. The setup is focused on providing a productive coding environment with support for LSP (Language Server Protocol), autocompletion, file navigation, and more.

## Plugin List

### 1. [Lazy.nvim](https://github.com/folke/lazy.nvim)
**Lazy.nvim** is the plugin manager used to handle and load all plugins on-demand, improving startup time and performance.

### 2. [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
Sets up the **Language Server Protocol (LSP)** for Neovim, allowing for IDE-like features such as go-to definition, code navigation, diagnostics, and more.

- **Languages Supported**: Go, Lua, Java, C++
- **Key Features**:
  - Go to definition (`gd`)
  - Find references (`gr`)
  - Hover documentation (`K`)
  - Rename symbol (`<leader>rn`)
  - Code actions (`<leader>ca`)
  
### 3. [Mason.nvim](https://github.com/williamboman/mason.nvim)
**Mason** is a tool installer that helps manage LSP servers, formatters, and linters. It integrates with **nvim-lspconfig** to automatically install language servers.

- Run `:Mason` to open the Mason UI and install/manage tools.

### 4. [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
A highly customizable fuzzy finder for searching files, buffers, and symbols. Integrated with LSP to provide easy navigation.

- **Key Features**:
  - Fuzzy find files (`<leader>f`)
  - Find LSP definitions, references, symbols, etc. using Telescope:
    - Go to definition (`gd`)
    - Find references (`gr`)
    - Document symbols (`<leader>ds`)
    - Workspace symbols (`<leader>ws`)
  
### 5. [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
The **autocompletion engine** for Neovim, integrated with LSP, buffer, and path completions.

- **Dependencies**:
  - `cmp-nvim-lsp`: LSP source for autocompletion
  - `cmp-buffer`: Buffer source for autocompletion
  - `cmp-path`: Path completion
  - `LuaSnip`: Snippet engine for enhanced completions

### 6. [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)
A **file explorer** for Neovim that allows you to navigate your project directory.

- **Key Mapping**:
  - Toggle the file tree: `<leader>e`

### 7. [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
A fast and easy-to-configure **statusline** plugin for Neovim. Displays useful information such as the current mode, file type, diagnostics, and more.

### 8. [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
**Git integration** for Neovim. Shows git diff markers (added, modified, deleted lines) in the sign column and provides useful keybindings for Git actions.

### 9. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
Provides better **syntax highlighting** and code awareness through incremental parsing.

- **Languages Supported**: Go, Lua, Java, C++
- Automatically installs parsers for the languages in use.

### 10. [Comment.nvim](https://github.com/numToStr/Comment.nvim)
Easily toggle comments in both **normal** and **visual modes**.

- **Key Mapping**: `gc` to toggle comments.

## How to Use

1. **Install Lazy.nvim**:
   Clone Lazy.nvim to your Neovim runtime path:
   ```bash
   git clone https://github.com/folke/lazy.nvim ~/.local/share/nvim/lazy/lazy.nvim
   ```
2. **Install Plugins**:
    Open Neovim and Lazy.nvim will automatically install the plugins specified in your configuration.

## Contributing
Feel free to fork this repo and extend the configuration as needed. Contributions are welcome!

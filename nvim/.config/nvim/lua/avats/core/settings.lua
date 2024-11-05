-- Set line numbers and relative numbers
vim.opt.number = true         -- Show current line number
vim.opt.relativenumber = true  -- Show relative line numbers for easier movement

-- Enable mouse support
vim.opt.mouse = "a"            -- Enable mouse in all modes

-- Set tabs and indentation
vim.opt.tabstop = 2            -- Number of spaces for a tab
vim.opt.shiftwidth = 2         -- Number of spaces for autoindent
vim.opt.expandtab = true       -- Use spaces instead of tabs
vim.opt.smartindent = true     -- Smart indentation

-- Disable swap and backup files
vim.opt.swapfile = false       -- Disable swap file
vim.opt.backup = false         -- Disable backup file
vim.opt.undofile = true        -- Enable persistent undo

-- Enable incremental search
vim.opt.incsearch = true       -- Incremental search
vim.opt.hlsearch = true        -- Highlight all search results
vim.opt.ignorecase = true      -- Ignore case in searches...
vim.opt.smartcase = true       -- ...unless the search contains capital letters

-- UI settings
vim.opt.termguicolors = true   -- Enable 24-bit RGB colors
vim.opt.signcolumn = "yes"     -- Always show sign column (for diagnostics, git, etc.)
vim.opt.cursorline = true      -- Highlight the current line

-- Auto update file
vim.opt.autoread = true

-- Set up clipboard to use system clipboard
vim.opt.clipboard = "unnamedplus"  -- Use system clipboard

-- Split window behavior
vim.opt.splitright = true      -- Open vertical splits to the right
vim.opt.splitbelow = true      -- Open horizontal splits below

-- Disable line wrapping
vim.opt.wrap = false           -- Don't wrap long lines

-- Faster completion
vim.opt.updatetime = 300       -- Faster completion (default 4000ms)

-- Set timeout for key mappings
vim.opt.timeoutlen = 500       -- Time to wait for a mapped sequence to complete

-- Set wildmenu for better command line completion
vim.opt.wildmenu = true        -- Enhanced command line completion
vim.opt.wildmode = {"list", "longest"} -- Command-line completion mode

-- Enable line break for readability in wrapped lines
vim.opt.breakindent = true     -- Indent wrapped lines for readability


-- Shorten function call for setting keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "  -- Set space as the leader key

-- Keymaps for better navigation

-- Fast saving with leader + w
map("n", "<leader>w", ":w<CR>", opts)  -- Save file

-- Fast quitting with leader + q
map("n", "<leader>q", ":q<CR>", opts)  -- Quit Neovim

-- Navigate between splits with Ctrl + hjkl
map("n", "<C-h>", "<C-w>h", opts)  -- Move to left split
map("n", "<C-j>", "<C-w>j", opts)  -- Move to bottom split
map("n", "<C-k>", "<C-w>k", opts)  -- Move to top split
map("n", "<C-l>", "<C-w>l", opts)  -- Move to right split

-- Resizing windows with arrow keys
map("n", "<C-Up>", ":resize +2<CR>", opts)      -- Increase height
map("n", "<C-Down>", ":resize -2<CR>", opts)    -- Decrease height
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)  -- Decrease width
map("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- Increase width

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)  -- Go to the next buffer
map("n", "<S-h>", ":bprevious<CR>", opts)  -- Go to the previous buffer

-- Close buffer
map("n", "<leader>c", ":bdelete<CR>", opts)  -- Close current buffer

-- Keymaps for text manipulation

-- Move selected line/block of text in Visual Mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)  -- Move selected line down
map("v", "K", ":m '<-2<CR>gv=gv", opts)  -- Move selected line up

-- Indenting in Visual Mode
map("v", "<", "<gv", opts)  -- Keep selected text after indenting left
map("v", ">", ">gv", opts)  -- Keep selected text after indenting right

-- Visual mode paste without overwriting register
map("v", "p", '"_dP', opts)  -- Replace text without overwriting clipboard

-- Stay in the middle of the screen while scrolling
map("n", "n", "nzzzv", opts)  -- Center screen after searching next
map("n", "N", "Nzzzv", opts)  -- Center screen after searching previous
map("n", "J", "mzJ`z", opts)  -- Keep cursor centered when joining lines

-- Make Y behave like other capital letters (yank to end of line)
map("n", "Y", "y$", opts)

-- Clear search highlighting
map("n", "<leader>h", ":nohlsearch<CR>", opts)  -- Clear search highlights

-- Split window shortcuts
map("n", "<leader>v", ":vsplit<CR>", opts)  -- Vertical split
map("n", "<leader>s", ":split<CR>", opts)   -- Horizontal split

-- Better scrolling
map("n", "<C-d>", "<C-d>zz", opts)  -- Scroll down and center cursor
map("n", "<C-u>", "<C-u>zz", opts)  -- Scroll up and center cursor

-- Fast open terminal
map("n", "<leader>t", ":split | terminal<CR>", opts)  -- Open terminal in split

-- Tab management
map("n", "<leader>tn", ":tabnew<CR>", opts)  -- Open new tab
map("n", "<leader>tc", ":tabclose<CR>", opts)  -- Close current tab
map("n", "<leader>to", ":tabonly<CR>", opts)   -- Close all other tabs
map("n", "<leader>tp", ":tabprevious<CR>", opts) -- Go to previous tab
map("n", "<leader>tn", ":tabnext<CR>", opts)  -- Go to next tab

-- bufferline A = Alt
map("n", "<S-b>", "<cmd> enew <CR>", opts) --" new buffer"
map("n", "<A-.>", "<cmd> BufferLineCycleNext <CR>", opts) --"  cycle next buffer"
map("n", "<A-,>", "<cmd> BufferLineCyclePrev <CR>", opts) --"  cycle prev buffer"
map("n", "<A-s-.>", "<cmd> BufferLineMoveNext <CR>", opts) --"  cycle next buffer"
map("n", "<A-s-,>", "<cmd> BufferLineMovePrev <CR>", opts) --"  cycle prev buffer"
map("n", "<A-f>", "<cmd> BufferLinePick <CR>", opts)
map("n", "<leader>x", "<cmd> bp|sp|bn|bd! <CR>", opts) --"	close buffer"
for i = 1, 9 do
	-- map("n", "<A-" .. i .. ">", function() require("bufferline").go_to_buffer(i) end)
	map("n", "<A-" .. i .. ">", "<cmd>" .. i .. "tabn<CR>", opts)
end

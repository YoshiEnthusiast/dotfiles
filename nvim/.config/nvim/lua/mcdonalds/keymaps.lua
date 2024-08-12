vim.g.mapleader = " "

local set = vim.keymap.set

set("n", "n", "nzzzv", { desc = "Next search match" })
set("n", "N", "Nzzzv", { desc = "Previous search match" })

set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move current line up" })
set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move current line down" })

set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move current line up" })
set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move current line down" })

set("n", "<leader>nh", ":noh<cr>", { desc = "Clear search highlighting" })
set("n", "<leader>va", "gg$vG", { desc = "Select the entire file" })

set({ "n", "v" }, "<leader>y", "\"+y", { desc = "Copy to clipboard" })
set({ "n", "v" }, "<leader>Y", "\"+Y", { desc = "Copy to clipboard" })
set({ "n", "v" }, "<leader>p", "\"+p", { desc = "Paste from clipboard" })
set({ "n", "v" }, "<leader>P", "\"+P", { desc = "Paste from clipboard" })

set("n", "<C-l>", "<C-w><C-l>", { desc = "Focus on the window to the right" })
set("n", "<C-h>", "<C-w><C-h>", { desc = "Focus on the window to the left" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Focus on the window above" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Focus on the window below" })

set("n", "<leader>qq", ":q<cr>", { desc = "Close current window" })
set("n", "<leader>qw", ":qa<cr>", { desc = "Close all windows" })
set("n", "<leader>w", ":w<cr>", { desc = "Save current buffer" })

set("n", "<A-h>", "<cmd>bprevious<cr>")
set("n", "<A-l>", "<cmd>bnext<cr>")
set("n", "<A-d>", "<cmd>bdelete<cr>")
set("n", "<A-c>", "<cmd>bufdo bd<cr>")

-- set("n", "<C-d>", "<C-d>zz", { desc = "Move down" })
-- set("n", "<C-u>", "<C-u>zz", { desc = "Move up" })

set("i", "<C-c>", "<esc>", { desc = "Escape insert mode" })
set("n", "<leader>ex", ":Ex<cr>", { desc = "Open file explorer" })

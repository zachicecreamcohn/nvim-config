require("config.keymaps")
require("config.lazy")
require("config.neovide")
require("config.legacy")

vim.g.mapleader = " "

-- Automatically change the current working directory to the file being edited
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])

-- enable cursorline
vim.o.cursorline = true

-- Unmount any sshfs mounts when entering neovim
vim.api.nvim_create_autocmd("VimEnter", {
	command = "silent !umount ~/.sshfs/*",
})

-- Add a command to jump directly to nvim config direcotry
vim.cmd("command! NvimConfig :cd ~/.config/nvim")

-- add a command to the escape key so that it kills last find highlight
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

-- set colorscheme to catppuccin-ma
require("catppuccin").load("mocha")


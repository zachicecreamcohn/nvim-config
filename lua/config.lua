require("config.lazy")

-- Automatically change the current working directory to the file being edited
vim.cmd([[autocmd BufEnter * silent! lcd %:p:h]])

-- enable cursorline
vim.o.cursorline = true

-- remap gd to allow jumping to definition in a new tab
vim.api.nvim_set_keymap(
	"n",
	"gD",
	":tab split<CR><cmd>lua vim.lsp.buf.definition()<CR>",
	{ noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- shortcuts for switching between panes
vim.api.nvim_set_keymap("n", "<Esc>fh", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>fj", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>fk", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>fl", "<C-w>l", { noremap = true, silent = true })
-- shortcuts to switch tabs
vim.api.nvim_set_keymap("n", "<Esc>ftn", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>ftt", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>ftp", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Esc>fw", ":close<CR>", { noremap = true, silent = true })

-- pane split commands
vim.cmd("command! HS split")
vim.cmd("command! VS vsplit")
vim.cmd("command! CLS close")

require("copilot.suggestion").toggle_auto_trigger()

-- Set a command for more easily leaving term mode (command-\)
vim.keymap.set("t", "<Esc>t", "<C-\\><C-n>", { noremap = true, silent = true })

-- Unmount any sshfs mounts when entering neovim
vim.api.nvim_create_autocmd("VimEnter", {
	command = "silent !umount ~/.sshfs/*",
})

-- Add a command to jump directly to nvim config direcotry
vim.cmd("command! NvimConfig :cd ~/.config/nvim")

function _G.attach_tmux_session()
	-- Check if the session exists, and if not, create one
	vim.cmd("terminal tmux has-session -t my-session 2>/dev/null || tmux new-session -s my-session -d")

	-- Open a terminal and attach to the tmux session
	vim.cmd("terminal tmux attach-session -t my-session")
end

-- add a command to the escape key so that it kills last find highlight
vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR>", { noremap = true, silent = true })

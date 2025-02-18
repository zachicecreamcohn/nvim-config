vim.api.nvim_set_keymap("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<CR>", {})

-- shortcuts for switching focus between panes
vim.api.nvim_set_keymap("n", "<D-h>", "<C-w>h", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-j>", "<C-w>j", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-k>", "<C-w>k", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-l>", "<C-w>l", { noremap = true, silent = true })

-- shortcuts to switch tabs
vim.api.nvim_set_keymap("n", "<D-t>", ":tabnew<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-]>", ":tabnext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-[>", ":tabprevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<D-w>", ":close<CR>", { noremap = true, silent = true })

-- pane split commands
vim.cmd("command! HS split")
vim.cmd("command! VS vsplit")
vim.cmd("command! CLS close")

-- Set a command for more easily leaving term mode
vim.keymap.set("t", "<Esc>t", "<C-\\><C-n>", { noremap = true, silent = true })

-- remap control-o to <leader>b (to go to previous buffer)
vim.keymap.set("n", "<leader>b", "<C-6>", { noremap = true, silent = true })

vim.keymap.set(
	"n",
	"<space>e",
	":lua vim.diagnostic.open_float(0, {scope='line'})<CR>",
	{ noremap = true, silent = true }
)


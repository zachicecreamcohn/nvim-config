return {
	"dlants/magenta.nvim",
	lazy = false, -- you could also bind to <leader>m
	build = "bun install --frozen-lockfile",
	config = function()
		require("magenta").setup({
			provider = "openai",
		})

		vim.api.nvim_set_keymap("n", "<leader>j", ":Magenta toggle<CR>", { silent = true, noremap = true })
	end,
}

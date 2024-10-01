return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true, -- Closes Neo-tree if it is the last window in the tab
			filesystem = {
				follow_current_file = {
					enabled = true, -- Automatically focuses the current file
				},
				hijack_netrw_behavior = "open_current", -- Opens Neo-tree in the current window like netrw would
			},
			window = {

				position = "right", -- Default position set to right
				mappings = {
					-- upload (sync files)
					uu = {
						function(state)
							vim.cmd("TransferUpload " .. state.tree:get_node().path)
						end,
						desc = "upload file or directory",
						nowait = true,
					},
					-- download (sync files)
					ud = {
						function(state)
							vim.cmd("TransferDownload" .. state.tree:get_node().path)
						end,
						desc = "download file or directory",
						nowait = true,
					},
					-- diff directory with remote
					uf = {
						function(state)
							local node = state.tree:get_node()
							local context_dir = node.path
							if node.type ~= "directory" then
								-- if not a directory
								-- one level up
								context_dir = context_dir:gsub("/[^/]*$", "")
							end
							vim.cmd("TransferDirDiff " .. context_dir)
							vim.cmd("Neotree close")
						end,
						desc = "diff with remote",
					},
				},
			},

			event_handlers = {

				{
					event = "file_open_requested",
					handler = function()
						-- auto close
						-- vim.cmd("Neotree close")
						-- OR
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
		vim.api.nvim_set_keymap(
			"n",
			"<leader>tr",
			":Neotree source=filesystem focus<CR>",
			{ noremap = true, silent = true }
		)

		vim.api.nvim_set_keymap(
			"n",
			"<leader>trx",
			":Neotree source=filesystem close<CR>",
			{ noremap = true, silent = true }
		)
	end,
}

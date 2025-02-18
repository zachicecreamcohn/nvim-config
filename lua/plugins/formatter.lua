return {
	"mhartington/formatter.nvim",
	config = function()
		-- Utilities for creating configurations
		local util = require("formatter.util")
		local function format_prettier()
			return {
				exe = "npx",
				args = { "prettier", "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
				stdin = true,
			}
		end
		-- Formatter setup
		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,

					function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				typescript = { format_prettier },
				javascript = { format_prettier },
				typescriptreact = { format_prettier },

				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		-- Set up an autogroup for formatting on save
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}

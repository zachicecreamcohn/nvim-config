return {
	"miversen33/sunglasses.nvim",
	config = function()
		require("sunglasses").setup({
			filter_type = "SHADE",
			filter_percent = 0.20,
		})
	end,
}

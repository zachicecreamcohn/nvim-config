return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
	config = function()
		require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets/" })
	end,
}

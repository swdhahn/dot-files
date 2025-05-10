return {
	{
		"thesimonho/kanagawa-paper.nvim", 
		lazy = false,
		priority = 1000,
		config = function()
			require("kanagawa-paper").setup({
		 		transparent = true,
			})
			vim.cmd([[colorscheme kanagawa-paper]])
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function ()
			require("colorizer").setup({
				"*";
			})
		end
	}
}

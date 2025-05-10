return {
	{
    		"nvim-treesitter/nvim-treesitter",
    		build = ":TSUpdate",
    		config = function () 
    		  local configs = require("nvim-treesitter.configs")

    		  configs.setup({
    		      ensure_installed = { "c", "cpp", "sql", "markdown", "lua", "vim", "vimdoc", "typescript", "javascript", "html", "css" },
    		      sync_install = false,
    		      highlight = { enable = true },
    		      indent = { enable = true },
    		    })
    		end
	},
	{
		"nvim-treesitter/nvim-treesitter-context"
	},
}

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"cmake",
					"cssls",
					"pyright",
				}
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = { "saghen/blink.cmp", "williamboman/mason-lspconfig.nvim" },
		config = function()
			local capabilities = require("blink.cmp").get_lsp_capabilities()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")
			for _, val in ipairs(mason_lspconfig.get_installed_servers()) do
				lspconfig[val].setup({ capabilities = capabilities })
			end
			-- If we want to specify particular lsp configs
			-- lspconfig.cmake.setup({ capabilities = capabilities })

			vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, {})
			vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, {})
			vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
			-- vim.keymap.set('n', 'lD', vim.lsp.buf.declaraction, {})
			-- vim.keymap.set('n', 'la', vim.lsp.buf.code_action, {})
			-- vim.keymap.set('n', 'lc', vim.lsp.buf.clear_references, {})
			vim.keymap.set('n', '<leader>ds', vim.lsp.buf.document_symbol, {})
			vim.keymap.set('n', '<leader>i', vim.lsp.buf.implementation, {})
			-- vim.keymap.set('n', 'lr', vim.lsp.buf.references, {})
			-- vim.keymap.set('n', 'lrr', vim.lsp.buf.rename, {})
			-- vim.keymap.set('n', 'lsh', vim.lsp.buf.signature_help, {})
			-- vim.keymap.set('n', 'ltd', vim.lsp.buf.type_definition, {})
			-- vim.keymap.set('n', 'lth', vim.lsp.buf.typehierarchy, {})
			-- vim.keymap.set('n', 'lws', vim.lsp.buf.workspace_symbol, {})
			-- vim.keymap.set('n', 'llc', vim.lsp.buf.incoming_calls, {})
		end
	},
}

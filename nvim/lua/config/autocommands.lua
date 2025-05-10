-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	group = vim.api.nvim_create_augroup('UserLspConfig', {}),
-- 	callback = function (args)
-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
--
--     		if client:supports_method('textDocument/formatting') then
-- 			vim.lsp.buf_attach_client(vim.api.nvim_get_current_buf(), args.data.client_id)
-- 		end
-- 	end
-- })

vim.lsp.handlers['client/registerCapability'] = (function(overridden)
	return function(err, res, ctx)
		local result = overridden(err, res, ctx)
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		if not client then
			return
		end
		vim.lsp.buf_attach_client(vim.api.nvim_get_current_buf(), ctx.client_id)
		return result
	end
end)(vim.lsp.handlers['client/registerCapability'])

vim.api.nvim_create_autocmd('BufWritePre', {
	callback = function()
		vim.lsp.buf.format {
			async = false,
		}
	end,
})

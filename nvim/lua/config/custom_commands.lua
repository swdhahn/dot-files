local_pairs = { { ".h", ".cpp" }, }

local function swap_pair()
	local file_path = vim.api.nvim_buf_get_name(0)
	local ext = "." .. file_path:match("^.+%.(.+)$")
	file_path = string.sub(file_path, 1, string.len(file_path) - string.len(ext))

	n_ext = ext
	for i = 1, #local_pairs, 1 do
		print(local_pairs[i][1])
		if (local_pairs[i][1] == ext)
		then
			n_ext = local_pairs[i][2]
			break
		end
		if local_pairs[i][2] == ext
		then
			n_ext = local_pairs[i][1]
			break
		end
	end
	vim.cmd('edit ' .. file_path .. n_ext)
end

vim.keymap.set('n', '<leader>sp', swap_pair, { desc = "Swaps between a linked file" })

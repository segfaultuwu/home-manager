local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	vim.notify("nvim-treesitter.configs missing", vim.log.levels.WARN)
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})

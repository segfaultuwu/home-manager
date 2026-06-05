local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup({
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git/",
			"dist/",
			"build/",
			"target/",
			".direnv/",
			"result/",
		},
	},
})

pcall(telescope.load_extension, "fzf")

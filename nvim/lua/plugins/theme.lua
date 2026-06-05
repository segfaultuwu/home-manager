local ok, catppuccin = pcall(require, "catppuccin")
if not ok then
	return
end

catppuccin.setup({
	flavour = "mocha",
	transparent_background = true,
	integrations = {
		cmp = true,
		gitsigns = true,
		nvimtree = true,
		treesitter = true,
		telescope = true,
		noice = true,
		which_key = true,
		native_lsp = {
			enabled = true,
		},
	},
})

vim.cmd.colorscheme("catppuccin-nvim")

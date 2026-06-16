local capabilities = vim.lsp.protocol.make_client_capabilities()

local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if ok_cmp then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

local servers = {
	nil_ls = {},
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	gopls = {},
	html = {},
	cssls = {},
	jsonls = {},
	emmet_language_server = {},
	pyright = {},
	ruff = {},
	clangd = {
		cmd = {
			"clangd",
			"--background-index",
			"--clang-tidy",
			"--query-driver=/nix/store/*/bin/g++,/nix/store/*/bin/gcc,/nix/store/*/bin/clang++,/nix/store/*/bin/clang",
		},
	},
	bashls = {},
	ts_ls = {},
	rust_analyzer = {},
	gleam = {},
	crystalline = {
		cmd = { "crystalline" },
		filetypes = { "crystal" },
		root_markers = { "shard.yml", ".git" },
	},
}

for name, opts in pairs(servers) do
	opts.capabilities = capabilities

	vim.lsp.config(name, opts)
	vim.lsp.enable(name)
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

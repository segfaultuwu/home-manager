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
	clangd = {},
	bashls = {},
	ts_ls = {},
	gleam = {},
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

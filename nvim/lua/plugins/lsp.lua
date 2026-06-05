local ok_lsp, lspconfig = pcall(require, "lspconfig")
if not ok_lsp then
	return
end

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
}

if lspconfig.ts_ls then
	servers.ts_ls = {}
elseif lspconfig.tsserver then
	servers.tsserver = {}
end

for name, opts in pairs(servers) do
	if lspconfig[name] then
		opts.capabilities = capabilities
		lspconfig[name].setup(opts)
	end
end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

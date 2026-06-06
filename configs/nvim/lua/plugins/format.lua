local ok, conform = pcall(require, "conform")
if not ok then
	return
end

conform.setup({
	formatters_by_ft = {
		nix = { "nixfmt" },
		lua = { "stylua" },
		go = { "gofumpt" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		json = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		python = { "ruff_format" },
		sh = { "shfmt" },
	},
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		conform.format({
			bufnr = args.buf,
			async = false,
			timeout_ms = 3000,
			lsp_fallback = true,
		})
	end,
})

vim.keymap.set("n", "<leader>f", function()
	conform.format({
		async = true,
		lsp_fallback = true,
	})
end, { desc = "Format file" })

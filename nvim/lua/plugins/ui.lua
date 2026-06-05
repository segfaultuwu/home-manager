local function setup(name, opts)
	local ok, plugin = pcall(require, name)
	if ok then
		plugin.setup(opts or {})
	end
end

setup("lualine", {
	options = {
		theme = "catppuccin-nvim",
		globalstatus = true,
		section_separators = "",
		component_separators = "",
	},
})

setup("bufferline", {
	options = {
		diagnostics = "nvim_lsp",
		separator_style = "thin",
		show_buffer_close_icons = false,
		show_close_icon = false,
	},
})

setup("noice", {
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
	},
})

setup("dressing")

setup("nvim-tree", {
	view = {
		width = 32,
	},
	renderer = {
		group_empty = true,
		icons = {
			show = {
				git = true,
				folder = true,
				file = true,
			},
		},
	},
	filters = {
		dotfiles = false,
	},
})

setup("oil", {
	default_file_explorer = false,
	view_options = {
		show_hidden = true,
	},
})

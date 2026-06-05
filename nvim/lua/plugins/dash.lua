local ok, dashboard = pcall(require, "dashboard")
if not ok then
	return
end

dashboard.setup({
	theme = "doom",

	config = {
		header = {
			"",
			" ███╗   ██╗██╗   ██╗██╗███╗   ███╗",
			" ████╗  ██║██║   ██║██║████╗ ████║",
			" ██╔██╗ ██║██║   ██║██║██╔████╔██║",
			" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║",
			" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║",
			" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝",
			"",
			"        segfault dev env",
			"",
		},

		center = {
			{
				icon = "󰈞  ",
				desc = "Find file",
				key = "f",
				key_format = " %s",
				action = "Telescope find_files",
			},
			{
				icon = "󰱼  ",
				desc = "Find text",
				key = "g",
				key_format = " %s",
				action = "Telescope live_grep",
			},
			{
				icon = "󰋚  ",
				desc = "Recent files",
				key = "r",
				key_format = " %s",
				action = "Telescope oldfiles",
			},
			{
				icon = "  ",
				desc = "File tree",
				key = "e",
				key_format = " %s",
				action = "NvimTreeToggle",
			},
			{
				icon = "󰊢  ",
				desc = "Git status",
				key = "s",
				key_format = " %s",
				action = "Git",
			},
			{
				icon = "󰒲  ",
				desc = "Home Manager switch",
				key = "h",
				key_format = " %s",
				action = "terminal cd ~/.config/home-manager && home-manager switch --flake .#segfault -b backup",
			},
			{
				icon = "  ",
				desc = "Quit",
				key = "q",
				key_format = " %s",
				action = "qa",
			},
		},

		footer = {
			"",
			"Catppuccin Mocha • NixOS • Neovim",
		},
	},
})

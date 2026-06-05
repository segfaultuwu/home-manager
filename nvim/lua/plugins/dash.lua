local ok, dashboard = pcall(require, "dashboard")
if not ok then
	return
end

vim.api.nvim_set_hl(0, "DashboardHeader", {
	fg = "#a6e3a1",
	bold = true,
})

vim.api.nvim_set_hl(0, "DashboardFooter", {
	fg = "#a6e3a1",
})

dashboard.setup({
	theme = "doom",

	config = {
		header = {
			[[                    |                    ]],
			[[                   |.|                   ]],
			[[                  |\./|                  ]],
			[[  .               |\./|               .  ]],
			[[   \^.\          |\\.//|          /.^/   ]],
			[[    \--.|\       |\\.//|       /|.--/    ]],
			[[      \--.| \    |\\.//|    / |.--/      ]],
			[[       \---.|\    |\./|    /|.---/       ]],
			[[          \--.|\  |\./|  /|.--/          ]],
			[[             \ .\  |.|  /. /             ]],
			[[   _ -_^_^_^_-  \ \\ // /  -_^_^_- _     ]],
			[[     - -/_/_/- ^_^/| |\^_^ -\_\_\- -     ]],
			[[               /_ / | \ _\               ]],
			[[                    |                    ]],
			[[https://segfault.exists.lol/home-manager/]],
			[[                                         ]],
		},

		center = {
			{
				icon = "  󰈞  ",
				icon_hl = "DashboardIcon",
				desc = "Find file",
				desc_hl = "DashboardDesc",
				key = "f",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "Telescope find_files",
			},
			{
				icon = "  󰱼  ",
				icon_hl = "DashboardIcon",
				desc = "Find text",
				desc_hl = "DashboardDesc",
				key = "g",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "Telescope live_grep",
			},
			{
				icon = "  󰋚  ",
				icon_hl = "DashboardIcon",
				desc = "Recent files",
				desc_hl = "DashboardDesc",
				key = "r",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "Telescope oldfiles",
			},
			{
				icon = "    ",
				icon_hl = "DashboardIcon",
				desc = "File tree",
				desc_hl = "DashboardDesc",
				key = "e",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "NvimTreeToggle",
			},
			{
				icon = "  󰏇  ",
				icon_hl = "DashboardIcon",
				desc = "Oil file manager",
				desc_hl = "DashboardDesc",
				key = "o",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "Oil",
			},
			{
				icon = "  󰊢  ",
				icon_hl = "DashboardIcon",
				desc = "Git status",
				desc_hl = "DashboardDesc",
				key = "s",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "Git",
			},
			{
				icon = "  󰒲  ",
				icon_hl = "DashboardIcon",
				desc = "Home Manager switch",
				desc_hl = "DashboardDesc",
				key = "h",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "terminal cd ~/.config/home-manager && home-manager switch --flake .#segfault -b backup",
			},
			{
				icon = "    ",
				icon_hl = "DashboardIcon",
				desc = "Quit",
				desc_hl = "DashboardDesc",
				key = "q",
				key_hl = "DashboardKey",
				key_format = "  [%s]",
				action = "qa",
			},
		},
	},
})

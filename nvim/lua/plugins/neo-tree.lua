-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		-- ⭐ 全局窗口（最重要）
		window = {
			position = "left",
			width = 40,
			mappings = {
				["\\"] = "close_window",
			},
		},

		-- ⭐ 文件系统行为
		filesystem = {
			follow_current_file = {
				enabled = true, -- 自动定位当前文件（强烈建议）
			},
			filtered_items = {
				hide_dotfiles = false, -- 不隐藏 dotfiles（开发更实用）
				hide_gitignored = true,
			},
		},
	},
}

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	keys = {
		{ "<leader>e", ":Neotree toggle reveal<CR>", desc = "NeoTree Toggle", silent = true },
	},
	opts = {
		window = {
			position = "left",
			width = 30,
		},
		filesystem = {
			follow_current_file = {
				enabled = true, -- 自动定位当前文件（强烈建议）
			},
			filtered_items = {
				hide_dotfiles = false, -- 不隐藏 dotfiles（开发更实用）
				hide_gitignored = false,
			},
		},
		default_component_configs = {
			git_status = {
				symbols = {
					-- 变更类型 (使用更简洁的符号)
					added = "", -- 原来是 ✚，换成纤细的加号
					modified = "", -- 原来是 ，换成更具变化的修改符号
					deleted = "", -- 原来是 ✖，换成圆润的删除符号
					renamed = "", -- 原来是 󰁕，换成更具流线感的重命名符号

					-- 状态类型 (增强辨识度)
					untracked = "󰞋", -- 换成更现代的疑问标记
					ignored = "󰆚", -- 换成更简约的忽略图标
					unstaged = " 󰄱 ", -- 保留该符号，它比较平衡
					staged = "󰗡", -- 换成更精致的勾选符号
					conflict = "", -- 保持不变，这是 Git 冲突的经典符号
				},
			},
		},
	},
}

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-a>",
					next = "<C-down>",
					prev = "<C-up>",
					dismiss = "<C-S-a>", -- ctrl + shift + a ==> dismiss
				},
			},
			panel = {
				enabled = false,
			},
		})
	end,
}

return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	-- optional: provides snippets for the snippet source
	dependencies = {
		-- Snippet Engine
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = (function()
				-- 排除win32环境
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
	},

	-- 防止opts中的sources.default被覆盖默认配置
	opts_extend = { "sources.default" },
	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "default" },
		appearance = {
			nerd_font_variant = "mono",
		},
		-- 显示文档
		completion = {
			documentation = { auto_show = false, auto_show_delay_ms = 500 },
		},
		-- 补全来源
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		snippets = { preset = "luasnip" },
		-- 排序方法
		fuzzy = { implementation = "prefer_rust_with_warning" },
		-- 显示签名
		signature = { enabled = true },
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
		-- 与blink.cmp冲突，暂时隐藏copilot的建议
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuOpen",
			callback = function()
				vim.b.copilot_suggestion_hidden = true
			end,
		})
		-- 打开copilot建议
		vim.api.nvim_create_autocmd("User", {
			pattern = "BlinkCmpMenuClose",
			callback = function()
				vim.b.copilot_suggestion_hidden = false
			end,
		})
	end,
}

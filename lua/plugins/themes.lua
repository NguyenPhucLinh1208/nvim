return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = false,
		-- Không đặt oxocarbon làm mặc định nữa
		-- config = function()
		-- 	vim.opt.background = "dark" -- set this to dark or light
		-- 	vim.cmd("colorscheme oxocarbon")
		-- end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		config = function()
			vim.cmd("colorscheme catppuccin-mocha") -- Đặt Catppuccin Mocha làm mặc định
			vim.opt.background = "dark" -- Đảm bảo nền tối cho theme này
		end,
	},
}

return {
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

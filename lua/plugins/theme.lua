-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	init = function()
-- 		vim.cmd.colorscheme("tokyonight-night")
-- 		vim.cmd.hi("Comment gui=none")
-- 	end,
-- }

-- return {
--
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	init = function()
-- 		vim.cmd.colorscheme("catppuccin-frappe")
-- 	end,
-- }

-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
--
--
-- return {}

return {
	"slugbyte/lackluster.nvim",
	lazy = false,
	priority = 1000,
	init = function()
		-- vim.cmd.colorscheme("lackluster")
		-- vim.cmd.colorscheme("lackluster-night")
		-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
		vim.cmd.colorscheme("lackluster-mint")
	end,
}

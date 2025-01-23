return {
	{
		"tpope/vim-sleuth",
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = {
					text = "+",
				},
				change = {
					text = "~",
				},
				delete = {
					text = "_",
				},
				topdelete = {
					text = "‾",
				},
				changedelete = {
					text = "~",
				},
			},
		},
	},
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			icons = {
				mappings = vim.g.have_nerd_font,
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			spec = {
				{
					"<leader>c",
					group = "[C]ode",
					mode = { "n", "x" },
				},
				{
					"<leader>d",
					group = "[D]ocument",
				},
				{
					"<leader>r",
					group = "[R]ename",
				},
				{
					"<leader>s",
					group = "[S]earch",
				},
				{
					"<leader>w",
					group = "[W]orkspace",
				},
				{
					"<leader>t",
					group = "[T]oggle",
				},
				{
					"<leader>h",
					group = "Git [H]unk",
					mode = { "n", "v" },
				},
			},
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("nvim-autopairs").setup({})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{ -- Add indentation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",
		-- See `:help ibl`
		main = "ibl",
		opts = {
			scope = {
				enabled = false,
			},
		},
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			signs = false,
		},
	},
	{
		"echasnovski/mini.nvim",
		config = function()
			require("mini.ai").setup({
				n_lines = 500,
			})

			require("mini.surround").setup()

			local statusline = require("mini.statusline")
			statusline.setup({
				use_icons = vim.g.have_nerd_font,
			})

			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"python",
				"go",
				"java",
			},
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "ruby", "python" },
			},
			indent = {
				enable = true,
				disable = { "ruby" },
			},
		},
	},
	-- { "akinsho/toggleterm.nvim", version = "*", config = true },
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = true,
		keys = { { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" } },
	},
	{
		"akinsho/toggleterm.nvim",
		tag = "*", -- Use the latest tag
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<C-t>]], -- Map Ctrl-T to toggle the terminal
				direction = "float", -- Optional: choose "horizontal", "vertical", "float", or "tab"
				shell = vim.o.shell,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- Ensure Treesitter is available
		},
		event = "BufReadPost", -- or remove if you prefer to load immediately
		config = function()
			require("treesitter-context").setup({
				enable = true, -- Enable this plugin
				multiwindow = false, -- Enable multiwindow support
				max_lines = 0, -- No limit on the window lines
				min_window_height = 0, -- No min window height for context
				line_numbers = true,
				multiline_threshold = 20, -- Maximum lines to show for a single context
				trim_scope = "outer", -- Discard outer context lines if max_lines is exceeded
				mode = "cursor", -- Calculate context from cursor line
				separator = nil, -- e.g., use "-" or something if you want a separator
				zindex = 20, -- Z-index for the context window
				on_attach = nil, -- Callback on_attach
			})
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
}

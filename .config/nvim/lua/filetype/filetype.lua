require("filetype").setup({
	overrides = {
		extensions = {
			dircolors = "dircolors",
			tmTheme = "xml",
			vifm = "vifm",
			micro = "lua",
			properties = "jproperties",
			gitignore = "gitignore",
		},
		literal = {
			vifmrc = "vifm",
			viminfo = "viminfo",
			README = "markdown",
			ignore = "gitignore",
			log = "log",
		},
		complex = {
			["*tmux.conf"] = "tmux",
			["*.config/colors/*"] = "jproperties",
		},

		-- The same as the ones above except the keys map to functions
		function_extensions = {
			["cpp"] = function()
				vim.bo.filetype = "cpp"
				-- Remove annoying indent jumping
				vim.bo.cinoptions = vim.bo.cinoptions .. "L0"
			end,
			["pdf"] = function()
				vim.bo.filetype = "pdf"
				-- Open in PDF viewer automatically
				vim.fn.jobstart("xdg-open --chosser " .. '"' .. vim.fn.expand("%") .. '"')
			end,
		},
		function_literal = {
			Brewfile = function()
				vim.cmd("syntax off")
			end,
		},
		function_complex = {
			["*/notes/%w+"] = function()
				vim.cmd("iabbrev $ $$")
			end,
		},

		shebang = {
			dash = "sh",
		},
	},
})

return {
	-- "folke/tokyonight.nvim",
	-- 'Mofiqul/dracula.nvim',
    -- "catppuccin/nvim",
    "Shatur/neovim-ayu",
	lazy = false,
	priority = 1000,
	config = function()

		require("ayu").setup({
            overrides = {
                LineNr = { fg = "#636A72" },
                Normal = { bg = "None" },
                NormalFloat = { bg = "none" },
                ColorColumn = { bg = "None" },
                SignColumn = { bg = "None" },
                Folded = { bg = "None" },
                FoldColumn = { bg = "None" },
                CursorLine = { bg = "None" },
                CursorColumn = { bg = "None" },
                VertSplit = { bg = "None" },

			-- colors = {
			-- 	fg = '#f8f8f8'
				-- background = '#1e1f21'
			-- }
        }
        })
		vim.cmd.colorscheme 'ayu-dark'
	end,
}

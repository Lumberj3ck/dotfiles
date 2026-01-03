return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
            require('telescope').setup({
                defaults = {
                    file_ignore_patterns = { "node_modules", ".git", "__pycache__", "venv"},
                }
            })
			local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>pf', function()
                builtin.find_files({ no_ignore = true, hidden= true })
            end, { desc = "Find files (including ignored)" })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>ff', builtin.buffers, {})
			vim.keymap.set('n', '<C-p>', builtin.git_status, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require("telescope").setup {
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown {
						}
					}
				}
			}
			require("telescope").load_extension("ui-select")
		end
	}
}

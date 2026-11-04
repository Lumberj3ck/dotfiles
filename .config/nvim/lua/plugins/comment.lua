return {
	"numToStr/Comment.nvim",
	config = function()
		require('Comment').setup({
			pre_hook = function()
				if vim.bo.filetype == 'tex' then
					return vim.bo.commentstring
				end
			end,
		})
		vim.keymap.set('n', '<leader>/', function()
			return vim.v.count == 0
			and '<Plug>(comment_toggle_linewise_current)'
			or '<Plug>(comment_toggle_linewise_count)'
		end, { expr = true })
		vim.keymap.set('x', '<leader>/', '<Plug>(comment_toggle_linewise_visual)')
	end
}

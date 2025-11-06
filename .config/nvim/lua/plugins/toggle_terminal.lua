return {
	  {'akinsho/toggleterm.nvim', version = "*",
	   config = function()
		   require('toggleterm').setup
		   {
			start_in_insert = true,
		   }
		   vim.keymap.set('n', '<leader>t', '<Cmd>ToggleTerm size=10 direction=float<CR><Cmd>startinsert<CR>')


		   -- local opts = {buffer = 0}
		   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], {})
		   vim.keymap.set('t', 'jk', [[<C-\><C-n><Cmd>ToggleTerm<CR>]], {})
		   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], {})
		   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], {})
		   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], {})
		   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], {})
		   vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], {})
	   end
	   }
}

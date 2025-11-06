vim.g.mapleader = ' '
vim.wo.number = true
vim.o.hlsearch = false
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'

vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.smarttab = true
vim.opt.wrap = true

vim.o.undofile = true
vim.opt.scrolloff = 8
vim.opt.swapfile = false

vim.opt.relativenumber = true

vim.keymap.set('n', '<leader>pv', vim.cmd.Ex)
vim.o.termguicolors = true

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

vim.keymap.set('n', '<C-j>', '<Cmd>bNext<CR>')
vim.keymap.set('n', '<C-l>', '<Cmd>bprev<CR>')
vim.keymap.set('n', 'gw', '<Cmd>bd!<CR>')
vim.keymap.set('n', '<Space><Enter>', 'o<Esc>')

for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, i .. 'gt', { noremap = true, silent = true })
end


vim.keymap.set('n', 'gk', '<Cmd>tabnext<CR>')
vim.keymap.set('n', 'gj', '<Cmd>tabprev<CR>')
vim.keymap.set('n', '<leader>j', '<Cmd>tabnew<CR>')
vim.keymap.set('t', 'jk', '<C-\\><C-n>')

vim.filetype.add({
    extension = {
        gotmpl = 'gotmpl',
    },
    pattern = {
        [".*/templates/.*%.tpl"] = "helm",
        [".*/templates/.*%.ya?ml"] = "helm",
        ["helmfile.*%.ya?ml"] = "helm",
    },
})



vim.api.nvim_create_user_command('W', 'w ++p', {})



vim.api.nvim_create_user_command('FormatJSON', function()
    if vim.fn.executable('jq') == 0 then
        vim.api.nvim_err_writeln('jq is not installed. Please install jq to use this command.')
        return
    end

    -- Get the current file path
    local file_path = vim.fn.expand('%:p')

    -- Read the current file content
    local lines = vim.fn.readfile(file_path)
    local content = table.concat(lines, '\n')

    local formatted_content = vim.fn.system('jq .', content)

    -- Check if jq succeeded
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_err_writeln('Failed to format JSON. The file might not contain valid JSON.')
        return
    end

    -- Write the formatted JSON back to the file
    vim.fn.writefile(vim.fn.split(formatted_content, '\n'), file_path)

    vim.cmd("e!")
    -- Notify the user
    vim.api.nvim_echo({ { 'JSON formatted and written back to the file.', 'None' } }, true, {})
end, {})

vim.api.nvim_set_keymap('n', '<leader>fj', ':FormatJSON<CR>', { noremap = true, silent = true })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "netrw",
    callback = function()
        vim.api.nvim_buf_set_keymap(0, "n", "qq", "<cmd>Rex<CR><Esc>", { noremap = true, silent = true })
    end,
})



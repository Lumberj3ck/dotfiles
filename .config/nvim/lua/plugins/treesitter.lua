return {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup {
            ensure_installed = { "c", "lua", "vim", "python", "query", "html", "htmldjango"},
            sync_install = false,
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            }, }
    end
}

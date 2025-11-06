return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set('n', '<leader>e', '<cmd>:Neotree toggle<cr>', {})
        vim.keymap.set('n', '<leader>o', '<cmd>:Neotree focus<cr>', {})

        require("neo-tree").setup({

            window = {
                position = "float",
                height = 0.8,
                width = 0.8,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
            },
            filesystem = {
                hijack_netrw_behavior = "open_default",
                filtered_items = {
                    hide_dotfiles = false,
                    hide_gitignored = false,
                    hide_hidden = false,
                },
            }
        })
    end
}

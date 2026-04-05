return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        main = 'nvim-treesitter',
        opts = {
            ensure_installed = {
                'php',
                'html',
                'css',
                'javascript',
                'vue',
                'json',
                'lua',
            },
            highlight = { enable = true },
            indent = { enable = true },
        },
    },
}

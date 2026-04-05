return {
    {
        'adalessa/laravel.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-neotest/nvim-nio',
        },
        ft = { 'php', 'blade' },
        event = { 'BufEnter composer.json' },
        keys = {
            { '<leader>ll', function() Laravel.pickers.laravel()  end, desc = 'Laravel picker' },
            { '<leader>la', function() Laravel.pickers.artisan()  end, desc = 'Laravel artisan' },
            { '<leader>lr', function() Laravel.pickers.routes()   end, desc = 'Laravel routes' },
            { '<leader>lm', function() Laravel.pickers.make()     end, desc = 'Laravel make' },
            { '<leader>lv', function() Laravel.commands.run('view:finder') end, desc = 'Laravel view finder' },
        },
        opts = {
            features = {
                pickers = {
                    provider = 'telescope',
                },
            },
        },
    },
}

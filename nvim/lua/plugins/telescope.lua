return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        local builtin = require('telescope.builtin')
        -- Fuzzy find files by name in the current project directory
        vim.keymap.set('n', '<leader>ff', builtin.find_files,  { desc = 'Find files' })
        -- Search for a string across all files (requires ripgrep)
        vim.keymap.set('n', '<leader>fg', builtin.live_grep,   { desc = 'Live grep' })
        -- Switch between currently open buffers
        vim.keymap.set('n', '<leader>fb', builtin.buffers,     { desc = 'Buffers' })
        -- Search Neovim's built-in help documentation
        vim.keymap.set('n', '<leader>fh', builtin.help_tags,   { desc = 'Help tags' })
        -- Browse recently opened files
        vim.keymap.set('n', '<leader>fr', builtin.oldfiles,    { desc = 'Recent files' })
    end
}

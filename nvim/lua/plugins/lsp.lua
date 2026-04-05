-- LSP (Language Server Protocol) support.
-- Mason installs language servers, mason-lspconfig bridges mason with nvim's
-- built-in LSP client. Neovim 0.11+ uses vim.lsp.config() / vim.lsp.enable()
-- directly instead of the old lspconfig.setup() pattern.
--
-- Keymaps (active when LSP attaches to a buffer):
--   gd            Go to definition
--   K             Hover docs
--   <leader>rn    Rename symbol
--   <leader>ca    Code action
--   gr            Find references
--   [d / ]d       Prev / next diagnostic
return {
    { 'mason-org/mason.nvim', config = true },
    {
        'mason-org/mason-lspconfig.nvim',
        dependencies = { 'mason-org/mason.nvim' },
        opts = {
            ensure_installed = {
                'intelephense', -- PHP / Laravel
            },
            automatic_enable = true,
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = { 'mason-org/mason-lspconfig.nvim' },
        config = function()
            -- Keymaps applied whenever an LSP attaches to a buffer
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(event)
                    local opts = { buffer = event.buf }
                    local map = function(key, fn, desc)
                        vim.keymap.set('n', key, fn, vim.tbl_extend('force', opts, { desc = desc }))
                    end
                    map('gd',          vim.lsp.buf.definition,   'Go to definition')
                    map('K',           vim.lsp.buf.hover,        'Hover docs')
                    map('<leader>rn',  vim.lsp.buf.rename,       'Rename symbol')
                    map('<leader>ca',  vim.lsp.buf.code_action,  'Code action')
                    map('gr',          vim.lsp.buf.references,      'References')
                    map('gi',          vim.lsp.buf.implementation, 'Go to implementation')
                    map('[d',          vim.diagnostic.goto_prev, 'Prev diagnostic')
                    map(']d',          vim.diagnostic.goto_next, 'Next diagnostic')
                end
            })

            -- PHP / Laravel
            vim.lsp.config('intelephense', {
                filetypes = { 'php' },
                root_markers = { 'composer.json', '.git' },
                settings = {
                    intelephense = {
                        files = {
                            maxSize = 1000000,
                        },
                        environment = {
                            includePaths = { 'vendor' },
                        },
                    }
                }
            })
        end
    }
}

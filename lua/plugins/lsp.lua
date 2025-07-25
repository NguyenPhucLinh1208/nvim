return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
        require('mason').setup()
        require('mason-tool-installer').setup({
            ensure_installed = { 'black', 'isort', 'ruff' },
        })

        local lspconfig = require('lspconfig')
        local util = require('lspconfig/util')

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

        local on_attach = function(client, bufnr)
            -- Vô hiệu hóa hiển thị diagnostics cho client này
            client.handlers['textDocument/publishDiagnostics'] = function() end

            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format { async = true }
            end, bufopts)
        end

        -- Pyright cấu hình với .venv
        lspconfig.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = util.root_pattern("pyproject.toml", "requirements.txt", ".venv", ".git"),
            settings = {
                python = {
                    pythonPath = ".venv/bin/python",  -- nếu dùng Windows: ".venv/Scripts/python.exe"
                    analysis = {
                        typeCheckingMode = "off",
                        autoSearchPaths = true,
                        useLibraryCodeForTypes = true,
                        diagnosticMode = "off",
                        reportMissingImports = "none",
                        reportMissingModuleSource = "none",
                        reportMissingTypeStubs = "none",
                    },
                },
            },
        })

        -- Ruff (tùy chọn nếu bạn cần)
        lspconfig.ruff.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            init_options = {
                settings = {
                    args = {
                        "--ignore", "F401,E402",
                    },
                },
            },
        })

        -- Các LSP server khác
        local servers = {
            'jsonls',
            'yamlls',
            'dockerls',
        }

        for _, server_name in ipairs(servers) do
            lspconfig[server_name].setup({
                on_attach = on_attach,
                capabilities = capabilities,
            })
        end

        -- Cấu hình diagnostics toàn cục để tắt hiển thị
        vim.diagnostic.config({
          virtual_text = {
            enabled = false,
          },
          signs = false,
          update_in_insert = false,
          underline = false,
          float = false,
        })
    end,
}

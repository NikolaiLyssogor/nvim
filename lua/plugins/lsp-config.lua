return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.pyright.setup({
                on_attach = on_attach,
                settings = {
                    python = {
                        analysis = {
                            diagnosticMode = "openFilesOnly",
                            typeCheckingMode = "strict", -- normal or strict
                            useLibraryCodeForTypes = true,
                            autoImportCompletions = true,
                        },
                    },
                },
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            -- vim.api.nvim_set_keymap('i', '<c-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("i", "<c-k>", function()
                vim.lsp.buf.signature_help()
            end, { buffer = true })
            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers["signature_help"], {
                border = "single",
                close_events = { "CursorMoved", "BufHidden", "InsertCharPre" }, -- InsertCharPre, BufHidden, CursorMoved
            })
            vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                virtual_text = false
            }
        )
        end,
    },
}

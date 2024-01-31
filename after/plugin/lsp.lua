-- local lsp = require("lsp-zero")
-- local nvim_lsp = require("lspconfig")
-- local lspkind = require('lspkind')

-- lsp.preset("recommended")

-- lsp.ensure_installed({
--   'tsserver',
-- })

-- -- Fix Undefined global 'vim'
-- lsp.nvim_workspace()

-- -- local on_attach = function(client)
-- --   if client.server_capabilities.documentFormattingProvider then
-- --     vim.api.nvim_command [[augroup Format]]
-- --     vim.api.nvim_command [[autocmd! * <buffer>]]
-- --     vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
-- --     vim.api.nvim_command [[augroup END]]
-- --   end
-- -- end

-- nvim_lsp.tsserver.setup {
--   -- on_attach = on_attach,
--   filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
--   cmd = { "typescript-language-server", "--stdio" },
-- }

-- nvim_lsp.lua_ls.setup {
--   -- on_attach = on_attach,
--   settings = {
--     Lua = {
--       diagnostics = {
--         globals = { "vim" },
--       },
--       workspace = {
--         library = {
--           library = vim.api.nvim_get_runtime_file("", true),
--           checkThridParty = false,
--         },
--       },
--     },
--   },
-- }


-- local cmp = require('cmp')
-- local cmp_select = { behavior = cmp.SelectBehavior.Select }
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--   ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })

-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings,
--   sources = cmp.config.sources({
--     { name = 'nvim_lsp' },
--     { name = 'buffer' },
--   }),
--   formatting = {
--     format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
--   },
-- })

-- lsp.set_preferences({
--   suggest_lsp_servers = false,
--   sign_icons = {
--     error = 'E',
--     warn = 'W',
--     hint = 'H',
--     info = 'I'
--   }
-- })

-- lsp.on_attach(function(client, bufnr)
--   local opts = { buffer = bufnr, remap = false }

--   vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--   vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--   vim.keymap.set("n", "<leader>gs", function() vim.lsp.buf.code_action() end, opts)
--   vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
--   vim.keymap.set("n", "<leader>K", function() vim.diagnostic.open_float() end, opts)
-- end)

-- lsp.setup()

-- vim.diagnostic.config({
--   virtual_text = true, -- disable virtual text
--   signs = {
--     active = signs,    -- show signs
--   },
--   update_in_insert = true,
--   underline = true,
--   severity_sort = true,
--   float = {
--     focusable = true,
--     style = "minimal",
--     border = "rounded",
--     source = "always",
--     header = "",
--     prefix = "",
--     width = 150,
--   },
-- })

--local lsp = require('lsp-zero')

--lsp.preset('recommended')

--lsp.ensure_installed({
--  -- typescript
--  'tsserver',
--  'eslint',
--  -- lua
--  'sumneko_lua',
--  -- python
--  --'black',
--  --'isort',
--  --'pylint',
--  --'mypy',
--  --'pyright',
--  ---- rust
--  --'rust-analyzer',
--  --'rustfmt',
--  ---- go
--  --'gopls',
--  ----
--  --'sql-formatter',
--  --'ansible-language-server',
--})

---- Fix Undefined global 'vim'
--lsp.configure('sumneko_lua', {
--    settings = {
--        Lua = {
--            diagnostics = {
--                globals = { 'vim' }
--            }
--        }
--    }
--})

--local cmp = require('cmp')
--local cmp_select = {behavior = cmp.SelectBehavior.Select}
--local cmp_mappings = lsp.defaults.cmp_mappings({
--  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
--  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--  ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--  ["<C-Space>"] = cmp.mapping.complete(),
--})

--lsp.setup_nvim_cmp({
--  mapping = cmp_mappings
--})

--lsp.on_attach(function(client, bufnr)
--  local opts = {buffer = bufnr, remap = false}

--  if client.name == "eslint" then
--      vim.cmd.LspStop('eslint')
--      return
--  end

--  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--  vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--  vim.keymap.set("n", "]g", vim.diagnostic.goto_next, opts)
--  vim.keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)
--  vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--  vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
--  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
--end)

--lsp.setup()

----local lsp_format = require("lsp-format")

----lsp_format.setup {
----    python = {
----        order = { "black", "isort" }
----    }
----}

----local on_attach = function(client)
----    lsp_format.on_attach(client)
----end

----local lspconfig = require('lspconfig')

----lspconfig.pylsp.setup{
----    on_attach = on_attach,
----    settings = {
----        -- formatCommand = {"black"},
----        --formatCommand = {"isort"},
----        pylsp = {
----            plugins = {
----                pycodestyle = { enabled = false },
----                pyls_flake8 = { enabled = false },
----                pylint = { enabled = false },
----                black = { enabled = true },
----                isort = { enabled = true },
----                pyls_mypy = {
----                    enabled = true,
----                    --live_mode = true,
----                },
----            },
----        }
----    }
----}

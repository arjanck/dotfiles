require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "bashls", "rust_analyzer", "pyright", "ruff"}
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic window' })

  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config("ruff", {
  on_attach = on_attach,
  capabilities = capabilities,
})

vim.lsp.config("clangd", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "c", "cpp", "objc", "objcpp" },
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
})

vim.lsp.config("bashls", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "sh" }
})

vim.lsp.config("rust_analyzer", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },  -- Enables all features in Cargo.toml
      procMacro = { enable = true },   -- Enables procedural macros
    }
  },
})

vim.lsp.config("lua_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
})

vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        disableOrganizeImports = true,
      },
    },
  },
})

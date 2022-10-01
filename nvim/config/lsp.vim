lua << EOF
local nvim_lsp = require('lspconfig')
local lsp_installer = require('nvim-lsp-installer')

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗"
      }
    }
})

require("null-ls").setup({
    sources = {
        require("null-ls").builtins.formatting.prettier,
        require("null-ls").builtins.formatting.rubocop,
        require("null-ls").builtins.diagnostics.rubocop,
    },
})


local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    async = true,
    filter = function(client)
      return client.name == "null-ls"
    end,
    bufnr = bufnr,
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', ',wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', ',wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', ',wl', function()
  print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', ',D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', ',rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', ',ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', ',cf', lsp_formatting, bufopts)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

lsp_installer.on_server_ready(function(server)
  local options = { on_attach=on_attach, capabilities=capabilities }
  if server.name == "solargraph" then
    options = {
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        solargraph = {
          diagnostics = true,
          useBundler = true,
        }
      }
    }
  end
  -- this is the same as lspconfig's setup function
  server:setup(options)
end)

--- diagnostics config
vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]
EOF

"==========================================
" Native LSP + diagnostics (replaces syntastic)
"==========================================
" Server configs come from nvim-lspconfig. A server is enabled only when its
" binary is on PATH, so installing one is enough to switch it on.
" Default mappings (Neovim 0.11+): K hover, grn rename, gra code action,
" grr references, gri implementation, [d ]d next/prev diagnostic, <C-w>d float.
lua << LUA
local servers = {
  rubocop  = 'rubocop',
  ruby_lsp = 'ruby-lsp',
  elixirls = 'elixir-ls',
  ts_ls    = 'typescript-language-server',
  jsonls   = 'vscode-json-language-server',
  cssls    = 'vscode-css-language-server',
  html     = 'vscode-html-language-server',
  bashls   = 'bash-language-server',
  gopls    = 'gopls',
  pyright  = 'pyright-langserver',
  lua_ls   = 'lua-language-server',
}
for name, bin in pairs(servers) do
  if vim.fn.executable(bin) == 1 then
    vim.lsp.enable(name)
  end
end

vim.diagnostic.config({
  virtual_text = true,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✗',
      [vim.diagnostic.severity.WARN]  = '⚠',
    },
  },
})
LUA

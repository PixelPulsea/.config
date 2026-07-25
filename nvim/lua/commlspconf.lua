vim.lsp.config('*', {
  root_markers = { '.git' },
  on_attach = function(client, bufnr)
    -- Define your buffer-local keymaps once for all LSPs
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = '● ',
    spacing = 4,
  },
  
  -- Show icons in the sign column (gutter next to line numbers)
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '',
      [vim.diagnostic.severity.WARN]  = '',
      [vim.diagnostic.severity.HINT]  = '',
      [vim.diagnostic.severity.INFO]  = '',
    },
  },
  
  underline = false,
  severity_sort = true,

  float = {
    border = 'rounded',  -- Options: 'single', 'double', 'rounded', 'solid', 'shadow'
    source = 'always',   -- Display the source of the error (e.g. clangd, pyright)
    header = '',
    prefix = '',
  },
})

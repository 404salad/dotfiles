-- my single file setup
-- have to add snippets yet

-- Install plugins
vim.pack.add{
  'https://github.com/echasnovski/mini.completion',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/ibhagwan/fzf-lua', 
}

-- Leader key
vim.g.mapleader = " "

-- Enable completion
require('mini.completion').setup {}

-- fzf-lua keymaps
vim.keymap.set('n', '<leader>f', function() require('fzf-lua').live_grep() end, { desc = "grep" }) 
vim.keymap.set('n', '<leader>g', function() require('fzf-lua').files() end, { desc = "Find files" })

--LSP on_attach: keymaps only active when LSP is running
 local on_attach = function(_, bufnr)
   local opts = { buffer = bufnr, noremap = true, silent = true }
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts) -- rename
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- code action
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts) -- show full error
 end

-- Rust LSP setup
require('lspconfig').rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      cargo = { allFeatures = true },
      check = { command = "clippy" },
      checkOnSave = true,
    },
  },
}


-- Autoformat Rust on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.rs",
  callback = function() vim.lsp.buf.format({ async = false }) end,
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "■",  -- could be "■", "▎", "x"
  },
  signs = true,     -- show signs in the gutter
  underline = true, -- underline errors/warnings
  update_in_insert = false,
})

-- themeeee
vim.cmd.colorscheme("retrobox")



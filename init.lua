-- my single file rust only setup
-- have to add snippets yet
-- requires neovim 0.12 atleast

-- Install plugins
vim.pack.add{
  'https://github.com/echasnovski/mini.completion',
  'https://github.com/neovim/nvim-lspconfig',
  'https://github.com/ibhagwan/fzf-lua', 
}

-- Leader key
vim.g.mapleader = " "

-- disable mouse to prevent the kitty bug which causes nvim to crash whenever i come back
vim.opt.mouse = ""

-- for yanking into os clipboard (needs a dependency)
vim.opt.clipboard:append("unnamedplus")

--infite undo
vim.opt.undofile = true

-- Enable completion
require('mini.completion').setup {}

-- fzf-lua keymaps
vim.keymap.set('n', '<leader>d', function() require('fzf-lua').live_grep() end, { desc = "grep" }) 
vim.keymap.set('n', '<leader>f', function() require('fzf-lua').files() end, { desc = "Find files" })

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
  callback = function()
	  vim.lsp.buf.format({ async = false }) 
  end,
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


 -- Auto-close brackets in insert mode
local prs = { ['('] = ')', ['['] = ']', ['{'] = '}', ['"'] = '"', ["'"] = "'" }

for open, close in pairs(prs) do
  vim.keymap.set("i", open, function()
    return open .. close .. "<Left>"
  end, { expr = true })

  -- allow skipping over closing char
  vim.keymap.set("i", close, function()
    local col = vim.fn.col('.')
    local line = vim.fn.getline('.')
    if line:sub(col, col) == close then
      return "<Right>"
    else
      return close
    end
  end, { expr = true })
end

-- adding rust comments
local function toggle_comment(opts)
    local start, finish

    if opts.range == 0 then
        -- No range given → just the current line
        start, finish = vim.fn.line("."), vim.fn.line(".")
    else
        start, finish = math.min(opts.line1, opts.line2), math.max(opts.line1, opts.line2)
    end

    -- Check if all lines are commented
    local all_commented = true
    for lnum = start, finish do
        local line = vim.fn.getline(lnum)
        if not line:match("^%s*//") then
            all_commented = false
            break
        end
    end

    if all_commented then
        -- Uncomment everything
        pcall(vim.cmd, start .. "," .. finish .. "s:^\\(\\s*\\)//:\\1")
    else
        -- Comment everything
        vim.cmd(start .. "," .. finish .. "s:^://")
    end

    vim.cmd("noh")
end

vim.api.nvim_create_user_command("ToggleComment", toggle_comment, { range = true })
vim.keymap.set({ "n", "v" }, "<leader>/", ":ToggleComment<CR>")


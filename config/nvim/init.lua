vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.pack.add({ "https://github.com/folke/which-key.nvim" })

vim.lsp.inlay_hint.enable(true)

-- https://rust-analyzer.github.io/book/configuration.html
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {},
  },
  on_attach = function(client, bufnr)
    -- Enable rustfmt on save
    if client.name == "rust_analyzer" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
        end,
      })
    end
  end,
})
vim.lsp.enable("rust_analyzer")

vim.cmd([[
colorscheme retrobox

set clipboard+=unnamedplus  " copy to system keyboard
set cmdheight=0 " remove extra gap at bottom of terminal
set expandtab tabstop=4 shiftwidth=4
set mousescroll=ver:1,hor:1 " scrolling is too fast by default
set nowrap
set number

nnoremap ; :
]])

vim.cmd.colorscheme("retrobox")

vim.pack.add({"https://github.com/neovim/nvim-lspconfig"})

vim.lsp.enable('rust_analyzer')

vim.cmd([[
set number
set expandtab tabstop=4 shiftwidth=4

nnoremap ; :
inoremap jk <esc>
inoremap kj <esc>
set clipboard=unnamedplus
]])

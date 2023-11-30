local g = vim.g

g.sonokai_style = 'atlantis'
g.sonokai_transparent_background = true;

vim.cmd('colorscheme sonokai')

vim.cmd('silent! hi SignColumn guibg=bg ctermbg=bg')
vim.cmd('silent! hi GreenSign guibg=bg ctermbg=bg')
vim.cmd('silent! hi BlueSign guibg=bg ctermbg=bg')
vim.cmd('silent! hi RedSign guibg=bg ctermbg=bg')

vim.cmd('silent! hi VirtualTextError guifg=Red ctermfg=Red')

vim.cmd('sign define LspDiagnosticsSignError text=» texthl=LspDiagnosticsSignError linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=» texthl=LspDiagnosticsSignWarning linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=» texthl=LspDiagnosticsSignInformation linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text=» texthl=LspDiagnosticsSignHint linehl= numhl=')

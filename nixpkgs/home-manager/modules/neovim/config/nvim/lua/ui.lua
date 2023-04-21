local g = vim.g
local is_background_transparent = false

vim.cmd('colorscheme catppuccin')

vim.cmd('silent! hi SignColumn guibg=bg ctermbg=bg')
vim.cmd('silent! hi GreenSign guibg=bg ctermbg=bg')
vim.cmd('silent! hi BlueSign guibg=bg ctermbg=bg')
vim.cmd('silent! hi RedSign guibg=bg ctermbg=bg')

vim.cmd('silent! hi VirtualTextError guifg=Red ctermfg=Red')

if is_background_transparent then
    vim.cmd('hi Normal guibg=NONE ctermbg=NONE')
    vim.cmd('hi Comment guibg=NONE ctermbg=NONE')
    vim.cmd('hi Constant guibg=NONE ctermbg=NONE')
    vim.cmd('hi Special guibg=NONE ctermbg=NONE')
    vim.cmd('hi Identifier guibg=NONE ctermbg=NONE')
    vim.cmd('hi Statement guibg=NONE ctermbg=NONE')
    vim.cmd('hi PreProc guibg=NONE ctermbg=NONE')
    vim.cmd('hi Type guibg=NONE ctermbg=NONE')
    vim.cmd('hi Underlined guibg=NONE ctermbg=NONE')
    vim.cmd('hi Todo guibg=NONE ctermbg=NONE')
    vim.cmd('hi String guibg=NONE ctermbg=NONE')
    vim.cmd('hi Function guibg=NONE ctermbg=NONE')
    vim.cmd('hi Conditional guibg=NONE ctermbg=NONE')
    vim.cmd('hi Repeat guibg=NONE ctermbg=NONE')
    vim.cmd('hi Operator guibg=NONE ctermbg=NONE')
    vim.cmd('hi Structure guibg=NONE ctermbg=NONE')
    vim.cmd('hi LineNr guibg=NONE ctermbg=NONE')
    vim.cmd('hi NonText guibg=NONE ctermbg=NONE')
    vim.cmd('hi SignColumn guibg=NONE ctermbg=NONE')
    vim.cmd('hi CursorLineNr guibg=NONE ctermbg=NONE')
    vim.cmd('hi EndOfBuffer  guibg=NONE ctermbg=NONE')
end

vim.cmd('sign define LspDiagnosticsSignError text=» texthl=LspDiagnosticsSignError linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignWarning text=» texthl=LspDiagnosticsSignWarning linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignInformation text=» texthl=LspDiagnosticsSignInformation linehl= numhl=')
vim.cmd('sign define LspDiagnosticsSignHint text=» texthl=LspDiagnosticsSignHint linehl= numhl=')

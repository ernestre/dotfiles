local g = vim.g
local o = vim.opt

g.mapleader = ','

o.list = true
o.listchars:append "trail:⋅"
o.listchars:append "extends:#"
o.listchars:append "eol:↲"
o.listchars:append "tab:» "

o.encoding = 'utf-8'
o.expandtab = true
o.hidden = true
o.lazyredraw = true -- will buffer screen updates instead of updating all the time show statusline
o.maxmempattern = 20000 -- increase max memory to show syntax highlighting for large files
o.swapfile = false -- Don't create swapfile
o.number = true -- show line numbers
o.relativenumber = true
o.path:append { "**" }
o.pumheight = 10 -- Completion window max size
o.scrolloff = 10 -- scroll off padding
o.shiftwidth = 4 -- when indenting with '>', use 4 spaces width
o.splitright = true -- Open new splits on the right
o.synmaxcol = 200 -- syntax highlight only 200 chars"
o.tabstop = 4 -- show existing tab with 4 spaces width
o.updatetime = 1000 -- wait ms after stop typing to trigger scripts
o.cursorline = true;
o.diffopt:append { "vertical" }
o.linespace = 2
o.shortmess = 'IaTc' -- Disable welcome message and random short messagesA
o.wrap = false
o.laststatus = 3
o.termguicolors = true
o.completeopt = 'menuone,noinsert,noselect'
g.completion_matching_strategy_list = { 'fuzzy' }
g.completion_matching_ignore_case = 1

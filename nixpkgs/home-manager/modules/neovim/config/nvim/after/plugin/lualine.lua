local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#a9a1e1',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
}

local conditions = {
    buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
    end,
    hide_in_width = function()
        return vim.fn.winwidth(0) > 80
    end,
    check_git_workspace = function()
        local filepath = vim.fn.expand('%:p:h')
        local gitdir = vim.fn.finddir('.git', filepath .. ';')
        return gitdir and #gitdir > 0 and #gitdir < #filepath
    end,
}

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            {
                'diff',
                -- Is it me or the symbol for modified us really weird
                symbols = { added = ' ', modified = '柳 ', removed = ' ' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
                cond = conditions.hide_in_width,
            },
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ' },
                diagnostics_color = {
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.cyan },
                },
            },
        },
        lualine_c = {
            {
                'filename',
                -- 0: Just the filename
                -- 1: relative path
                -- 2: absolute path
                -- 3: absolute path, with tilde as the home directory
                path = 1
            }
        },
        lualine_x = {
            'filetype',
            {
                'lsp_status',
                icon = '', -- f013
                symbols = {
                    -- Standard unicode symbols to cycle through for LSP progress:
                    spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                    -- Standard unicode symbol for when LSP is done:
                    done = '✓',
                    -- Delimiter inserted between LSP names:
                    separator = ' ',
                },
                -- List of LSP names to ignore (e.g., `null-ls`):
                ignore_lsp = {},
            }
        },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

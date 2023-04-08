map('n', '<Leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<Leader>dB', ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
map('n', '<Leader>dc', ':lua require"dap".continue()<CR>')
map('n', '<Leader>dj', ':lua require"dap".step_over()<CR>')
map('n', '<Leader>dl', ':lua require"dap".step_into()<CR>')
map('n', '<Leader>dh', ':lua require"dap".step_out()<CR>')
map('n', '<Leader>dr', ':lua require"dap".repl.open()<CR>')
map('n', '<Leader>du', ':lua require"dapui".toggle()<CR>')
map('n', '<Leader>dt', ':lua require"dap-go".debug_test()<CR>')

require('dapui').setup()
require('nvim-dap-virtual-text').setup()
require('dap-go').setup()


-- auto open dap ui
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
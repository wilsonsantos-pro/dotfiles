require("dapui").setup()

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

require('dap-python').setup()
require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', '<F5>', ":lua require'dap'.continue()<CR>")
vim.keymap.set('n', '<leader>so', ":lua require'dap'.itep_over()<CR>")
vim.keymap.set('n', '<leader>si', ":lua require'dap'.itep_into()<CR>")
vim.keymap.set('n', '<leader>st', ":lua require'dap'.itep_out()<CR>")
vim.keymap.set('n', '<leader>b', ":lua require'dap'.toggle_breakpoint()<CR>")

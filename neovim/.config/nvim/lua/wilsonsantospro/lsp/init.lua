local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    print("Error: lspconfig not installed")
  return
end

require "wilsonsantospro.lsp.neodev"
require "wilsonsantospro.lsp.mason"
require("wilsonsantospro.lsp.handlers").setup()
require "wilsonsantospro.lsp.null-ls"
require "wilsonsantospro.lsp.cmp"

local status_ok, onedark = pcall(require, "onedark")
if not status_ok then
  return
end


onedark.setup {
    style = 'warmer'
}
onedark.load()

vim.cmd("colorscheme onedark")

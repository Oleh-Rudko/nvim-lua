local status, undotree = pcall(require, "undotree")
if (not status) then return end

undotree.setup()
vim.keymap.set('n', '<leader>u', undotree.toggle, { noremap = true, silent = true })

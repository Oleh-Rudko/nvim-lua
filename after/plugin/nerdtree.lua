vim.keymap.set('n', '<leader>n', vim.cmd.NERDTreeToggle)
vim.keymap.set('n', '<leader>N', vim.cmd.NERDTreeFind)
-- toggle DBUIToggle
vim.api.nvim_set_keymap('n', '<leader>b', ':DBUIToggle<CR>', { noremap = true, silent = true })

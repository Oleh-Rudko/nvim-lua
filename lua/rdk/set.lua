-- vim.g.rainbow_active = 1 -- 1 to enable, 0 to disable
vim.o.termguicolors = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.showcmd = true
vim.opt.autowrite = false

vim.opt.ttyfast = true
vim.opt.lazyredraw = true
vim.opt.undofile = true

vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")
vim.opt.cursorcolumn = false -- line under the cursor
vim.opt.wildignore:append { '*/node_modules/*' }

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.updatetime = 50
vim.opt.signcolumn = "yes"

-- hightlight the binding.pry in the .rb files
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*.rb",
    callback = function()
        vim.cmd("syn match error contained '\\<binding.pry\\>'")
    end,
})

-- COC
local keyset = vim.keymap.set
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end


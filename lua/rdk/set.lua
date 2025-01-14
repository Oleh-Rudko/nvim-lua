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
vim.opt.undofile = false

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

-- Function to generate a git commit message based on staged changes using ChatGPT summarize
function GenerateGitCommitMessage()
    -- Get the git diff for staged changes
    local handle = io.popen("git diff --cached")
    local git_diff = handle:read("*a")
    handle:close()

    -- Debug: Print the git diff to verify it's captured correctly
    print("Git Diff Output:\n" .. git_diff)

    -- Escape the git_diff for use in Vim commands
    local escaped_diff = vim.fn.escape(git_diff, '"\\')

    -- Use the ChatGPT summarize functionality to generate a commit message
    vim.cmd('let @a = "' .. escaped_diff .. '"') -- Store git_diff in register 'a'
    vim.cmd('normal! gv"ap') -- Paste the git_diff into the buffer
    vim.cmd('ChatGPTRun summarize') -- Run the summarize command
end

-- Bind the function to a command or key mapping in Neovim
vim.api.nvim_set_keymap('n', '<leader>zgc', ':lua GenerateGitCommitMessage()<CR>', { noremap = true, silent = true })

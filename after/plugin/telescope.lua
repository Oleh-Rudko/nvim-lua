local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    path_display = { "truncate "},
    mappings = {
      i = {
        ["<C-u>"] = false,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-j>"] = actions.move_selection_next,
      },
    },
  },
})

-- vim.keymap.set('n', '<leader>gm', function()
--   find_files_in('app/models/')
-- end)
-- vim.keymap.set('n', '<leader>gc', function()
--   find_files_in('app/controllers/')
-- end)
-- vim.keymap.set('n', '<leader>gf', function()
--   find_files_in('spec/factories/')
-- end)
-- vim.keymap.set('n', '<leader>gv', function()
--   find_files_in('app/views/')
-- end)
-- vim.keymap.set('n', '<leader>gp', function()
--   find_files_in('app/components/')
-- end)

vim.keymap.set('n', '<C-f>', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})


vim.keymap.set('n', '<leader>a', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

-- in this case it'll open the Telescope
-- local grep_word_under_cursor = function()
--   local word = vim.fn.expand("<cword>")
--   vim.fn.feedkeys(vim.api.nvim_replace_termcodes(":Telescope grep_string search=" .. word .. "<CR>", true, false, true), "n")
-- end

-- vim.keymap.set("n", "<leader>k", grep_word_under_cursor, { noremap = true, silent = true })

local grep_word_under_cursor = function()
  local word = vim.fn.expand("<cword>")

  vim.cmd("silent grep -R " .. word .. " *")
  vim.cmd("copen")
end

vim.keymap.set("n", "<leader>k", grep_word_under_cursor, { noremap = true, silent = true })


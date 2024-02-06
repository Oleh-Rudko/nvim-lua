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

local grep_word_under_cursor = function()
	local filetype = string.match(vim.api.nvim_buf_get_name(0), "%.%w*$") or vim.o.filetype
	if filetype then
		vim.api.nvim_input([[:vim <C-R><C-W> **/*]] .. filetype .. [[<CR>:cope<CR>]])
	else
		vim.notify("Filetype is nil. Can't grep that shit.", vim.log.levels.ERROR, {})
	end
end

vim.keymap.set({ "n", "v" }, "<leader>k", function() grep_word_under_cursor() end, { noremap = true, silent = true })

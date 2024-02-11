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


-- open Grep in the Telescope window
vim.keymap.set('n', '<leader>A', function()
  builtin.live_grep();
end)

local exclude_dirs = "--exclude-dir=node_modules --exclude-dir=dist --exclude-dir=build --exclude-dir=.git --exclude-dir=.cache --exclude-dir=public --exclude-dir=vendor --exclude-dir=log --exclude-dir=tmp"
local exclude_files="--exclude='*.dump'"

-- open Grep in the copen default vim window
vim.keymap.set('n', '<leader>a', function()
  local input = vim.fn.input("Ack $word $types(,): ")
  -- Split the input into search term and file types.
  local input_parts = vim.split(input, " ", {trimempty = true})
  local search_term = input_parts[1]
  local file_types = {}
  if #input_parts > 1 then
    file_types = vim.split(input_parts[2], ",", {trimempty = true})
  end

  if search_term ~= "" then
    -- Start constructing the grep command.
    local grep_command = "silent grep -R " .. exclude_dirs .. " " .. exclude_files .. " "
    -- Add include options for each specified file type.
    for _, ext in ipairs(file_types) do
      -- Ensure proper escaping for the shell that Vim uses
      grep_command = grep_command .. "--include=\\*." .. ext .. " "
    end
    -- Append the search term, properly escaped.
    grep_command = grep_command .. vim.fn.shellescape(search_term) .. " ."
    -- Execute the command.
    vim.cmd(grep_command)
    -- Open the quickfix list to show the results.
    vim.cmd("copen")
  end
end, {noremap = true, silent = true})

local grep_word_under_cursor = function()
  local word = vim.fn.expand("<cword>")
  -- Start constructing the grep command.
  local grep_command = "silent grep -R " .. exclude_dirs .. " " .. exclude_files .. " "

  vim.cmd(grep_command .. word .. " *")
  vim.cmd("copen")
end

vim.keymap.set("n", "<leader>k", grep_word_under_cursor, { noremap = true, silent = true })


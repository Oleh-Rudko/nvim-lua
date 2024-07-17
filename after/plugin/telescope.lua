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

local exclude_dirs = "--glob '!node_modules/*' --glob '!dist/*' --glob '!build/*' --glob '!.git/*' --glob '!.cache/*' --glob '!public/*' --glob '!vendor/*' --glob '!log/*' --glob '!tmp/*'"
local exclude_files = "--glob '!*.dump' --glob '!*.lock' --glob '!.eslintcache' --glob '!.DS_Store' --glob '!*.min.js' --glob '!*.min.css' --glob '!*.min.html' --glob '!*.min.json' --glob '!*.min.yaml' --glob '!*.min.yml' --glob '!*.min.xml' --glob '!*.min.php' --glob '!*.min.sh' --glob '!*.min.py' --glob '!*.min.rb' --glob '!*.min.java' --glob '!*.min.c' --glob '!*.min.cpp' --glob '!*.min.h' --glob '!*.min.hpp' --glob '!*.min.go' --glob '!*.min.rs' --glob '!*.min.dart' --glob '!*.min.swift' --glob '!*.min.kt' --glob '!*.min.ts' --glob '!*.min.tsx' --glob '!*.min.jsx' --glob '!*.min.vue' --glob '!*.min.scss' --glob '!*.min.sass' --glob '!*.min.less' --glob '!*.min.styl' --glob '!*.png' --glob '!*.ico'"

local function open_quickfix_list()
  vim.cmd("copen")
end

local function execute_rg_command(rg_command)
  local output = vim.fn.systemlist(rg_command)
  vim.fn.setqflist({}, 'r', {title = 'Search Results', lines = output})
  open_quickfix_list()
end

vim.keymap.set('n', '<leader>a', function()
  local input = vim.fn.input("Ack $word $types(,): ")
  local input_parts = vim.split(input, " ", {trimempty = true})
  local search_term = input_parts[1]
  local file_types = {}
  if #input_parts > 1 then
    file_types = vim.split(input_parts[2], ",", {trimempty = true})
  end

  if search_term ~= "" then
    local rg_command = "rg --vimgrep " .. exclude_dirs .. " " .. exclude_files .. " "
    for _, ext in ipairs(file_types) do
      rg_command = rg_command .. "--glob '*." .. ext .. "' "
    end
    rg_command = rg_command .. vim.fn.shellescape(search_term) .. " ."
    execute_rg_command(rg_command)
  end
end, {noremap = true, silent = true})

local grep_word_under_cursor = function()
  local word = vim.fn.expand("<cword>")
  local rg_command = "rg --vimgrep " .. exclude_dirs .. " " .. exclude_files .. " " .. vim.fn.shellescape(word) .. " ."
  execute_rg_command(rg_command)
end

vim.keymap.set("n", "<leader>k", grep_word_under_cursor, { noremap = true, silent = true })


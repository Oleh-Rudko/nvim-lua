vim.g.mapleader = ' '

local keymap = vim.keymap
local map_options = { noremap = true }

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

--easy nav across vim splits
vim.keymap.set("n", "<C-h>", '<C-w>h')
vim.keymap.set("n", "<C-j>", '<C-w>j')
vim.keymap.set("n", "<C-k>", '<C-w>k')
vim.keymap.set("n", "<C-l>", '<C-w>l')

--map <leader>w to open a new vsplit and switch to it
vim.keymap.set("n", "<leader>w", '<C-w>v<C-w>l')
vim.keymap.set("n", "<leader>h", '<C-w>s<C-w>j')

-- quit tab
vim.keymap.set('n', '<leader>q', ':q<CR>')
vim.keymap.set('n', '<leader>t', ':echo "Test"<CR>')


--tabs
vim.keymap.set("n", "<S-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<S-l>", "gt")
vim.keymap.set("n", "<S-h>", "gT")

--apply macros with Q
vim.api.nvim_set_keymap('n', 'Q', '@q', { noremap = true })
vim.api.nvim_set_keymap('v', 'Q', ':norm @q<CR>', { noremap = true })

vim.keymap.set("i", "<C-l>", "<right>")

-- copilot
vim.keymap.set('n', '<leader>cp', ':Copilot panel<CR>')


-- disabled keys normal mode
vim.keymap.set('n', '<Up>', '<NOP>', map_options)
vim.keymap.set('n', '<Down>', '<NOP>', map_options)
vim.keymap.set('n', '<Left>', '<NOP>', map_options)
vim.keymap.set('n', '<PageUp>', '<NOP>', map_options)
vim.keymap.set('n', '<PageDown>', '<NOP>', map_options)
vim.keymap.set('n', '<Cmd>', '<NOP>', map_options)
-- disabled keys insert mode
vim.keymap.set('i', '<PageUp>', '<NOP>', map_options)
vim.keymap.set('i', '<PageDown>', '<NOP>', map_options)
vim.keymap.set('i', '<Cmd>', '<NOP>', map_options)
vim.keymap.set('i', '<Up>', '<NOP>', map_options)
vim.keymap.set('i', '<Down>', '<NOP>', map_options)
vim.keymap.set('i', '<Left>', '<NOP>', map_options)

-- copy to the buffer
vim.cmd([[
  vnoremap <leader>y "*y
]])

-- open blame of the git in the file
vim.keymap.set('n', '<leader>gb', ':G blame<CR>')

-- COC
-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-j> to trigger snippets
vim.keymap.set("i", "<c-j>", "<Plug>(coc-snippets-expand-jump)") -- think

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
-- vim.keymap.set("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
-- vim.keymap.set("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- GoTo code navigation
vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
-- vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})


-- Use K to show documentation in preview window
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
vim.keymap.set("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})


-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", { -- add underline
    group = "CocGroup",
    -- command = "silent call CocActionAsync('highlight')",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})
vim.cmd [[
hi CocHighlightText gui=underline cterm=underline
]]

-- Symbol renaming
vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {silent = true})


-- Formatting selected code
-- vim.keymap.set("x", "<leader>p", "<Plug>(coc-format-selected)", {silent = true})
-- vim.keymap.set("n", "<leader>p", "<Plug>(coc-format-selected)", {silent = true})


-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

-- Apply codeAction to the selected region
-- Example: `<leader>aap` for current paragraph
local opts = {silent = true, nowait = true}
vim.keymap.set("x", "<leader>gs", "<Plug>(coc-codeaction-selected)<CR>", opts)
vim.keymap.set("n", "<leader>gs", "<Plug>(coc-codeaction-selected)<CR>", opts)
vim.keymap.set("n", "gs", "<Plug>(coc-codeaction-selected)<CR>", opts)

-- LATER
-- Remap keys for apply code actions at the cursor position.
-- vim.keymap.set("n", "<leader>ac", "<Plug>(coc-codeaction-cursor)", opts)
-- Remap keys for apply source code actions for current file.
-- vim.keymap.set("n", "<leader>as", "<Plug>(coc-codeaction-source)", opts)
-- Apply the most preferred quickfix action on the current line.
-- vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)

-- Remap keys for apply refactor code actions.
-- vim.keymap.set("n", "<leader>re", "<Plug>(coc-codeaction-refactor)", { silent = true })
-- vim.keymap.set("x", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })
-- vim.keymap.set("n", "<leader>r", "<Plug>(coc-codeaction-refactor-selected)", { silent = true })

-- Run the Code Lens actions on the current line
-- vim.keymap.set("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)


-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
-- vim.keymap.set("x", "if", "<Plug>(coc-funcobj-i)", opts)
-- vim.keymap.set("o", "if", "<Plug>(coc-funcobj-i)", opts)
-- vim.keymap.set("x", "af", "<Plug>(coc-funcobj-a)", opts)
-- vim.keymap.set("o", "af", "<Plug>(coc-funcobj-a)", opts)
-- vim.keymap.set("x", "ic", "<Plug>(coc-classobj-i)", opts)
-- vim.keymap.set("o", "ic", "<Plug>(coc-classobj-i)", opts)
-- vim.keymap.set("x", "ac", "<Plug>(coc-classobj-a)", opts)
-- vim.keymap.set("o", "ac", "<Plug>(coc-classobj-a)", opts)


-- Remap <C-f> and <C-b> to scroll float windows/popups
---@diagnostic disable-next-line: redefined-local
-- local opts = {silent = true, nowait = true, expr = true}
-- vim.keymap.set("n", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- vim.keymap.set("n", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)
-- vim.keymap.set("i", "<C-f>",
--        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(1)<cr>" : "<Right>"', opts)
-- vim.keymap.set("i", "<C-b>",
--        'coc#float#has_scroll() ? "<c-r>=coc#float#scroll(0)<cr>" : "<Left>"', opts)
-- vim.keymap.set("v", "<C-f>", 'coc#float#has_scroll() ? coc#float#scroll(1) : "<C-f>"', opts)
-- vim.keymap.set("v", "<C-b>", 'coc#float#has_scroll() ? coc#float#scroll(0) : "<C-b>"', opts)


-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
-- vim.keymap.set("n", "<C-s>", "<Plug>(coc-range-select)", {silent = true})
-- vim.keymap.set("x", "<C-s>", "<Plug>(coc-range-select)", {silent = true})

-- Prettier
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>p', ':CocCommand prettier.formatFile<CR>', opts)
vim.api.nvim_set_keymap('v', '<leader>aw', ':CocCommand cSpell.addWordToUserDictionary<CR>', opts)
vim.api.nvim_set_keymap('v', '<leader>"', ":s/\"/'/g<CR>", opts)


-- Add `:Format` command to format current buffer
vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})

-- " Add `:Fold` command to fold current buffer
vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", {nargs = '?'})

-- Add `:OR` command for organize imports of the current buffer
vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.opt.statusline:prepend("%{coc#status()}%{get(b:,'coc_current_function','')}")

-- "rspec vim mappings
vim.api.nvim_set_keymap('n', '<leader>s',
    ":call RunNearestSpec()<CR>:redraw!<CR><CR>:!tmux select-window -t spec<CR><CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>t',
    ":call RunCurrentSpecFile()<CR>:redraw!<CR><CR>:!tmux select-window -t spec<CR><CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>l',
    ":call RunLastSpec()<CR>:redraw!<CR><CR>:!tmux select-window -t spec<CR><CR>", opts)
vim.api.nvim_set_keymap('n', '<leader>*',
    ":call RunAllSpecs()<CR>:redraw!<CR><CR>:!tmux select-window -t spec<CR><CR>", opts)
vim.g.rspec_command = "silent !tmux send-keys -t spec 'clear' C-m 'bundle exec rspec --format progress --order rand {spec}' C-m"

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
-- vim.keymap.set("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
-- vim.keymap.set("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
-- vim.keymap.set("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
-- vim.keymap.set("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
-- vim.keymap.set("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
-- vim.keymap.set("n", "<space>j", ":<C-u>CocNext<cr>", opts)
-- Do default action for previous item
-- vim.keymap.set("n", "<space>k", ":<C-u>CocPrev<cr>", opts)
-- Resume latest coc list
-- vim.keymap.set("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- nnoremap <leader>b :DBUIToggle<CR>
-- nnoremap <leader>a :Ack
-- nnoremap <leader>k :Ack <C-R><C-W><CR>
-- " We need to install rg -> brew install rg
-- if executable('rg')
--     let g:ctrlp_user_command = 'rg --files %s'
--     let g:ctrlp_use_caching = 0
--     let g:ctrlp_working_path_mode = 'ra'
--     let g:ctrlp_switch_buffer = 'et'
-- endif
-- let g:ackprg = 'rg --vimgrep --no-heading'
-- nmap <leader>gs :G<CR>


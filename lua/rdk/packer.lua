vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for better highlight files
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('windwp/nvim-ts-autotag')
    -- use('HiPhish/nvim-ts-rainbow2') -- is not working now maybe later try

    -- telescope for fzf
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }

    local coc_global_extensions = {
        'coc-css',
        'coc-emmet',
        'coc-eslint',
        'coc-git',
        'coc-html',
        'coc-json',
        'coc-pairs',
        'coc-prettier',
        'coc-snippets',
        'coc-tslint-plugin',
        'coc-tsserver',
        'coc-highlight',
        'coc-yaml',
        'coc-spell-checker',
        'coc-dictionary',
        'coc-sql'
    }
    use { 'neoclide/coc.nvim', branch='release' }

    -- UI
    -- colorscheme
    use('hoob3rt/lualine.nvim')
    use('ntpeters/vim-better-whitespace')
    use('Mofiqul/vscode.nvim')
    -- use { "ellisonleao/gruvbox.nvim" } -- gruvbox.rc.lua uncomment

    -- nerdtree open then tree of files/folders
    use('preservim/nerdtree')
    -- nerdtree icons
    use('ryanoasis/vim-devicons')

    -- setup for ruby
    use 'vim-ruby/vim-ruby'
    use 'tpope/vim-endwise'
    use 'tpope/vim-rails'
    use 'thoughtbot/vim-rspec'
    -- think about it Plug 'tpope/vim-sensible' " General settings in VIM

    -- Git, Comment, vim
    use('tpope/vim-fugitive')
    use('tpope/vim-commentary')
    use('sheerun/vim-polyglot')
    use('slim-template/vim-slim')
    use('github/copilot.vim')
    use('windwp/nvim-autopairs')
    use('norcalli/nvim-colorizer.lua')
    use('lewis6991/gitsigns.nvim')

    -- harpoon
    use('nvim-lua/plenary.nvim')
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- SQL ui
    use {
        'kristijanhusak/vim-dadbod-ui',
        requires = {
            'tpope/vim-dadbod',
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' } }
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer'
        },
        config = function()
            vim.g.db_ui_use_nerd_fonts = 1
        end
    }

    -- use('mileszs/ack.vim')
    -- Plug 'jparise/vim-graphql'
    -- Plug 'leafgarland/typescript-vim'
    -- Plug 'maxmellon/vim-jsx-pretty'
    -- Plug 'peitalin/vim-jsx-typescript'
    -- Plug 'honza/vim-snippets'
    -- let g:dbs = {
    -- \ 'dev': 'postgres://postgres:password@localhost:5433/acuity_development'
    -- \ }
end)

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for better highlight files
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })

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

    -- -- colorscheme
    use 'hoob3rt/lualine.nvim'
    -- use 'gruvbox-community/gruvbox'
    use { "ellisonleao/gruvbox.nvim" }

    -- use {
    --     'svrana/neosolarized.nvim',
    --     requires = { 'tjdevries/colorbuddy.nvim' }
    -- }
    -- use({
    --         'rose-pine/neovim',
    --         as = 'rose-pine',
    --         config = function()
    --             vim.cmd('colorscheme rose-pine')
    --         end
    --     })

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
    use('tpope/vim-dadbod')
    use('kristijanhusak/vim-dadbod-ui')
    -- highlight word under cursor
    -- use('itchyny/vim-cursorword')
    use('github/copilot.vim')
    use('windwp/nvim-autopairs')
    -- use('windwp/nvim-ts-autotag')
    use('norcalli/nvim-colorizer.lua')
    use('lewis6991/gitsigns.nvim')
    -- use('HiPhish/nvim-ts-rainbow2') - later
    -- use('luochen1990/rainbow') not working

    -- harpoon
    use('nvim-lua/plenary.nvim')
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    -- 	use('kristijanhusak/vim-dadbod-ui')
    -- 	use({
    -- 				'ojroques/vim-oscyank',
    -- 				tag = 'v1.0.0'
    -- 			}
    -- 	)
    -- 	use {
    -- 		'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    -- 		requires = { {'nvim-lua/plenary.nvim'} }
    -- 	}
    -- Plug 'mileszs/ack.vim' " Tha's for ack(search)
    -- Plug 'jparise/vim-graphql'
    -- Plug 'leafgarland/typescript-vim'
    -- Plug 'maxmellon/vim-jsx-pretty'
    -- Plug 'peitalin/vim-jsx-typescript'
    -- Plug 'ap/vim-css-color' " highlight colors in css
    -- Plug 'ryanoasis/vim-devicons'
    -- Plug 'vim-airline/vim-airline'
    -- Plug 'ntpeters/vim-better-whitespace'
    -- Plug 'honza/vim-snippets'
    -- let g:dbs = {
    -- \ 'dev': 'postgres://postgres:password@localhost:5433/acuity_development'
    -- \ }
end)

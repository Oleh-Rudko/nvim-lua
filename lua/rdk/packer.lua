vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- packer can manage itself
    use 'wbthomason/packer.nvim'

    -- for better highlight files
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    -- use('nvim-ts-autotag')

    -- telescope for fzf
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } },
    }
    -- use("jiaoshijie/undotree")
    use 'aserebryakov/vim-todo-lists'

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
    -- move to none-ls.nvim, mason.nvim, nvim-cmp
    use { 'neoclide/coc.nvim', branch='release' }

     -- Avante.nvim configuration
    use {
        "yetone/avante.nvim",
        build = "make BUILD_FROM_SOURCE=true",
        lazy = false,
        version = false,
        BUILD_FROM_SOURCE = true,
        config = function()
            require("avante_lib").load()
            require("avante").setup()
        end,
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "HakonHarnes/img-clip.nvim",
        },
    }
    -- zen mode
    -- use { "folke/zen-mode.nvim" }
    -- use {
    --     'folke/which-key.nvim',
    --     config = function()
    --         require("which-key").setup {}
    --     end
    -- }

    -- chat gpt
    use({
        "jackMort/ChatGPT.nvim",
        config = function()
            require("chatgpt").setup()
        end,
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "folke/trouble.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })

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
end)

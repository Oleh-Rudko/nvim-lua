# Here the example of nvim-lua



1. In the root of your MacBook you need to create mkdir `.config`
2. cd .config -> `git clone git@github.com:Oleh-Rudko/nvim-lua.git`
3. `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
4. open nvim in the file -> packer.lua and run :PackerInstall
5. Also run :TSUpdate
6. If coc-nvim is not installed then just run :CocInstall coc-tsserver etc...

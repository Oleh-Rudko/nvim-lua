# Here the example of nvim-lua



1. In the root of your MacBook you need to create mkdir `.config`
2. cd .config -> `git clone git@github.com:Oleh-Rudko/nvim-lua.git`
3. Run next command in the terminal `~./.config/nvim_lua && cd ../ && mv nvim_lua nvim && cd nvim && rm -rf .git`
4. `git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim`
5. open nvim in the file -> packer.lua and run :PackerInstall
6. Also run :TSUpdate
7. If coc-nvim is not installed then just run :CocInstall coc-tsserver etc...

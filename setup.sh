# Install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
rm -rf ./nvim.appimage

# Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
mkdir ~/.fonts/
tar -xvf JetBrainsMono.tar.xz -C ~/.fonts/ 
rm -rf JetBrainsMono.tar.xz

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Install packeges
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

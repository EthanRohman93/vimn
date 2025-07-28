# vim but i have to use neovim for harpoon :/

## environment

```
curl -fsSL https://pyenv.run | bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
node -v 
nvm current 
npm -v 
sudo apt install fzf
sudo apt install ssh
ssh-keygen -t ed25519 -C "ethanmrohman@gmail.com"
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_ed25519
cat $HOME/.ssh/id_ed25519.pub
git clone git@github.com:EthanRohman93/vimn.git
```

## nvim

```
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
```

## plug

```
mkdir -p ~/.config/nvim/autoload
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir $HOME/.config
mkdir $HOME/.config/nvim
cp ./dotfiles/init.lua $HOME/.config/nvim/init.lua
```

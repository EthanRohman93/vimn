# vim but i have to use neovim for harpoon :/

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
# required
mv $HOME/.config/nvim{,.bak}

# optional but recommended
mv $HOME/.local/share/nvim{,.bak}
mv $HOME/.local/state/nvim{,.bak}
mv $HOME/.cache/nvim{,.bak}
mkdir $HOME/.config
mkdir $HOME/.config/nvim
touch $HOME/.config/nvim/lua/init.lua
```

### coc.nvim 

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
\. "$HOME/.nvm/nvm.sh"
nvm install 22
node -v 
nvm current 
npm -v 
```

### harpoon

```
git clone https://github.com/ThePrimeagen/harpoon.git $HOME/.config/nvim/bundle/harpoon
```

### plenary

```
git clone https://github.com/nvim-lua/plenary.nvim.git $HOME/.config/nvim/bundle/plenary.nvim
```

### fzf.vim and fzf in general

```
git clone https://github.com/junegunn/fzf.vim.git $HOME/.config/nvim/bundle/fzf.vim
git clone --depth 1 https://github.com/junegunn/fzf.git $HOME/.config/nvim/bundle/fzf
chmod +x $HOME/.config/nvim/bundle/fzf/install
$HOME/.config/nvim/bundle/fzf/install
```

### fugitive for looking at diffs

```
git clone https://github.com/tpope/vim-fugitive.git $HOME/.config/nvim/bundle/vim-fugitive
```

# Install neovim
```bash
sudo add-apt-repository ppa:neovim-ppa/unstable &&\
sudo apt-get update &&\
sudo apt-get install neovim
```

# Install packer.nvim
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
 ```

# Install tmux plugin manager
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

# Symbolic links
## Make sure to change `(dotfiles-dir)` for the actual directory
### nvim
```bash
ln -s (dotfiles-dir)/nvim $HOME/.config/nvim
```

### tmux
```bash
ln -s (dotfiles-dir)/tmux $HOME
```
Within a tmux-session hit: <leader> + I to install
And hit: <leader> + R to reload

### alacritty
```bash
ln -s (dotfiles-dir)/alacritty $HOME/.config/alacritty
```

# Install packer.nvim plugins
```bash
cd $HOME/.config/nvim//lua/c3p0gan && nvim packer.lua
```
`:so` to source files
`:PackerSync` to install

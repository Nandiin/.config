#.dotfiles
Repository for my dotfiles.

### Caveats

Runing `./install.sh` will:

- override all existing configurations.
- set following configuration files regardless of corresponding packages/commands
exist or not:
    - **fish**: `~/.config/fish/config.fish`
    - **vim**: `~/.vimrc`, several files in `~/.vim`
    - **git**: `~/.gitconfig`
    - **nvim**: `~/.config/nvim/init.vim` `~/.config/nvim/after/ftplugin/swift.vim`


### Usage

```
git clone https://github.com/nandiin/.dotfiles
cd .dotfils
./install.sh
```

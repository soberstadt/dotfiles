# Spencer's Dot Files

## Installation

Run the following commands in your terminal. It will prompt you before it does anything destructive. Check out the [Rakefile](https://github.com/soberstadt/dotfiles/blob/master/Rakefile) to see exactly what it does.

```terminal
git clone git://github.com/soberstadt/dotfiles ~/.dotfiles
cd ~/.dotfiles
rake install
```

After installing, open a new terminal window to see the effects.

Feel free to customize the .zshrc file to match your preference.

## Uninstall

To remove the dotfile configs, run the following commands. Be certain to double check the contents of the files before removing so you don't lose custom settings.

```
unlink ~/.bin
unlink ~/.gitignore
unlink ~/.gemrc
unlink ~/.gvimrc
unlink ~/.irbrc
unlink ~/.vim
unlink ~/.vimrc
rm ~/.zshrc # careful here
rm ~/.gitconfig
rm -rf ~/.dotfiles
rm -rf ~/.oh-my-zsh
chsh -s /bin/bash # change back to Bash if you want
```

Then open a new terminal window to see the effects.

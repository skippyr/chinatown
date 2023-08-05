# Chinatown
## About
A theme for the ZSH shell that is decorated by a dragon.
![](preview.png)

It can show you:
-	If your last command failed, as the dragon will spit fire.
-	Your host and user names.
-	If inside a Git repository, the branch and tag.
-	Your current directory path abbreviating parent directories.

## Installation
### Dependencies
-	git
-	A Nerd Font's font.
-	An emojis font.

### Procedures
-	Clone this repository.
```bash
git\
   clone --depth=1 https://github.com/skippyr/chinatown\
   ~/.local/share/zsh/themes/chinatown
```

-	Add the following source rule to your `~/.zshrc` file. Ensure to not source other theme.

```bash
source ~/.local/share/zsh/themes/chinatown/chinatown.zsh-theme
```

-	Reopen ZSH.

## Copyright
This software is under the MIT license. A copy of the license is bundled with the source code.

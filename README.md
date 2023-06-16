# Chinatown

A ZSH-theme with a dragon and flames inspired by the [Agnoster theme](https://github.com/agnoster/agnoster-zsh-theme).

![](./images/preview.png)

Colors may be different in your setup as it depends of your terminal emulator's theme.
In the preview, the theme was used in the [Kitty terminal emulator](https://github.com/kovidgoyal/kitty) with the [Flamerial theme](https://github.com/skippyr/flamerial) and Fira Code Nerd Font.

It shows:

* if your last command has failed.
* your user and hostname.
* virtual environment that you have sourced.
* your current directory abbreviated.
* if inside a repository, the branch and if it has changes to commit.

## Installation

* install `git` and a font patched by the [Nerd Fonts project](https://github.com/ryanoasis/nerd-fonts). You also need an emojis font, like the [Noto Sans Emojis](https://fonts.google.com/noto/specimen/Noto+Emoji), however you probably already have one installed.
* clone this repository.

```bash
git clone --depth=1 https://github.com/skippyr/chinatown ~/.local/share/zsh/themes/chinatown
```

* add a source rule in your `~/.zshrc` file to include the theme in the startup.

```bash
source ~/.local/share/zsh/themes/chinatown/chinatown.zsh-theme
```

* reopen ZSH.

## Issues

Report issues through the [issues tab](https://github.com/skippyr/chinatown/issues).

## Contributions

If you want to contribute to this project, check out its [contributions guidelines](https://skippyr.github.io/materials/pages/contributions_guidelines.html).

## License

This project is released under the terms of the MIT license.

Copyright (c) 2023, Sherman Rofeman. MIT License.


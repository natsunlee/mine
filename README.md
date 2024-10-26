<div align="center">
    <img src="./img/mine.jpg" />
</div>


## Dependencies
Install Homebrew
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`

Install Homebrew Bundle
`brew tap Homebrew/bundle`

## Install Brewfile
`brew bundle`

## Install dotfiles
`stow .`

## Reset icon cache for MacOS after swapping app icons
`rm /var/folders/*/*/*/com.apple.dock.iconcache; killall Dock`

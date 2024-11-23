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

## Nix Install via Determinate
```
curl \
  --proto '=https' \
  --tlsv1.2 \
  -sSf \
  -L https://install.determinate.systems/nix \
  | sh -s -- install
```

## Install Rosetta to Allow Compiling Intel Binaries
`softwareupdate --install-rosetta --agree-to-license`

## Apply Darwin configs
`nix run nix-darwin -- --flake github:natsunlee/mine#base`

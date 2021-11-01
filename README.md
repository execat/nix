# Collection of utilities and settings

Run to install:

```
$ export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH

Install nix-darwin: https://github.com/LnL7/nix-darwin
Install home-manager: https://github.com/nix-community/home-manager

Create the directory and symlink home.nix:
$ rm ~/.config/nixpkgs/home.nix
$ ln -v -s /Users/atm/.nix/home.nix /Users/atm/.config/nixpkgs/home.nix

Then update the channels one last time and run `darwin-rebuild switch`:
$ nix-channel --update

# Assuming this repo was cloned in ~/.nix:
$ darwin-rebuild switch -I "darwin-config=$HOME/.nix/darwin-configuration.nix"
$ home-manager switch
```

Run to update:

```
$ nix-channel --list
$ nix-channel --update
```

Folder structure:

```
.
├── README.md
├── darwin-configuration.nix
├── networking
├── nix
├── packages
├── programs
│   ├── default.nix
│   └── zsh.nix
└── system
```

Edit variables:

* `networking`: Set `hostName` and `computerName`
* `system`: Set `timeZone`

# Additional scripts not included in the installation

* Disable "Try the new Safari":
  [link](https://news.ycombinator.com/item?id=28361730)

```
    defaults write com.apple.coreservices.uiagent CSUIHasSafariBeenLaunched -bool YES
    defaults write com.apple.coreservices.uiagent CSUIRecommendSafariNextNotificationDate -date 2050-01-01T00:00:00Z
    defaults write com.apple.coreservices.uiagent CSUILastOSVersionWhereSafariRecommendationWasMade -float 99.99
```


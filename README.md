# Collection of utilities and settings

Run to install:

```
$ export NIX_PATH=darwin-config=$HOME/.nix/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH

Install nix-darwin: https://github.com/LnL7/nix-darwin
Install home-manager: https://github.com/nix-community/home-manager

Home Manager usually uses ~/.config/nixpkgs/home.nix, but we will just symlink ~/.nix/home.nix to that file
This allows us to maintain all Nix configs (darwin-nix and home-manager) in a single repo
$ rm ~/.config/nixpkgs/home.nix
$ ln -v -s /Users/atm/.nix/home.nix /Users/atm/.config/nixpkgs/home.nix
$ ln -v -s /Users/atm/.nix/config.nix /Users/atm/.config/nixpkgs/config.nix

Then update the channels one last time and run `darwin-rebuild switch`:
$ nix-channel --update

# Switch nix-darwin
# Assuming this repo was cloned in ~/.nix and if darwin-config not set already in first step (above)
$ darwin-rebuild switch -I "darwin-config=$HOME/.nix/darwin-configuration.nix"
# Else
$ darwin-rebuild switch --show-trace

# Switch home-manager
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
├── config.nix
├── darwin-configuration.nix
├── home.nix
├── networking
│   └── default.nix
├── nix
│   └── default.nix
├── packages
│   ├── brew.nix
│   ├── db.nix
│   ├── default.nix
│   ├── editor.nix
│   ├── nix.nix
│   ├── shell.nix
│   └── wm.nix
├── resources
│   └── skhdrc
└── system
    └── default.nix
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

    # Remove all items from dock
    defaults write com.apple.dock persistent-apps -array
    killall Dock
```


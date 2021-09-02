# Collection of utilities and settings

Run to install:

```
$ export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH
Install nix-darwin: https://github.com/LnL7/nix-darwin
Install home-manager: https://github.com/nix-community/home-manager
Create the directory and symlink home.nix:
$ mkdir -p ~/.config/nixpkgs
$ ln -v -s /Users/atm/.nix/home.nix /Users/atm/.config/nixpkgs/home.nix
Then do:
$ nix-channel --update
$ darwin-rebuild switch --show-trace
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



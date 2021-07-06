# Collection of utilities and settings

Run to install:

```
$ export NIX_PATH=darwin-config=$HOME/.nixpkgs/darwin-configuration.nix:$HOME/.nix-defexpr/channels:$NIX_PATH
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



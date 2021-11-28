cd ~
mkdir -p _code
cd _code
mkdir -p build configs js nix nix/configs playground/ruby playground/rust ruby rust sources

function clone_or_pull {
  if [ -d "$1" ]; then
    echo "cd into $1 and pull"
    cd $1
    git pull
    cd ..
  else
    echo "Clone $2 to $1"
    git clone $2 $1
  fi
}

cd build
clone_or_pull "delete-tweets" "https://github.com/koenrh/delete-tweets"

cd ..
cd configs
clone_or_pull "comma" "git@github.com:execat/comma.git"
clone_or_pull "dotfiles-local" "git@github.com:execat/dotfiles-local.git"
clone_or_pull "install" "git@github.com:execat/install.git"

cd ..
cd nix/configs
clone_or_pull "adisbladis-nixconfig" "https://github.com/adisbladis/nixconfig"
clone_or_pull "bobvanderlinden-nix-home" "https://github.com/bobvanderlinden/nix-home"
clone_or_pull "cmacrae-config" "https://github.com/cmacrae/config"
clone_or_pull "hugoReeves-nix-home" "https://github.com/HugoReeves/nix-home"
clone_or_pull "jonathanreeve-dotfiles" "https://github.com/JonathanReeve/dotfiles"
clone_or_pull "jwiegly-nix-config" "https://github.com/jwiegley/nix-config"
clone_or_pull "malob-nixpkgs" "https://github.com/malob/nixpkgs"
clone_or_pull "monadplus-nixconfig" "https://github.com/monadplus/nixconfig"
clone_or_pull "periklis-nix-config" "https://github.com/periklis/nix-config"
clone_or_pull "romatthe-ronix" "https://github.com/romatthe/ronix"
clone_or_pull "rummik-nixos-config" "https://github.com/rummik/nixos-config"
clone_or_pull "senchopens-senixos" "https://github.com/SenchoPens/senixos"
clone_or_pull "wolfereign-nixos-configs" "https://github.com/Wolfereign/nixos-configs"
clone_or_pull "xe-site" "https://github.com/Xe/site"
clone_or_pull "yrashk-nix-home" "https://github.com/yrashk/nix-home"
clone_or_pull "yuanw-nix-home" "https://github.com/yuanw/nix-home"

cd ../..

echo "Move delete-tweet setup files"
echo "Run sudo wechattweak-cli --install"
echo "iTerm Preferences -> General -> Reuse previous session's directory"

# Set up default
echo "Set up defaults using `duti`"
echo "Find app: /usr/libexec/PlistBuddy -c 'Print CFBundleIdentifier' /Applications/TextMate.app/Contents/Info.plist"
echo "Set default: duti -s com.macromates.TextMate json all"


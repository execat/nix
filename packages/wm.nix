{ lib, pkgs, ... }:

with lib;

{
  services = {
    yabai = {
      enable = false;
      package = pkgs.yabai;
      enableScriptingAddition = true;
      config = {
        layout                     = "bsp";
        top_padding                = 4;
        bottom_padding             = 24;
        left_padding               = 4;
        right_padding              = 4;
        window_gap                 = 4;

        focus_follows_mouse        = "off";
        mouse_follows_focus        = "on";

        mouse_modifier             = "fn";
        mouse_action1              = "move";
        mouse_action2              = "resize";

        window_topmost             = "off";
        window_opacity             = "off";
        window_shadow              = "float";

        active_window_opacity      = "1.0";
        normal_window_opacity      = "0.9";
        split_ratio                = "0.5";
        auto_balance               = "off";

        window_border              = "on";
        window_border_width        = "2";
        active_window_border_color = "0xE0808080";
        insert_window_border_color = "0xE02d74da";
        normal_window_border_color = "0xE0010101";
        window_placement           = "second_child";
      };

      extraConfig = mkDefault ''
        # rules
        yabai -m rule --add label="Finder" app="^Finder$" title="(Co(py|nnect)|Move|Info|Pref)" manage=off
        yabai -m rule --add label="System Preferences" app="^System Preferences$" manage=off
        yabai -m rule --add label="Activity Monitor" app="^Activity Monitor$" manage=off
        yabai -m rule --add label="VirtualBox" app="^VirtualBox$" manage=off

        yabai -m rule --add app=Emacs manage=on space=2
      '';
    };

    skhd = {
      enable = false;
      skhdConfig = builtins.readFile ../resources/skhdrc;
    };
  };
}

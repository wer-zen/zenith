{
  zen.modules.ricing.matugen.matugen = {
    templates = {
      hyprland = {
        input_path = "${./templates/hyprland-colors.conf}";
        output_path = "~/hyprcolors.conf";
      };

      midnight-discord = {
        input_path = "${./templates/midnight-discord.css}";
        output_path = "~/discord-midnight.css";
      };

      gtk3 = {
        input_path = "${./templates/gtk-colors.css}";
        output_path = "~/gtk3-colors.css";
      };

      gtk4 = {
        input_path = "${./templates/gtk-colors.css}";
        output_path = "~/gtk4-colors.css";
      };

      yazi = {
        input_path = "${./templates/yazi-colors.toml}";
        output_path = "~/yazi-theme.toml";
      };

      cava = {
        input_path = "${./templates/cava-colors}";
        output_path = "~/config";
      };
      /* quickshell = {
           input_path = "${./templates/quickshell-colors.qml}";
           output_path = "~/quickshell-colors.qml";
         };
      */
    };
    config.custom_colors = {
      red = {
        color = "#FF0000";
        blend = true;
      };
      orange = {
        color = "#FF4F00";
        blend = true;
      };
      green = {
        color = "#00FF00";
        blend = true;
      };
      yellow = {
        color = "#FFFF00";
        blend = true;
      };
      blue = {
        color = "#00AAFF";
        blend = true;
      };
      magenta = {
        color = "#9141ac";
        blend = true;
      };
      cyan = {
        color = "#00FFFF";
        blend = true;
      };
      gray = {
        color = "#333333";
        blend = true;
      };
      pastel_blue = {
        color = "#99c1f1";
        blend = true;
      };
      pastel_orange = {
        color = "#ffa348";
        blend = true;
      };
      white = {
        color = "#FFFFFFFF";
        blend = false;
      };
      pastel_green = {
        color = "#8ff0a4FF";
        blend = true;
      };
      pastel_red = {
        color = "#f66151";
        blend = true;
      };
      pastel_magenta = {
        color = "#dc8add";
        blend = true;
      };
      pastel_mint_green = {
        color = "#93ddc2";
        blend = true;
      };
    };
  };
}

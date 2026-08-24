{ ... }:
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      {
        match.class = "file_progress";
        float = true;
      }
      {
        match.class = "confirm";
        float = true;
      }
      {
        match.class = "dialog";
        float = true;
      }
      {
        match.class = "download";
        float = true;
      }
      {
        match.class = "notification";
        float = true;
      }
      {
        match.class = "error";
        float = true;
      }
      {
        match.class = "splash";
        float = true;
      }
      {
        match.class = "confirmreset";
        float = true;
      }
      {
        match.title = "Open File";
        float = true;
      }
      {
        match.title = "branchdialog";
        float = true;
      }
      {
        match.class = "^$";
        float = true;
      }
      {
        match.class = "file-roller";
        float = true;
      }

      {
        match.class = "wlogout";
        fullscreen = true;
      }
      {
        match.title = "wlogout";
        float = true;
      }

      {
        match.title = "Media viewer";
        float = true;
      }
      {
        match.title = "Picture-in-Picture";
        float = true;
        pin = true;
      }

      {
        match = {
          class = "vesktop";
          title = "Discord Popout";
        };
        float = true;
        pin = true;
      }

      {
        match.title = "btop";
        opacity = "0.9 override 0.9 override";
      }

      {
        match.title = "exegol-history";
        float = true;
        size = "900 450";
        center = true;
      }
    ];
  };
}

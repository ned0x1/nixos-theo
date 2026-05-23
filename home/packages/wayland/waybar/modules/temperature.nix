{
  temperature = {
    thermal-zone = 7;
    hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
    interval = 5;
    format = "{icon}{temperatureC}°C";
    format-icons = [ " " ];
    format-alt-click = "click-right";
    critical-threshold = 80;
    format-critical = " {temperatureC}°C";
    on-click = "kitty --title btop sh -c 'btop'";
    tooltip-format = "CPU Temperature";
    tooltip = true;
  };
}

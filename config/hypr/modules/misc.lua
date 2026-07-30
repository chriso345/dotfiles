---@module 'hl'

local home = os.getenv("HOME")
package.path = package.path .. ";" .. home .. "/.config/dotmgr/themes/_current/?.lua"
local colors = require("colors")

-- Autostart
hl.on("hyprland.start", function()
  hl.exec_cmd(
    "waybar & swaync & hyprpaper -c " .. os.getenv("XDG_CONFIG_HOME") .. "/dotmgr/themes/_current/paper.conf"
  )
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,
    border_size = 2,
    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
    col = {
      active_border = {
        colors = {
          colors.active1,
          colors.local_var_active2,
        },
        colors.local_var_angle,
      },
      inactive_border = colors.inactive,
    },
  },
})

hl.config({
  decoration = {
    -- rounding = 10,
    rounding = 0,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = colors.shadow,
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },
})

hl.config({
  dwindle = {
    preserve_split = true,
  },
})

hl.config({
  master = {
    new_status = "master",
  },
})

hl.config({
  misc = {
    force_default_wallpaper = -1,
    disable_hyprland_logo = false,
  },
})

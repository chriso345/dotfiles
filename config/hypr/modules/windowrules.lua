---@module 'hl'

hl.window_rule({
  name = "windowrule-1",
  match = {
    class = ".*",
  },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "windowrule-2",
  match = {
    class = "^$",
    title = "^$",
    xwayland = 1,
    float = 0,
    fullscreen = 0,
    pin = 0,
  },
  no_focus = true,
})

hl.window_rule({
  name = "dev-floating",
  match = {
    title = "^dev$",
  },
  float = 1,
  center = 1,
  size = { 800, 600 },
})

---@module 'hl'

-- Float and center settings and previews
hl.window_rule({
  name = "windowrule-1",
  match = {
    class = "^(dotmgr.floating.*)$",
  },
  float = true,
  center = true,
})

-- dotmgr floating classes
hl.window_rule({
  name = "windowrule-2",
  match = {
    class = "^(dotmgr.floating.tiny)$",
  },
  size = { 400, 300 },
})

hl.window_rule({
  name = "windowrule-3",
  match = {
    class = "^(dotmgr.floating.small)$",
  },
  size = { 620, 470 },
})

hl.window_rule({
  name = "windowrule-4",
  match = {
    class = "^(dotmgr.floating.medium)$",
  },
  size = { 800, 600 },
})

hl.window_rule({
  name = "windowrule-5",
  match = {
    class = "^(dotmgr.floating.large)$",
  },
  size = { 1000, 800 },
})

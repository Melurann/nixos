------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@60.03",
    position = "0x0",
    scale    = "1",
})

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

hl.monitor({
    output   = "desc: Acer Technologies VG240Y TG5EE0018524",
    mode     = "1920x1080@74.97",
    position = "1920x0",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "ghostty"
local fileManager = "nautilus"
local menu        = "walker --hideqa"
local browser     = "brave"


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
    hl.exec_cmd("waybar")
    hl.exec_cmd("hyprpaper")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("brave", { workspace = "1 silent" })
    hl.exec_cmd("ghostty", { workspace = "2 silent" })
end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
-- hl.env()


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in          = 4,
        gaps_out         = 8,
        border_size      = 1,

        col              = {
            active_border   = "0xaa313244",
            inactive_border = "0xaa313244",
        },

        resize_on_border = false,
        allow_tearing    = false,
        layout           = "dwindle",
    },

    cursor = { enable_hyprcursor = false, no_hardware_cursors = true, },

    decoration = {
        rounding         = 10,
        rounding_power   = 1,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 0.7,
        inactive_opacity = 0.7,

        blur             = {
            enabled = true,
            size = 8,
            passes = 3,
            vibrancy = 0.2000,
            new_optimizations = true,
            popups = true,
        },
    },

    animations = {
        enabled = true,
    },
})

hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, spring = "easy", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })

hl.config({
    dwindle = {
        preserve_split = true, -- You probably want this
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
    master = {
        new_status = "master",
    },
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = -1,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = false, -- If true disables the random hyprland logo / anime girl background. :(
    },
})



hl.config({
    input = {
        kb_layout    = "de, us",
        kb_variant   = "",
        kb_model     = "",
        kb_options   = "grp:alt_shift_toggle",
        kb_rules     = "",

        -- infamous xset r rate 200 35;
        repeat_rate  = 35,
        repeat_delay = 200,
        follow_mouse = 1,
        sensitivity  = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad     = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})


---------------------
---- KEYBINDINGS ----
---------------------

local main_mod = "SUPER"

-- Launch Applications
hl.bind(main_mod .. " + E", hl.dsp.exec_cmd(menu))
hl.bind(main_mod .. " + SHIFT + E", hl.dsp.exec_cmd("walker -m runner --hideqa"))
hl.bind(main_mod .. " + SHIFT + N", hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(main_mod .. " + Q", hl.dsp.exec_cmd(terminal))
hl.bind(main_mod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(main_mod .. " + D", hl.dsp.exec_cmd("vesktop"))
hl.bind(main_mod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(main_mod .. " + S", hl.dsp.exec_cmd("spotify"))
hl.bind(main_mod .. " + P", hl.dsp.exec_cmd("1password"))

-- System & Hardware Controls
hl.bind(main_mod .. " + V", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind(main_mod .. " + U", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))
hl.bind(main_mod .. " + A", hl.dsp.exec_cmd("pavucontrol"))
hl.bind(main_mod .. " + SHIFT + B", hl.dsp.exec_cmd("blueman-manager"))
hl.bind(main_mod .. " + W", hl.dsp.exec_cmd("nm-connection-editor"))

-- XF86 / Function Keys
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("volumectl toggle-mute"), { locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("volumectl -m toggle-mute"), { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("volumectl -u up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("volumectl -u down"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("lightctl up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("lightctl down"), { locked = true, repeating = true })

-- Lock & Window Control
hl.bind(main_mod .. " + SHIFT + C", hl.dsp.exec_cmd("pidof hyprlock || hyprlock"))
hl.bind(main_mod .. " + C", hl.dsp.window.close())

-- Window Layout
hl.bind(main_mod .. " + SHIFT + P", hl.dsp.window.pseudo())
hl.bind(main_mod .. " + M", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(main_mod .. " + SHIFT + M", hl.dsp.window.fullscreen({ mode = 0 }))

-- Move Focus (Vim & Arrow Keys)
hl.bind(main_mod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(main_mod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(main_mod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(main_mod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(main_mod .. " + Down", hl.dsp.focus({ direction = "down" }))

-- Move Windows (Vim & Arrow Keys)
hl.bind(main_mod .. " + SHIFT + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(main_mod .. " + SHIFT + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(main_mod .. " + SHIFT + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(main_mod .. " + SHIFT + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind(main_mod .. " + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind(main_mod .. " + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind(main_mod .. " + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces 1-10
for i = 1, 9 do
    hl.bind(main_mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(main_mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i }))
end

-- Mouse Workspaces & Special Workspace
hl.bind(main_mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(main_mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(main_mod .. " + Return", hl.dsp.workspace.toggle_special())
hl.bind(main_mod .. " + SHIFT + Return", hl.dsp.window.move({ workspace = "special" }))

-- Mirror & Extend Displays
hl.bind(main_mod .. " + TAB", hl.dsp.exec_cmd("hyprctl keyword monitor HDMI-A-1, 1920x1080@60, 1920x0, 1, mirror, eDP-1"))
hl.bind(main_mod .. " + SHIFT + TAB", hl.dsp.exec_cmd("hyprctl keyword monitor HDMI-A-1, 1920x1080@60, 1920x0, 1"))

-- Drag/Resize with Mouse
hl.bind(main_mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(main_mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name           = "suppress-maximize-events",
    match          = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name     = "fix-xwayland-drags",
    match    = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})


-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})


-- Forces 1.0 opacity on web streaming tabs
hl.window_rule({
    name    = "solid-web-streaming",
    match   = {
        class = "(?i)^(brave-browser|firefox|zen|chromium)$",
        title = "(?i).*(youtube|netflix|twitch|prime video|disney\\+|plex|jellyfin).*",
    },
    opacity = "1.0 override",
})

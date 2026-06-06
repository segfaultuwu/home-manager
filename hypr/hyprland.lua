local mainMod = "SUPER"

local terminal = "kitty"
local browser = "floorp"
local fileManager = "pcmanfm"

-- Noctalia IPC
local noctalia = "noctalia-shell"
local noctaliaMsg = "noctalia msg"

-- Fallback launchers
local launcher = noctaliaMsg .. " panel-toggle launcher"
local controlCenter = noctaliaMsg .. " panel-toggle control-center"
local settings = noctaliaMsg .. " settings-toggle"

-- Every monitor: preferred, auto position, scale 1
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = 1,
})

-- Autostart
hl.on("hyprland.start", function()
    -- Noctalia: prefer systemd service, fallback to binary
    hl.exec_cmd(
        "bash -lc 'systemctl --user start noctalia-shell.service 2>/dev/null || (command -v noctalia-shell >/dev/null && noctalia-shell >/tmp/noctalia.log 2>&1 &)'"
    )

    -- Clipboard
    hl.exec_cmd(
        "bash -lc 'command -v wl-paste >/dev/null && command -v cliphist >/dev/null && wl-paste --type text --watch cliphist store &'"
    )
    hl.exec_cmd(
        "bash -lc 'command -v wl-paste >/dev/null && command -v cliphist >/dev/null && wl-paste --type image --watch cliphist store &'"
    )

    -- Wallpaper daemon
    hl.exec_cmd("bash -lc 'command -v awww-daemon >/dev/null && awww-daemon &'")

    -- Tray applets
    hl.exec_cmd("bash -lc 'command -v nm-applet >/dev/null && nm-applet --indicator &'")
    hl.exec_cmd("bash -lc 'command -v blueman-applet >/dev/null && blueman-applet &'")
end)

-- Environment
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

-- Main config
hl.config({
    input = {
        kb_layout = "pl",
        follow_mouse = 1,
        sensitivity = 0,

        touchpad = {
            natural_scroll = true,
            tap_to_click = true,
            disable_while_typing = true,
        },
    },

    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        layout = "dwindle",
        resize_on_border = true,
        allow_tearing = false,

        col = {
            active_border = {
                colors = {
                    "rgba(cba6f7ff)",
                    "rgba(89b4faff)",
                },
                angle = 45,
            },

            inactive_border = "rgba(313244aa)",
        },
    },

    decoration = {
        rounding = 20,
        rounding_power = 2,

        active_opacity = 1.0,
        inactive_opacity = 0.95,
        fullscreen_opacity = 1.0,

        blur = {
            enabled = true,
            size = 5,
            passes = 2,
            vibrancy = 0.18,
            new_optimizations = true,
        },

        shadow = {
            enabled = true,
            range = 10,
            render_power = 3,
            color = "rgba(11111b99)",
        },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },

    master = {
        new_status = "master",
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        vrr = 1,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
    },
})

-- Animation curves
hl.curve("premium", {
    type = "bezier",
    points = {
        { 0.16, 1 },
        { 0.3,  1 },
    },
})

hl.curve("smoothOut", {
    type = "bezier",
    points = {
        { 0.36, 0 },
        { 0.66, -0.56 },
    },
})

hl.curve("smoothIn", {
    type = "bezier",
    points = {
        { 0.25, 1 },
        { 0.5,  1 },
    },
})

hl.curve("almostLinear", {
    type = "bezier",
    points = {
        { 0.5,  0.5 },
        { 0.75, 1 },
    },
})

hl.animation({
    leaf = "global",
    enabled = true,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "windows",
    enabled = true,
    speed = 5,
    bezier = "premium",
})

hl.animation({
    leaf = "windowsIn",
    enabled = true,
    speed = 5,
    bezier = "premium",
    style = "popin 87%",
})

hl.animation({
    leaf = "windowsOut",
    enabled = true,
    speed = 4,
    bezier = "smoothOut",
    style = "popin 87%",
})

hl.animation({
    leaf = "border",
    enabled = true,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = true,
    speed = 5,
    bezier = "smoothIn",
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 5,
    bezier = "almostLinear",
    style = "fade",
})

hl.animation({
    leaf = "layers",
    enabled = true,
    speed = 4,
    bezier = "premium",
})

-- Noctalia binds
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(controlCenter))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(settings))

hl.bind(mainMod .. " + Grave", hl.dsp.workspace.toggle_special("scratchpad"), {
    description = "Toggle scratchpad",
})

hl.bind(
    mainMod .. " + SHIFT + Grave",
    hl.dsp.window.move({
        workspace = "special:scratchpad",
        silent = true,
    }),
    {
        description = "Move window to scratchpad",
    }
)

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("rofi -show run"))

-- Windows
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.pin())

-- Screenshots / clipboard
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(mainMod .. " + CTRL + Print", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Focus
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Move windows
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.window.move({ direction = "down" }))

-- Workspaces
for i = 1, 10 do
    local key = tostring(i % 10)

    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i, silent = true }))
end

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
    mouse = true,
})

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
    mouse = true,
})

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("bash -lc '" .. noctaliaMsg .. " volume-up || pamixer -i 5'"), {
    locked = true,
    repeating = true,
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("bash -lc '" .. noctaliaMsg .. " volume-down || pamixer -d 5'"), {
    locked = true,
    repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("bash -lc '" .. noctaliaMsg .. " volume-mute || pamixer -t'"), {
    locked = true,
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("pamixer --default-source -t"), {
    locked = true,
})

hl.bind(
    "XF86MonBrightnessUp",
    hl.dsp.exec_cmd("bash -lc '" .. noctaliaMsg .. " brightness-up || brightnessctl set 5%+'"),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind(
    "XF86MonBrightnessDown",
    hl.dsp.exec_cmd("bash -lc '" .. noctaliaMsg .. " brightness-down || brightnessctl set 5%-'"),
    {
        locked = true,
        repeating = true,
    }
)

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
    locked = true,
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
    locked = true,
})

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
    locked = true,
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
    locked = true,
})

-- Window rules
hl.window_rule({
    name = "pavucontrol-float",
    match = { class = "pavucontrol" },
    float = true,
})

hl.window_rule({
    name = "blueman-float",
    match = { class = "blueman-manager" },
    float = true,
})

hl.window_rule({
    name = "network-editor-float",
    match = { class = "nm-connection-editor" },
    float = true,
})

hl.window_rule({
    name = "nautilus-properties-float",
    match = {
        class = "org.gnome.Nautilus",
        title = "Properties",
    },
    float = true,
})

hl.window_rule({
    name = "picture-in-picture",
    match = { title = "Picture-in-Picture" },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
})

hl.window_rule({
    name = "kitty-opacity",
    match = { class = "kitty" },
    opacity = "0.92 0.88",
})

hl.window_rule({
    name = "alacritty-opacity",
    match = { class = "Alacritty" },
    opacity = "0.95 0.90",
})

hl.window_rule({
    name = "firefox-workspace",
    match = { class = "firefox" },
    workspace = "2",
})

hl.window_rule({
    name = "code-workspace",
    match = { class = "code" },
    workspace = "3",
})

hl.window_rule({
    name = "zed-workspace",
    match = { class = "Zed" },
    workspace = "3",
})

hl.window_rule({
    name = "vesktop-workspace",
    match = { class = "vesktop" },
    workspace = "4",
})

hl.window_rule({
    name = "steam-workspace",
    match = { class = "steam" },
    workspace = "5",
})

-- Noctalia layer rules
hl.layer_rule({
    name = "noctalia-bar-blur",
    match = {
        namespace = "^noctalia-bar-.+$",
    },
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

hl.layer_rule({
    name = "noctalia-panel-blur",
    match = {
        namespace = "^noctalia-(notification|dock|panel|osd)$",
    },
    ignore_alpha = 0.5,
    blur = true,
    blur_popups = true,
})

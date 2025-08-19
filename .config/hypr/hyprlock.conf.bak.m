# source = $HOME/.config/hypr/themes/mocha.conf
source =  ~/.cache/wal/colors-hyprland.conf

$red = rgb(f38ba8)
$bcolor = $color1
$accent = $bcolor
$accentAlpha = $bcolor
$surface0 = $bcolor
$textAlpha = $bcolor
# $font = Iosevka Nerd Font

# GENERAL
general {
    # no_fade_in = true
    grace = 0
    # disable_loading_bar = true
}

# BACKGROUND
background {
  monitor =
  # path = $HOME/.current_wallpaper
  blur_passes = 2
  color = $base
  contrast = 0.8916
  brightness = 0.8172
  vibrancy = 0.1696
  vibrancy_darkness = 0.0
}

# Time-Hour
label {
    monitor =
    text = cmd[update:1000] echo "<span>$(date +"%I")</span>"
    color = rgba(255, 255, 255, 1)
    font_size = 125
    font_family = Iosevka Nerd Font
    position = -80, 190
    halign = center
    valign = center
}

# Time-Minute
label {
    monitor =
    text = cmd[update:1000] echo "<span>$(date +"%M")</span>"
    color = $bcolor
    font_size = 125
    font_family = Iosevka Nerd Font
    position = 0, 65
    halign = center
    valign = center
}

# Day-Month-Date
label {
    monitor =
    text = cmd[update:1000] echo -e "$(date +"%d %B %Y, %A")"
    color = rgba(255, 255, 255, 100)
    font_size = 22
    font_family = Iosevka Nerd Font
    position = 0, -15
    halign = center
    valign = center
}

# USER
label {
    monitor =
    # text =   $USER
    text = <b>Hi there!</b>
    color = rgba(216, 222, 233, 0.80)
    # outline_thickness = 2
    # dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    # dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
    # dots_center = true
    font_size = 22
    font_family = Iosevka Nerd Font
    position = 0, -220
    halign = center
    valign = center
}

# INPUT FIELD
input-field {
    monitor =
    size = 200, 30
    outline_thickness = 4
    dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
    dots_spacing = 0.2 # Scale of dots' absolute size, 0.0 - 1.0
    dots_center = true
    outer_color = $accent
    inner_color = $surface0
    # font_color = $text
    fade_on_empty = false
    font_family = Iosevka Nerd Font
    placeholder_text = <b><span>Enter Password...</span></b>
    hide_input = false
    fail_text = <i><b>$FAIL</b></i>
    position = 0, -290
    halign = center
    valign = center
}

# INPUT FIELD
# input-field {
#     monitor =
#         size = 300, 60
#         outline_thickness = 4
#         dots_size = 0.2
#         dots_spacing = 0.2
#         dots_center = true
#         outer_color = $accent
#         inner_color = $surface0
#         font_color = $text
#         fade_on_empty = false
# # placeholder_text = <span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>
#         hide_input = false
#         check_color = $accent
#         fail_color = $red
#         fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
#         capslock_color = $yellow
#         position = 0, -47
#         halign = center
#         valign = center
# }

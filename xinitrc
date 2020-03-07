$HOME/.monicarc   #monitor calibration
xss-lock lock.sh &
xset s on
xset s 300
xmodmap -e "keycode 135 = Super_L"
xmodmap -e "keycode 66 = Escape"
xmodmap -e "clear Lock"
pactl upload-sample /usr/share/sounds/freedesktop/stereo/bell.oga x11-bell
pactl load-module module-x11-bell sample=x11-bell display=$DISPLAY
xset b on
xset b 100
systemctl --user import-environment DISPLAY
export QT_QPA_PLATFORMTHEME=gtk2
udiskie --no-tray &
exec i3

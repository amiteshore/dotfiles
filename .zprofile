#
# .zprofile
#

# Autostart X at login, if in tty1
if [[ "$(tty)" = "/dev/tty1" ]]; then
   exec startx
fi
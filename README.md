# ClevoFX-Keyboard-Linux
Changes Clevo (Sager) Laptop's Keyboard Backlit LED colour based on the current open app.

## Requires
Driver from (https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi)[https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi]
xmlstarlet
xdotools

## Instructions
Main script is `clevo_fx.sh`
Add it to `sudoers` so it doesn't requires a password with sudo.
Modify clevo_fx.sh to change your $HOME accordingly
Add `sudo /path/to/clevo_fx.sh` to Gnome's autostart. (You can use the provides `.deb` to install an app for the same.)
Use `clevo_fx_test.sh` to get app name and use that to modify config.xml accordingly.


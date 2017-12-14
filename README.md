# ClevoFX-Keyboard-Linux
Changes Clevo (Sager) Laptop's Keyboard Backlit LED colour based on the current open app.

## Requires
1. Driver from (https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi)[https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi]
2. xmlstarlet
3. xdotools

## Instructions
1. Main script is `clevo_fx.sh`
2. Add it to `sudoers` so it doesn't requires a password with sudo.
3. Modify clevo_fx.sh to change your $HOME accordingly
4. Add `sudo /path/to/clevo_fx.sh` to Gnome's autostart. (You can use the provides `.deb` to install an app for the same.)
5. Use `clevo_fx_test.sh` to get app name and use that to modify config.xml accordingly.


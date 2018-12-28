# ClevoFX-Keyboard-Linux
Changes Clevo (Sager) Laptop's Keyboard Backlit LED colour based on the current open app.

Works best with i3wm (use the `i3wm` branch).

## Requires
1. Driver from [https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi](https://bitbucket.org/tuxedocomputers/clevo-xsm-wmi)
2. `xmlstarlet`
3. `i3ipc` (from pip)

## Instructions
1. Do `groupadd --system clevo_backlight` (use sudo for permission problems)
2. Do `usermod --append --groups clevo_backlight $USER` (again sudo for perms).
3. Copy the contents of `setclevopermissions.service` to `/etc/systemd/system/setclevopermissions.service`
4. Do `systemctl enable setclevopermissions`
5. Add `change_kb_color.py` to i3 startup by adding `exec /path/to/change_kb_color.py` to `~/.config/i3/config`
5. Copy the folder `clevo_fx` to `~/.config/`
6. Modify `~/.config/clevo_fx/apps.xml` to suit your needs (use `xprop` and click on window, the second `WM_CLASS(STRING)` property is to be used.

Check it live in action below:

[![ClevoFX Keyboard for Linux](https://img.youtube.com/vi/i6H8X8P0x2o/0.jpg)](https://www.youtube.com/watch?v=i6H8X8P0x2o)


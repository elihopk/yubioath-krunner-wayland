# yubioath-krunner

Displays your YubiKey OATH credentials in krunner when you search for them. Hit enter (or click) to copy the code.

This is a fork of [yubioath-krunner](https://github.com/odensc/yubioath-krunner) that is tweaked to work with Wayland.

Hacked this together in a couple hours, so PRs or suggestions are welcome.

![](https://i.imgur.com/wrrZR4T.gif)

## Dependencies

- python (3)
- python-configargparse
- python-dbus
- python-thefuzz
- python-pygobject
- libnotify
- yubikey-manager (ykman)
- wl-clipboard
- ydotool

## Installation

```bash
./install.sh
```

## Usage

Simply search for the account name, then hit enter (or click) to copy the code.

The code can also be typed automatically in the active window by setting `type: True` and `copy: False` in the configuration file.

You can also set a prefix word in the configuration file, used to trigger YubiOATH search. This can be useful if you don't want to clutter the krunner menu.

**Hot tip:** If you've added a new account, just copy a code from any account to refresh the credential list.

## Configuration file

Located at `~/.config/yubioath-krunner/config` per-user, or system-wide at `/etc/yubioath-krunner/config`

### Default config

```
# Prefix that needs to be typed to trigger YubiKey code search
# For example, you can set it to "mfa" to trigger when you search "mfa google"
# prefix: mfa

# Enable or disable copying codes to the clipboard
copy: True

# Enable or disable typing codes directly into the active window
type: False
```

# macOS setup

## Basics

Install Xcode then run:

```
$ ./install.sh dotfiles
$ ./install.sh base
```

## Software to install

- Xcode
- [Heroku CLI](https://devcenter.heroku.com/articles/heroku-cli)
- [iTerm](https://www.iterm2.com/)
- [Postgres](http://postgresapp.com/)
- [KeePassX](https://www.keepassx.org/downloads)
- [Firefox](https://firefox.com)
- [YubiSwitch](https://github.com/pallotron/yubiswitch)

## Firefox Add-ons

- [Privacy Badger](https://addons.mozilla.org/nl/firefox/addon/privacy-badger17/)
- [HTTPS Everywhere](https://addons.mozilla.org/nl/firefox/addon/https-everywhere/)
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)

## System Preferences

- Spotlight > Spotlight Suggestions: uncheck
- Keyboard > 
	- Key Repeat: max
	- Delay Until Repeat: 5
- Trackpad > Scroll direction: Natural: uncheck
- Accessibility >
	- Display > Reduce motion: check
	- Mouse & Trackpad > Trackpad Options… > Enable dragging (three finger drag)
- Security & Privacy > FileVault > Turn On FileVault…

## MPC Service

- Automator > New Service
  - Service receives `no input`
  - Add Run Shell Script action
  - `/usr/local/bin/mpc toggle`
- Save as General service
- Add keyboard shortcut: cmd+shift+option+P

## Keyboard Shortcuts

- Mission Control >
	- Mission Control: uncheck
	- Application windows: uncheck
	- Move left a space: ⌃⇧H
	- Move right a space: ⌃⇧L
- Keyboard > Shortcuts > Input Sources > Select the previous input source cmd+alt+shift+Y
- Spotlight >
	- Show Finder search window: uncheck
- iTerm >
  - Buffer: cmd+alt+shift+ctrl+P
- YubiSwitch > Enable Yubikey: cmd+alt+y


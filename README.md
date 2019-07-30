# Dotfiles
My personal dotfiles

This repository works with the [GNU stow](http://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) command.

### ZShell prompt autosuggestions
```
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
_iTerm + solarized dark fix_
```
echo ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE=\'fg=10\' >> $ZSH_CUSTOM/zsh-autosuggestions_custom.zsh 
```

### Bin
For `bin` you have to use the following command: `stow -t /usr/local/bin bin`.
This will symlink the binaries to the `Homebrew` bin which is already in your path.

### Virtualenvs + neovim autocomplete
For the time being, the best solution I came up with was to install all packages needed for autocompletion.
These are `neovim` and `pylint`.

### Tmux
If Tmux exits immediatly, this is because of the `reattach-to-user-namespace` option.
Solve this by downloading this package:
```
brew install reattach-to-user-namespace
```

### Mediakeys for MPD
[osx-mpd-keys](https://github.com/pushrax/osxmpdkeys)

You need to add a `.plist` file to `~/Library/Launchagents/`.
It should contain something of the following:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>tomas.mpd.notify</string>
    <key>ProgramArguments</key>
    <array>
        <string>/usr/local/opt/python/libexec/bin/python</string>
        <string>/usr/local/bin/mpd_notify</string>
        <string>/Users/tomas/Music/</string>
    </array>
    <key>EnvironmentVariables</key>
    <dict>
        <key>PYTHONPATH</key>
        <string>/usr/local/opt/python/libexec/bin/python</string>
    </dict>
    <key>StandardErrorPath</key>
    <string>/tmp/mpd_notify.err</string>
    <key>StandardOutPath</key>
    <string>/tmp/mpd_notify.out</string>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
```

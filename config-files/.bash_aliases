#!/bin/bash

alias ls='ls -lh'
alias ping='ping -c4'
alias skill='sudo kill -9'
alias gs='git status'
alias gd='git difftool'
alias gc='git commit -a'
alias gemi='gem install --no-rdoc --no-ri'
alias gemu='gem update --no-rdoc --no-ri'
alias gvim="gvim 2>/dev/null"
alias torbrowser="~/Downloads/tor-browser_en-US/start-tor-browser"
alias hosts="sudo vim /etc/hosts"
alias ctags_for_rails="ctags -R -f tags.ctags --exclude=.git --exclude=log/*"
alias upgradesystem='sudo apt-get update && sudo apt-get upgrade'
alias meteo='curl wttr.in'
alias hardware-network='sudo lshw -class network'
alias audio-volume='pactl set-sink-volume @DEFAULT_SINK@'
alias mic-volume='pactl set-source-volume @DEFAULT_SOURCE@'
alias connect-vpn='sudo /usr/sbin/openvpn --daemon ovpn --status /run/openvpn/openvpn.status 10 --cd /etc/openvpn --writepid /run/openvpn/home.pid --config /home/tb/Documents/perso/NordVPN/config/at3.nordvpn.com.tcp443.ovpn --auth-user-pass ~/.openvpn-auth'
alias home-usage='du -hx -d 1 -t 1G ~/ | sort -h'
alias restartnm='sudo pkill NetworkManager && sleep 1 && sudo NetworkManager'
alias nsaudit='sudo netstat -plunt'

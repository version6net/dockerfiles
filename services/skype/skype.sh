#!/bin/sh

test -f $HOME/chrome.json || wget https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json -O ~/chrome.json

exec docker run -it --name skype --hostname $(uname -n) -u $(id --user):$(id --group) --cpuset-cpus 0 --memory 4gb -e DISPLAY -v ${HOME}/docker-volumes/skype-home:${HOME} -v /tmp/.X11-unix:/tmp/.X11-unix -v /etc/passwd:/etc/passwd:ro -v /etc/group:/etc/group:ro -v ${HOME}/.Xauthority:${HOME}/.Xauthority:ro -v /dev/shm:/dev/shm -v $HOME/Downloads/:$HOME/Downloads/ -v $HOME/.config/chromium/:$HOME/.config/chromium/ --security-opt seccomp=$HOME/chrome.json v6net/skype "$@"

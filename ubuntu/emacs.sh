#!/usr/bin/bash

sudo add-apt-repository ppa:kelleyk/emacs
sudo apt update
sudo apt install emacs26-nox
# if remove : sudo apt remove --autoremove emacs26 emacs26-nox
cp ./.emacs.d ~/
#!/bin/bash

sudo apt-get install zsh && sh -c "$(proxychains4 wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install zsh if not present
if ! command -v zsh &> /dev/null; then
    echo "Installing Zsh"
    if ! sudo apt-get install zsh -y; then
        echo "Failed to install zsh, cleaning up..."
        # Add your cleanup commands for zsh here.
    else
        if ! sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"; then
            echo "Failed to install oh-my-zsh, cleaning up..."
            # Add your cleanup commands for oh-my-zsh here.
        fi
    fi
fi

# Install Byobu if not present
if ! command -v byobu &> /dev/null; then
    echo "Installing Byobu"
    if ! sudo apt-get install byobu -y; then
        echo "Failed to install Byobu, cleaning up..."
        # Add your cleanup commands for Byobu here.
    fi
fi

# Install Git if not present
if ! command -v git &> /dev/null; then
    echo "Installing Git"
    if ! sudo apt-get install git -y; then
        echo "Failed to install Git, cleaning up..."
        # Add your cleanup commands for Git here.
    fi
fi

# Install Docker if not present
if ! command -v docker &> /dev/null; then
    echo "Installing Docker"
    if ! sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y; then
        echo "Failed to install Docker dependencies, cleaning up..."
        # Add your cleanup commands for Docker dependencies here.
    elif ! curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg; then
        echo "Failed to add Docker GPG key, cleaning up..."
        # Add your cleanup commands for Docker GPG key here.
    elif ! echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; then
        echo "Failed to add Docker repo, cleaning up..."
        # Add your cleanup commands for Docker repo here.
    elif ! sudo apt-get update -y; then
        echo "Failed to update package lists, cleaning up..."
        # Add your cleanup commands for package update here.
    elif ! sudo apt-get install docker-ce docker-ce-cli containerd.io -y; then
        echo "Failed to install Docker, cleaning up..."
        # Add your cleanup commands for Docker installation here.
    fi
fi

# Install Go if not present
GO_VERSION="1.17.2"
if ! go version | grep -q "$GO_VERSION"; then
    echo "Installing Go $GO_VERSION"
    if ! sudo apt-get install wget -y; then
        echo "Failed to install wget, cleaning up..."
        # Add your cleanup commands for wget here.
    elif ! wget https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz; then
        echo "Failed to download Go, cleaning up..."
        # Add your cleanup commands for Go download here.
    elif ! sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go${GO_VERSION}.linux-amd64.tar.gz; then
        echo "Failed to install Go, cleaning up..."
        # Add your cleanup commands for Go installation here.
    elif ! echo "export PATH=$PATH:/usr/local/go/bin" >> ~/.zshrc; then
        echo "Failed to update PATH, cleaning up..."
        # Add your cleanup commands for PATH update here.
    elif ! go version; then
        echo "Failed to check Go version, cleaning up..."
        # Add your cleanup commands for Go version check here.
    fi
fi

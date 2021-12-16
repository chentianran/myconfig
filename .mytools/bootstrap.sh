#!/bin/bash

### Base packages #############################################################
sudo apt update && sudo apt install \
    aptitude \
    autoconf \
    automake \
    clang \
    cmake \
    cmus \
    curl \
    diffutils \
    exfat-fuse \
    exfat-utils \
    ffmpeg \
    findutils \
    g++ \
    gfortran \
    git \
    git-flow \
    graphicsmagick \
    graphviz \
    htop \
    libboost-all-dev \
    libboost-python-dev \
    libcln-dev \
    libeigen3-dev \
    libginac-dev \
    libgraphviz-dev \
    libmpfr-dev \
    libtbb-dev \
    lm-sensors \
    nvme-cli \
    octave \
    octave-general \
    pandoc \
    polymake \
    python3-dev \
    python3-graphviz \
    python3-pip \
    python3-scipy \
    ranger \
    ruby \
    ruby-bundler \
    ruby-full \
    texlive-full \
    texlive-xetex \
    valgrind \
    vim

### VirtualBox ###
if whiptail --yesno "Install VirtualBox?" 20 60 ;then
    sudo apt install virtualbox virtualbox-ext-pack
fi

### GUI packages #############################################################
if whiptail --yesno "Install GUI packages?" 20 60 ;then
    sudo apt install \
        blueman \
        gitg \
        gnome-tweaks \
        ibus-libpinyin \
        ibus-pinyin \
        meld \
        synaptic \
        xcape \
        xclip \
        zathura
fi

### Fonts #############################################################
#if whiptail --yesno "???" 20 60 ;then
#fi
if whiptail --yesno "Install fonts?" 20 60 ;then
    sudo apt install fonts-firacode 
    sudo apt install fonts-noto-cjk-extra 
fi

if whiptail --yesno "Install Powerline fonts?" 20 60 ;then
    sudo apt install fonts-powerline
fi

if whiptail --yesno "Install Nerd Fonts???" 20 60 ;then
    cd $HOME/src
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip Hack.zip -d ~/.fonts
    fc-cache -fv
fi

### Regolith desktop #############################################################
if whiptail --yesno "Regolith desktop?" 20 60 ;then
    sudo add-apt-repository ppa:regolith-linux/release
    sudo apt install regolith-desktop-complete
fi

### Shell #############################################################
if whiptail --yesno "Install Fish?" 20 60 ;then
    echo "[ Fish shell ]"
    sudo apt install fish
    chsh -s /usr/bin/fish
    echo "[ Fisher ]"
    curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fi

### Starship prompt ###########################################################
if whiptail --yesno "Install Starship prompt?" 20 60 ;then
    echo "[ Starship prompt ]"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
fi

### Node.js #############################################################
# Install Node.js from nodesource binary repository
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get install -y nodejs

if whiptail --yesno "Install NVM?" 20 60 ;then
    echo "[ NVM ]"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
fi

### Jupyter #############################################################

### CUDA #############################################################
if whiptail --yesno "Install CUDA?" 20 60 ;then
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
    sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
    sudo apt-get update
    sudo apt-get -y install cuda
    break;;
fi

### Docker/Podman ###
if whiptail --yesno "Install Podman?" 20 60 ;then
    sudo apt-get -y install podman
fi

### VS Code #############################################################
if whiptail --yesno "Install vscode?" 20 60 ;then
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
    rm -f packages.microsoft.gpg
    sudo apt install apt-transport-https
    sudo apt update
    sudo apt install code # or code-insiders
fi

### Brave browser ###
if whiptail --yesno "Install Brave browser?" 20 60 ;then
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
fi

### Setup my config tools ###
echo ".myconfig" >> .gitignore
git clone --bare https://github.com/chentianran/myconfig.git $HOME/.myconfig
alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
myconfig checkout
myconfig config --local status.showUntrackedFiles no


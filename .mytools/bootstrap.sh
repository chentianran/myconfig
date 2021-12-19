#!/usr/bin/bash

### Base packages #############################################################
sudo apt update && sudo apt install \
    aptitude \
    autoconf \
    automake \
    ca-certificates \
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
    gnupg \
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
    lsb-release \
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
read -p "Press enter to continue"

### VirtualBox ###
if whiptail --yesno "Install VirtualBox?" 20 60 ;then
    sudo apt install virtualbox virtualbox-ext-pack
    read -p "Press enter to continue"
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
    read -p "Press enter to continue"
fi

### Fonts #############################################################
#if whiptail --yesno "???" 20 60 ;then
#fi
if whiptail --yesno "Install fonts?" 20 60 ;then
    sudo apt install fonts-firacode 
    sudo apt install fonts-noto-cjk-extra 
    read -p "Press enter to continue"
fi

if whiptail --yesno "Install Powerline fonts?" 20 60 ;then
    sudo apt install fonts-powerline
    read -p "Press enter to continue"
fi

if whiptail --yesno "Install Nerd Fonts???" 20 60 ;then
    cd $HOME/src
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
    unzip Hack.zip -d ~/.fonts
    fc-cache -fv
    read -p "Press enter to continue"
fi

### Regolith desktop #############################################################
if whiptail --yesno "Install Regolith desktop?" 20 60 ;then
    sudo add-apt-repository ppa:regolith-linux/release
    sudo apt install regolith-desktop-complete
    read -p "Press enter to continue"
fi

### Github CLI ################################################################
if whiptail --yesno "Install Github CLI?" 20 60 ;then
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install gh
fi

### Shell #############################################################
if whiptail --yesno "Install Fish?" 20 60 ;then
    echo "[ Fish shell ]"
    sudo apt install fish
    chsh -s /usr/bin/fish
    echo "[ Fisher ]"
    fish -c "curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher"
    read -p "Press enter to continue"
fi

### Starship prompt ###########################################################
if whiptail --yesno "Install Starship prompt?" 20 60 ;then
    echo "[ Starship prompt ]"
    sh -c "$(curl -fsSL https://starship.rs/install.sh)"
    read -p "Press enter to continue"
fi

### Node.js #############################################################
# Install Node.js from nodesource binary repository
# curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
# sudo apt-get install -y nodejs

if whiptail --yesno "Install NVM?" 20 60 ;then
    echo "[ NVM ]"
    curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh" | bash
    read -p "Press enter to continue"
fi

### Jupyter #############################################################
if whiptail --yesno "Install JupyterLab?" 20 60 ;then
    pip install --user jupyterlab
    read -p "Press enter to continue"
fi

### CUDA #############################################################
if whiptail --yesno "Install CUDA?" 20 60 ;then
    wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
    sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
    sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
    sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
    sudo apt-get update
    sudo apt-get -y install cuda
    read -p "Press enter to continue"
fi

### Docker/Podman ###
if whiptail --yesno "Install Docker?" 20 60 ;then
    # sudo apt-get -y install podman
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io
    sudo groupadd docker
    sudo usermod -aG docker $USER
    read -p "Press enter to continue"
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
    read -p "Press enter to continue"
fi

### Brave browser ###
if whiptail --yesno "Install Brave browser?" 20 60 ;then
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
    read -p "Press enter to continue"
fi

### Setup my config tools ###
if whiptail --yesno "Set up myconfig?" 20 60 ;then
    git clone --bare https://github.com/chentianran/myconfig.git $HOME/.myconfig
    alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
    myconfig checkout
    myconfig config --local status.showUntrackedFiles no
    read -p "Press enter to continue"
fi


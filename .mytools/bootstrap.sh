#!/bin/sh

### Base packages #############################################################
sudo apt install \
    aptitude \
    autoconf \
    automake \
    awscli \
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

### GUI packages #############################################################
sudo apt install \
    blueman \
    gitg \
    gnome-tweaks \
    ibus-libpinyin \
    ibus-pinyin \
    meld \
    shutter \
    synaptic \
    xcape \
    xclip \
    zathura

### Fonts #############################################################
echo "[ Fira Code font]"
sudo apt install fonts-firacode 

echo "[ Noto CJK fonts]"
sudo apt install fonts-noto-cjk-extra 

echo "[ Nerd fonts ]"
cd $HOME/src
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip Hack.zip -d ~/.fonts
fc-cache -fv


### Regolith desktop #############################################################
sudo add-apt-repository ppa:regolith-linux/release
sudo apt install regolith-desktop-complete

### Shell #############################################################
echo "[ Fish shell ]"
sudo apt install fish
echo "[ Starship prompt ]"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

### Node.js #############################################################
# Install Node.js from nodesource binary repository
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

### Jupyter #############################################################

### CUDA #############################################################
while true; do
    read -p "Install CUDA" yn
    case $yn in
        [Yy]* ) 
            wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
            sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
            sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
            sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
            sudo apt-get update
            sudo apt-get -y install cuda
            break;;
        [Nn]* ) 
            break;;
        * ) echo "Please answer yes or no.";;
    esac
done

### Docker/Podman ###
sudo apt-get -y install podman

### VS Code #############################################################
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

### Brave browser ###
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

### Setup my config tools ###
echo ".myconfig" >> .gitignore
git clone --bare https://github.com/chentianran/myconfig.git $HOME/.myconfig
alias myconfig='/usr/bin/git --git-dir=$HOME/.myconfig/ --work-tree=$HOME'
myconfig checkout
myconfig config --local status.showUntrackedFiles no


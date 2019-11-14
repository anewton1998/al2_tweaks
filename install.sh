#!/bin/bash

# It may be best to execute these one at a time by hand, to account for drift in projects.
# Once complete, log out and back in to get everything to work.

# Install things from the YUM repos.
# 1. Instatiate usage of the EPEL repository
# 2. i3
# 3. dmenu
# 4. conky
# 5. conky-manager
# 6. dconf-editor
# 7. mlocate
# 8. htop

sudo yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install i3 dmenu conky conky-manager dconf-editor mlocate htop

# Add Fish repository
cd /etc/yum.repos.d/
sudo wget https://download.opensuse.org/repositories/shells:fish:release:3/RHEL_7/shells:fish:release:3.repo
sudo yum -y install fish
cd

# Install Powerline fonts
# clone
git clone https://github.com/powerline/fonts.git --depth=1
# install
cd fonts
./install.sh
# clean-up a bit
cd ..
rm -rf fonts

# Copy config files, etc..
cp -Rv files/. $HOME/

# Install VimPlug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Get VimPlug working
vim +PlugInstall +qall

# Install sdkman
curl -s "https://get.sdkman.io" | bash

# Install fisher package manager for fish shell
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

# Install BobTheFish theme
fish -c "fisher add oh-my-fish/theme-bobthefish"

# Install sdkman-for-fish
fish -c "fisher add reitzig/sdkman-for-fish"

# Use VI keybindings in fish
fish -c "fish_vi_key_bindings"

# Install dconf settings
dconf load / < dconf-settings.ini


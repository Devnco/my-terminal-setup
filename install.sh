#!/bin/sh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
LGREEN='\033[1;32m'
GRAY='\033[0;37m'
BLUE='\033[0;34m'
ORANGE='\033[0;33m'
NC='\033[0m'

# Set settings in a file and and this one to it final destination
function setSettingAndCopy {
	sed "s/$2/$3/g" $1 > ~/$4
}

# Zsh and Oh My Zsh Setup
while true; do
    echo "\n${ORANGE}Do you want to install Zsh and Oh My Zsh ?${GREEN} [Yn]${NC} "
    read -p "" yn
    case $yn in
        [Yy]* ) 
                # Install ZSH
				brew install zsh zsh-completions;
				# Install OH MY ZSH
				curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh;
                break;
            ;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Copy and set Oh My Zsh config  
while true; do
    echo "\n${ORANGE}Copy the default config and theme of Oh My Zsh ?${GREEN} [Yn]${NC} "
    read -p "" yn
    case $yn in
        [Yy]* ) 
				setSettingAndCopy config/zshrc {{USERDIR}} $(whoami) .zshrc;
                break;
            ;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Font Setup
while true; do
    echo "\n${ORANGE}Do you want to downlod fonts for terminal theme ?${GREEN} [Yn]${NC} "
    read -p "" yn
    case $yn in
        [Yy]* ) 
               	# Install fonts for terminal
				git clone https://github.com/powerline/fonts.git;
				cd fonts;
				sh install.sh;
				cd ..;
				rm -rf fonts;
                break;
            ;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done


# Font Setup
while true; do
    echo "\n${ORANGE}Do you want to import Monokai Flat Theme in terminal ?${GREEN} [Yn]${NC} "
    read -p "" yn
    case $yn in
        [Yy]* ) 
               	open theme/Flat\ Monokai.terminal
            ;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

echo "\n${GREEN} All stuff is done, enjoy ! (devnco)${NC} "



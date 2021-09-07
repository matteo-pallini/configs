## Most of the credit for this setup goes to https://tkainrad.dev/posts/setting-up-linux-workstation/

# set-up different theme
sudo apt-get install gnome-tweak-tool
sudo apt-get install materia-gtk-theme
echo "manually select materia theme from the tweak page"

# set-up original nautilus search
sudo add-apt-repository ppa:lubomir-brindza/nautilus-typeahead
sudo apt dist-upgrade
killall nautilus # to force a restart


# install zshell
sudo apt install zsh
chsh -s $(which zsh)

echo "HISTSIZE=10000000" >> ~/.zshrc
echo "SAVEHIST=10000000" >> ~/.zshrc
setopt SHARE_HISTORY # share command history data

echo "autoload -Uz zcalc" >> ~/.zshrc

# set up oh my zshell
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "change ZSH_THEME in the ~/.zshrc to agnoster"
echo "change color of the working directory text by changing the below in the file ~/.oh-my-zsh/themes/agnoster.zsh-theme"
## Dir: current working directory
#prompt_dir() {
#  prompt_segment blue white '%~'
#}


# add plugins
git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z
sudo apt-get install peco
git clone https://github.com/jimeh/zsh-peco-history.git $ZSH_CUSTOM/plugins/zsh-peco-history
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "change plugins to plugins=(colored-man-pages git python django mvn aws docker vscode zsh-z zsh-peco-history zsh-autosuggestions zsh-syntax-highlighting)"

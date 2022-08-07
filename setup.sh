sudo apt-get install gnome-tweak-tool
sudo apt-get install materia-gtk-theme
echo "select materia as a theme from the tweak page"

# install zshell
sudo apt install zsh
chsh -s $(which zsh)

echo "HISTSIZE=10000000" >> ~/.zshrc
echo "SAVEHIST=10000000" >> ~/.zshrc
echo "setopt SHARE_HISTORY # share command history data" >> ~/.zshrc
echo "autoload -Uz zcalc" >> ~/.zshrc

# add oh my zsh package manager
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "manually replace ZSH_THEME in ~/.zshrc with agnoster"
echo "change working directory text color to white, by modifying the below in the file `~/.oh-my-zsh/themes/agnoster.zsh-theme`"
# Dir: current working directory
#prompt_dir() {
#  prompt_segment blue white '%~'
#}

git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

sudo apt-get install peco
git clone https://github.com/jimeh/zsh-peco-history.git $ZSH_CUSTOM/plugins/zsh-peco-history

echo "manually replace plugins in ~/.zshrc with plugins=(zsh-z colored-man-pages git python django mvn aws docker vscode zsh-peco-history)"

# set up emacs as default text editor
sudo add-apt-repository ppa:kelleyk/emacs
sudo apt-get update
sudo apt install emacs27

cat >~/.zshrc <<EOL
# set up emacs as default text editor
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient"
alias e='emacsclient --create-frame'

EOL

# set up python
mkdir -p ~/.virtualenvs
pip install virtualenvwrapper

cat >~/.zshrc <<EOL
alias python=python3
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"
export WORKON_HOME=~/.virtualenvs/
source ~/.local/bin/virtualenvwrapper.sh
EOL

cat >~/.zshrc <<EOL
# needed for direnv
eval "$(direnv hook zsh)"

setopt PROMPT_SUBST

show_virtual_env() {
  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}
PS1='$(show_virtual_env)'$PS1

EOL
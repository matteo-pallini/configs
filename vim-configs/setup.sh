# pull and install vim-plug
PLUG_VIM_FILE=~/.vim/autoload/plug.vim
if [ ! -f "$PLUG_VIM_FILE" ]; then
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim; 
fi

cp vimrc ~/.vimrc

vim -E -s -u "~/.vimrc" +PlugInstall +qall

# set up ctags - the ctags will be updated any time a commit, merge, rebase, checkout action is performed
# main source for setting it up https://tbaggery.com/2011/08/08/effortless-ctags-with-git.html
sudo apt-get install ctags
git config --global init.templatedir '~/.git-template'
hooks_path="${HOME}/.git-template/hooks"
mkdir -p $hooks_path
cp ./utils/git_hook_for_ctags.sh $hooks_path/ctags.sh
git config --global alias.ctags '!.git/hooks/ctags.sh'
# if using tee to copy in multiple destination the copied file is not executable anymore
cp ./utils/hooks_base.sh $hooks_path/post-commit
cp ./utils/hooks_base.sh $hooks_path/post-merge
cp ./utils/hooks_base.sh $hooks_path/post-checkout
cp ./utils/hooks_base_post_rewrite.sh $hooks_path/post-rewrite

# these are needed for the autocomplete plugin to work
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update && sudo apt install build-essential cmake vim python3-dev mono-complete golang-go nodejs npm

cd ~/.vim/plugged/YouCompleteMe
python3 install.py --all

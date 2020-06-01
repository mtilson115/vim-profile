install:
	cp .vimrc ~/.vimrc
	mkdir -p ~/scripts
	cp vim_tools.vim ~/scripts
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	cp .gitconfig ~/.gitconfig

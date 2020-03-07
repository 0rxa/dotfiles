#!/bin/bash

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" << EOF
EOF

mkdir -p .oh-my-zsh/custom/plugins
git clone \
	https://github.com/zsh-users/zsh-autosuggestions \
	$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

git clone \
	https://github.com/zsh-users/zsh-syntax-highlighting \
	$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

git clone \
	https://github.com/zsh-users/zsh-history-substring-search \
	$HOME/.oh-my-zsh/custom/plugins/zsh-history-substring-search

dir=$(pwd)
cd
for f in $dir/*; do
	([[ $f == *install.sh ]] || [[ $f == *archive.sh ]]) && continue
	([[ $f == *.png ]]) && continue
	ln -sf $f .$(echo $f | awk -F'/' '{print $NF}')
done


#!/bin/sh

if [[ ! -d $HOME/.ssh ]]
then
    mkdir $HOME/.ssh
fi

link_file () {
    if [[ -L $HOME/$1 ]]
    then
        rm $HOME/$1
    fi

    ln -s -f  $(pwd)/$1 $HOME/$1
}

files=(
    .vimrc
    .vim
    .gitconfig
    bin
    .ssh/config
)
for name in "${files[@]}"
do
    link_file $name
done

config_name="$HOME/.bash_aliases"
echo "# AUTO-GENERATED FILE! SEE DO NOT EDIT!" > $config_name
if [[ `which brew` ]]
then
    link_file ".profile"
    echo "source $(pwd)/.bash_aliases_mac" >> $config_name
else
    echo "source $(pwd)/.bash_aliases_linux" >> $config_name
fi
echo "source $(pwd)/.bash_aliases_common" >> $config_name


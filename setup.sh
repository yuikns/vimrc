#!/usr/bin/env bash

git pull origin master
git submodule update --init
git submodule foreach git pull origin master


BASE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "BASE_DIR:$BASE_DIR"

BACKUP_DIR=$BASE_DIR/backup

[ ! -d $BACKUP_DIR ] && mkdir -p $BACKUP_DIR

# remove origin .vimrc
if [ -f $HOME/.vimrc ] ; then
  BACKUP_VIMRC=$BACKUP_DIR/vimrc.$(date '+%Y-%m-%d.%H_%M_%S').vim
  echo "Backup $HOME/.vimrc to $BACKUP_VIMRC"
  mv $HOME/.vimrc $BACKUP_VIMRC
fi

if [ -d $HOME/.vim ] ; then
  BACKUP_VIM_BUNDLES=$BACKUP_DIR/vim.$(date '+%Y-%m-%d.%H_%M_%S')
  echo "Backup $HOME/.vim to $BACKUP_VIM_BUNDLES"
  mv $HOME/.vim $BACKUP_VIM_BUNDLES
fi

ln -sf $BASE_DIR/config.vim $HOME/.vimrc 
ln -sf $BASE_DIR/vim $HOME/.vim 




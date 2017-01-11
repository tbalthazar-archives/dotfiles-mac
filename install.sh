#!/bin/bash
set -e

# get dotfiles
get_dotfiles() {
  DOTFILES_PATH="$HOME/dotfiles-mac"
  if [[ -e $DOTFILES_PATH ]]; then
    cd $DOTFILES_PATH
    git pull
  else
    cd $HOME
    git clone https://github.com/tbalthazar/dotfiles-mac.git $DOTFILES_PATH
    cd $DOTFILES_PATH
  fi
  
  # create a directory to backup dotfiles before copying them
  NOW=$(date +'%Y-%m-%d-%H-%M-%S')
  BACKUP_DIR="$HOME/.dotfiles-backup/$NOW"
  mkdir -p $BACKUP_DIR
  
  # find each file/dir in config-files
  FIND_CMD='find ./config-files -maxdepth 1 ! -name config-files -exec basename {} ;'
  
  for file in $($FIND_CMD)
  do
    # backup existing config files
    FILE_TO_BACKUP="$HOME/$file"
    if [ -e "$FILE_TO_BACKUP" ]; then
      cp -R $FILE_TO_BACKUP $BACKUP_DIR
    fi;
  done;
  
  # copy all the dotfiles to the DEST_DIR
  CP_CMD="cd config-files && find . -type f -exec ditto \{\} $HOME \;"
  eval $CP_CMD

  # install/update vim plugins
  vim +PlugUpdate +qall

  source "$HOME/.bash_profile"
}

install_brew() {
  if command -v brew; then
    echo "Homebrew installed; updating:"
    brew update
  else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

install_brew_packages() {
  PKGS=('git' 'rbenv' 'ruby-build' 'tmux' 'vim')

  for pkg in ${PKGS[@]}; do
    if brew list -1 | grep -q "^${pkg}\$"; then
      echo "Package '$pkg' is installed; updating:"
      brew upgrade "$pkg" --cleanup || true
    else
      brew install "$pkg"
    fi
  done
}

install_ruby() {
  ## Set up ruby
  RUBY_VERSION="2.3.3"
  if [ -d ".rbenv/versions/$RUBY_VERSION" ]; then
    echo "Ruby $RUBY_VERSION already installed"
  else
    rbenv install "$RUBY_VERSION"
  fi
  eval "$(rbenv init -)"
  rbenv global "$RUBY_VERSION"
  gem install bundler
}

# install base system packages
base() {
  install_brew
  install_brew_packages
  install_ruby
}

usage() {
	echo -e "install.sh\n\tThis script installs my basic setup for a macOS laptop.\n"
	echo "Usage:"
	echo "  base                     - install base pkgs"
	echo "  dotfiles                 - get dotfiles"
}

main() {
  local cmd=$1
  
  if [[ -z "$cmd" ]]; then
    usage
    exit 1
  fi
  
  if [[ $cmd == "base" ]]; then
    base
  elif [[ $cmd == "dotfiles" ]]; then
    get_dotfiles
  else
    usage
  fi
}

main "$@"

#!/bin/bash

function mecho() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $1"
  echo "#############################################################################"
  echo -e "\033[0m"
}

mecho "Installing vim..."
  sudo apt-get install -y vim

mecho "Installing vim-gnome..."
  sudo apt-get install -y vim-gnome

mecho "Installing git..."
  sudo apt-get install -y git

mecho "Installing curl..."
  sudo apt-get install -y curl

mecho "Installing PHP..."
  sudo apt-get install -y php5

mecho "Installing php5-curl..."
  sudo apt-get install -y php5-curl

mecho "Installing php5-dev, pear, xdebug..."
  sudo apt-get install -y php5-dev php-pear
  sudo pecl install xdebug
  XDEBUG_PATH=`find /usr/lib/php5 -name xdebug.so`
  XDEBUG_CONF_PATH=/etc/php5/mods-available/xdebug.ini
  sudo echo "zend_extension=$XDEBUG_PATH" > /tmp/xdebug.ini
  sudo mv /tmp/xdebug.ini $XDEBUG_CONF_PATH
  sudo ln -s $XDEBUG_CONF_PATH /etc/php5/apache2/conf.d/30-xdebug.ini
  sudo ln -s $XDEBUG_CONF_PATH /etc/php5/cli/conf.d/30-xdebug.ini

mecho "Installing composer..."
  curl -sS https://getcomposer.org/installer | php
  sudo mv composer.phar /usr/bin
  sudo ln -s /usr/bin/composer.phar /usr/bin/composer


mecho "Installing tmux..."
  sudo apt-get install -y tmux

mecho "Installing zshell..."
  sudo apt-get install -y zsh

mecho "Installing oh-my-zsh..."
  wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

mecho "Setting shell to zshell..."
  chsh -s `which zsh`

#!/usr/bin/env bash

case "$OSTYPE" in
  solaris*) echo "OS SOLARIS not supported"; exit ;;
  darwin*)  MYOS="OSX" ;;
  linux*)   MYOS="LINUX" ;;
  bsd*)     echo "OS BSD not supported"; exit ;;
  msys*)    echo "OS WINDOWS not supported"; exit ;;
  cygwin*)  echo "OS WINDOWS not supported"; exit ;;
  *)        exit ;;
esac

if [ "$MYOS" = "LINUX" ]; then
  read -p "Please provide package manager: " MYPKGMGR
  sudo $MYPKGMGR install -y libcurl4-openssl-dev python3 python3-pip ruby ruby-dev libxml2 gnupg2
  command curl -sSL https://rvm.io/pkuczynski.asc | gpg2 --import -
  curl -sSL https://get.rvm.io | bash -s stable
  source ~/.bashrc
fi;

if [ "$MYOS" = "OSX" ]; then
  read -p "Please confirm use of homebrew y/n: " HBOK
  if [ "$HBOK" != "y" ]; then
    exit
  fi
  brew install curl
  brew install xml2
  brew install ruby
  brew install --cask jewelrybox
fi

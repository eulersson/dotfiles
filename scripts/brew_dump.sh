#!/bin/sh

rm brew/Brewfile
brew bundle dump --file=brew/Brewfile
brew leaves | xargs brew desc --eval-all | tee brew/descr-formulae.txt
brew ls --casks | xargs brew desc --eval-all | tee brew/descr-casks.txt

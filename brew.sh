#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Save Homebrew’s installed location.
BREW_PREFIX=$(brew --prefix)

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
ln -s "${BREW_PREFIX}/bin/gsha256sum" "${BREW_PREFIX}/bin/sha256sum"

# Install some other useful utilities like `sponge`
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`
brew install gnu-sed --with-default-names
# Install Bash 4
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q "${BREW_PREFIX}/bin/bash" /etc/shells; then
  echo "${BREW_PREFIX}/bin/bash" | sudo tee -a /etc/shells;
  chsh -s "${BREW_PREFIX}/bin/bash";
fi;

# Install node
brew install node

# Install Yarn
brew install yarn

# Install wget with IRI support
brew install wget --with-iri

# Install GnuPG to enable PGP-signing commits.
brew install gnupg

brew install vim --with-override-system-vi
brew install grep
brew install openssh
brew install screen
brew install php
brew install gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2


# Install other useful binaries
brew install ack
brew install cowsay
#brew install exiv2
brew install git
brew install git-lfs
brew install foremost
brew install imagemagick --with-webp
brew install lynx
brew install mongodb
brew install nmap
brew install ucspi-tcp # `tcpserver` et al.
brew install pigz
brew install pv
brew install rename
brew install sqlmap
brew install ssh-copy-id
brew install tree
brew install vbindiff
brew install webkit2png
# usage webkit2png http://www.google.com/
brew install youtube-dl
brew install xpdf
brew install zopfli


# Remove outdated versions from the cellar
brew cleanup

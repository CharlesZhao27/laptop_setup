#!/bin/bash

# Function to check if Homebrew is installed and install or update it
validate_homebrew() {
    echo "Validating Homebrew installation, checking..."
    
    if ! command -v brew &> /dev/null
    then
        echo "Homebrew not found, installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo "Homebrew installed!"
    else
        echo "Homebrew found, updating..."
        brew update
        echo "Homebrew is up-to-date!"
    fi
}

# Function to install Node.js
install_node() {
  if ! command -v node &> /dev/null
  then
    echo "Installing Node.js..."
    brew install node
  else
    echo "Node.js is already installed."
  fi
}

# Function to install Go
install_go() {
  if ! command -v go &> /dev/null
  then
    echo "Installing Go..."
    brew install go
  else
    echo "Go is already installed."
  fi
}

# Function to install Visual Studio Code
install_vscode() {
  if ! command -v code &> /dev/null
  then
    echo "Installing Visual Studio Code..."
    brew install --cask visual-studio-code
  else
    echo "Visual Studio Code is already installed."
  fi
}

# Main script
validate_homebrew
install_node
install_go
install_vscode

echo "Installation process completed."

# Adding brew to PATH if not already added
if ! grep -q 'eval "$(/opt/homebrew/bin/brew shellenv)"' ~/.zshrc; then
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo "Please restart your terminal to apply changes."

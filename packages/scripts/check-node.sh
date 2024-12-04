check_node() {
  if ! command -v node &>/dev/null; then
    echo "Node.js is not installed."
    read -p "Would you like to install it? (y/n): " choice
    if [ "$choice" = "y" ]; then
      echo "Choose the installation method:"
      echo "1) fnm (recommended)"
      echo "2) brew"
      echo "3) winget"
      echo "4) scoop"
      read -p "Enter the number of your choice: " method
      case $method in
      1)
        if command -v fnm &>/dev/null; then
          echo "Installing Node.js using fnm..."
          fnm install --lts
          npm install -g pnpm
        else
          echo "fnm is not installed. Please install fnm first."
        fi
        ;;
      2)
        if command -v brew &>/dev/null; then
          echo "Installing Node.js using Homebrew..."
          brew install node
        else
          echo "Homebrew is not installed. Please install Homebrew first."
        fi
        ;;
      3)
        if command -v winget &>/dev/null; then
          echo "Installing Node.js using winget..."
          winget install OpenJS.NodeJS
        else
          echo "winget is not installed. Please install winget first."
        fi
        ;;
      4)
        if command -v scoop &>/dev/null; then
          echo "Installing Node.js using Scoop..."
          scoop install nodejs
        else
          echo "Scoop is not installed. Please install Scoop first."
        fi
        ;;
      *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
      esac
    else
      echo "Node.js installation skipped."
    fi
  else
    echo "Node.js is already installed."
  fi
}

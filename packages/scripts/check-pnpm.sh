check_pnpm() {
  if ! command -v pnpm &>/dev/null; then
    echo "pnpm is not installed."
    read -p "Would you like to install it? (y/n): " choice
    if [ "$choice" = "y" ]; then
      echo "Choose the installation method:"
      echo "1) npm -g (recommended)"
      echo "2) brew"
      echo "3) winget"
      echo "4) scoop"
      echo "5) corepack"
      read -p "Enter the number of your choice: " method
      case $method in
      1)
        if command -v npm &>/dev/null; then
          echo "Installing pnpm globally using npm..."
          npm install -g pnpm
        else
          echo "npm is not installed. Please install node/npm first."
        fi
        ;;
      2)
        if command -v brew &>/dev/null; then
          echo "Installing pnpm using Homebrew..."
          brew install pnpm
        else
          echo "Homebrew is not installed. Please install Homebrew first."
        fi
        ;;
      3)
        if command -v winget &>/dev/null; then
          echo "Installing pnpm using winget..."
          winget install pnpm
        else
          echo "winget is not installed. Please install winget first."
        fi
        ;;
      4)
        if command -v scoop &>/dev/null; then
          echo "Installing pnpm using Scoop..."
          scoop install nodejs-lts pnpm
        else
          echo "Scoop is not installed. Please install Scoop first."
        fi
        ;;
      5)
        if command -v corepack &>/dev/null; then
          echo "Installing pnpm using Corepack..."
          corepack enable
          corepack prepare pnpm@latest --activate
        else
          echo "Corepack is not available. Please ensure you have Node.js installed."
        fi
        ;;
      *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
      esac
    else
      echo "pnpm installation skipped."
    fi
  else
    echo "pnpm is already installed."
  fi
}

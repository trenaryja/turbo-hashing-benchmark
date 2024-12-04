check_rust() {
  if ! command -v rustc &>/dev/null; then
    echo "Rust is not installed."
    read -p "Would you like to install it? (y/n): " choice
    if [ "$choice" = "y" ]; then
      echo "Choose the installation method:"
      echo "1) rustup (recommended)"
      echo "2) brew"
      echo "3) winget"
      echo "4) scoop"
      read -p "Enter the number of your choice: " method
      case $method in
      1)
        if command -v curl &>/dev/null; then
          echo "Installing Rust using rustup..."
          curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
        else
          echo "curl is not installed. Please install curl first."
        fi
        ;;
      2)
        if command -v brew &>/dev/null; then
          echo "Installing Rust using brew..."
          brew install rust
        else
          echo "brew is not installed. Please install brew first."
        fi
        ;;
      3)
        if command -v scoop &>/dev/null; then
          echo "Installing Rust using scoop..."
          scoop install rust
        else
          echo "scoop is not installed. Please install scoop first."
        fi
        ;;
      4)
        if command -v winget &>/dev/null; then
          echo "Installing Rust using winget..."
          winget install -e --id Rustlang.Rust
        else
          echo "winget is not installed. Please install winget first."
        fi
        ;;
      *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
      esac
    else
      echo "Rust installation skipped."
    fi
  else
    echo "Rust is already installed."
  fi
}

check_deno() {
  if ! command -v deno &>/dev/null; then
    echo "Deno is not installed."
    read -p "Would you like to install it? (y/n): " choice
    if [ "$choice" = "y" ]; then
      echo "Choose the installation method:"
      echo "1) shell script (recommended)"
      echo "2) brew"
      echo "3) winget"
      echo "4) scoop"
      read -p "Enter the number of your choice: " method
      case $method in
      1)
        echo "Installing Deno using shell script..."
        curl -fsSL https://deno.land/install.sh | sh
        ;;
      2)
        if command -v brew &>/dev/null; then
          echo "Installing Deno using brew..."
          brew install deno
        else
          echo "brew is not installed. Please install brew first."
        fi
        ;;
      3)
        if command -v winget &>/dev/null; then
          echo "Installing Deno using winget..."
          winget install denoland.deno
        else
          echo "winget is not installed. Please install winget first."
        fi
        ;;
      4)
        if command -v scoop &>/dev/null; then
          echo "Installing Deno using Scoop..."
          scoop install deno
        else
          echo "Scoop is not installed. Please install Scoop first."
        fi
        ;;
      *)
        echo "Invalid choice. Please run the script again and choose a valid option."
        ;;
      esac
    else
      echo "Deno installation skipped."
    fi
  else
    echo "Deno is already installed."
  fi
}

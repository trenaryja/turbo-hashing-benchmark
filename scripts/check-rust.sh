install_rust() {
  echo "Choose how you want to install Rust:"
  echo "1) rustup (recommended)"
  echo "2) From the official package manager"
  echo "3) From source"
  read -p "Enter the number of your choice: " choice

  case "$choice" in
  1)
    echo "Installing Rust using rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    ;;
  2)
    echo "Installing Rust from the official package manager..."
    case "$os" in
    Linux)
      sudo apt-get update && sudo apt-get install rustc
      ;;
    Mac)
      brew install rust
      ;;
    Windows)
      echo "Please follow the instructions at https://forge.rust-lang.org/infra/other-installation-methods.html#which for Windows."
      ;;
    *)
      echo "Unsupported OS for automatic Rust installation. Please install Rust manually."
      exit 1
      ;;
    esac
    ;;
  3)
    echo "Installing Rust from source..."
    git clone https://github.com/rust-lang/rust.git
    cd rust
    ./x.py build
    ;;
  *)
    echo "Invalid choice. Please run the script again and choose a valid option."
    exit 1
    ;;
  esac
}

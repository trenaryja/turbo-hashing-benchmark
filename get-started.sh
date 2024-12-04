#!/bin/bash
for script in ./scripts/*.sh; do
  source "$script"
done

# Main script execution
os=$(detect_os)

case "$os" in
Linux)
  echo "Linux detected: Time to sudo apt-get some fun!"
  ;;
Mac)
  echo "Mac detected: Let's brew some laughter!"
  ;;
Windows)
  echo "Windows detected: Let's get this party started!"
  ;;
*)
  echo "Unknown OS: Are you from another planet?"
  ;;
esac

# # Check if Rust is installed
# if ! command -v rustc &>/dev/null; then
#   read -p "Rust is not installed. Do you want to install it? (y/n): " choice
#   if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
#     install_rust
#     source $HOME/.cargo/env
#   else
#     echo "Rust installation skipped."
#     exit 1
#   fi
# else
#   echo "Rust is already installed."
# fi

pnpm install
pnpm turbo get-started

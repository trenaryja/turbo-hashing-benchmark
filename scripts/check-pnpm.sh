check_pnpm() {
  if ! command -v pnpm >/dev/null 2>&1; then
    echo "pnpm not found, installing..."
    case "$os" in
    Linux | Mac)
      curl -fsSL https://get.pnpm.io/install.sh | sh -
      ;;
    Windows)
      npm install -g pnpm
      ;;
    *)
      echo "Unsupported OS for automatic pnpm installation. Please install pnpm manually."
      exit 1
      ;;
    esac
  else
    echo "pnpm is already installed."
  fi
}

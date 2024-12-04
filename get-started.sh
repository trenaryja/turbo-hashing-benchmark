for script in ./packages/scripts/*.sh; do
  source "$script"
done

echo "Checking if required dependencies are installed..."
check_node
check_pnpm
check_deno
check_rust

echo "Installing dependencies..."
pnpm install
pnpm turbo get-started

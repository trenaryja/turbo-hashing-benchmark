# Show loader for three seconds
echo -n "Setting up rust-xxhash"
for i in {1..3}; do
  echo -n "."
  sleep 1
done

# Print setup complete message
echo -e "\nSetup complete for rust-xxhash"

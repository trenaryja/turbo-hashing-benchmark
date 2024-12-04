generate_completions() {
  if [ -z "$1" ]; then
    echo "Error: No shell argument provided. Please specify the shell type (e.g., zsh, bash, powershell)."
    return 1
  fi

  local shell=$1
  echo "$(fnm env --use-on-cd --shell $shell)"
  echo "$(deno completions $shell)"
  echo "$(rustup completions $shell)"
}

while getopts "i" opt; do
  case $opt in
  i)
    while true; do
      read -p "Please specify your shell type (e.g., zsh, bash, powershell): " user_shell
      if [[ "$user_shell" =~ ^(zsh|bash|powershell)$ ]]; then
        break
      fi
      echo "Invalid shell type. Please enter one of the following: zsh, bash, powershell."
    done

    read -p "Please specify where to pipe the output (leave empty to echo to terminal): " output_dest
    if [ -z "$output_dest" ]; then
      generate_completions "$user_shell"
    else
      generate_completions "$user_shell" | eval "$output_dest"
    fi
    ;;
  \?)
    echo "Invalid option: -$OPTARG" >&2
    ;;
  esac
done

detect_os() {
  case "$(uname -s)" in
  Linux*) echo "Linux" ;;
  Darwin*) echo "Mac" ;;
  CYGWIN* | MINGW*) echo "Windows" ;;
  *) echo "UNKNOWN" ;;
  esac
}

detect_shell() {
  if [ -n "$ZSH_VERSION" ]; then
    echo "zsh"
  elif [ -n "$BASH_VERSION" ]; then
    echo "bash"
  elif [ -n "$FISH_VERSION" ]; then
    echo "fish"
  elif [[ "$OSTYPE" == "cygwin" || "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # Check for PowerShell or pwsh
    if [[ "$(ps -o comm= -p $$)" =~ pwsh|powershell ]]; then
      echo "powershell"
    else
      echo "cmd"
    fi
  # Detect the shell from the parent process (fallback)
  else
    shell_name="$(ps -o comm= -p $$)"
    case "$shell_name" in
    zsh) echo "zsh" ;;
    bash) echo "bash" ;;
    fish) echo "fish" ;;
    ksh) echo "ksh" ;;
    tcsh) echo "tcsh" ;;
    csh) echo "csh" ;;
    pwsh | powershell) echo "powershell" ;;
    *) echo "UNKNOWN" ;;
    esac
  fi
}

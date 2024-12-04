detect_os() {
  case "$(uname -s)" in
  Linux*) echo "Linux" ;;
  Darwin*) echo "Mac" ;;
  CYGWIN* | MINGW*) echo "Windows" ;;
  *) echo "UNKNOWN" ;;
  esac
}

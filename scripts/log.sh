log() {
  local fmt="$1"; shift
  printf "\n\e[94m$fmt\n" "$@"
}


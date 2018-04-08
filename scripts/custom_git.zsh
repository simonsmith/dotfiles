#
# Custom git status
#
# ------------------------------------------------------------------------------
# Configuration
# ------------------------------------------------------------------------------
#
SPACESHIP_CUSTOM_GIT_COLOR="${SPACESHIP_CUSTOM_GIT_COLOR="magenta"}"
SPACESHIP_CUSTOM_GIT_PREFIX="${SPACESHIP_CUSTOM_GIT_PREFIX=""}"
SPACESHIP_CUSTOM_GIT_SHOW="${SPACESHIP_CUSTOM_GIT_SHOW=true}"
SPACESHIP_CUSTOM_GIT_SUFFIX="${SPACESHIP_CUSTOM_GIT_SUFFIX=" "}"

# ------------------------------------------------------------------------------
# Section
# ------------------------------------------------------------------------------

spaceship_custom_git() {
  [[ $SPACESHIP_CUSTOM_GIT_SHOW == false ]] && return

  spaceship::is_git || return

  # Check if command is available for execution
  spaceship::exists git_super_status || return

  # Retrieve git status and save it to variable
  local custom_git_status=$(git_super_status)

  spaceship::section \
    "$SPACESHIP_CUSTOM_GIT_COLOR" \
    "$SPACESHIP_CUSTOM_GIT_PREFIX" \
    "$custom_git_status" \
    "$SPACESHIP_CUSTOM_GIT_SUFFIX_"
}

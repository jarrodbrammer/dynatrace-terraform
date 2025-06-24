tfinit() {
  local ENV=$(basename "$PWD")
  local APP=$(basename "$(dirname "$PWD")")

  if [[ -z "$APP" || -z "$ENV" ]]; then
    echo "⚠️ Error: Could not determine APP or ENV from path. Expected structure: apps/<app>/<env>"
    return 1
  fi

  # Define styles
  BOLD=$(tput bold)
  GREEN=$(tput setaf 2)
  RESET=$(tput sgr0)

  # Print with style
  echo ""
  echo "${BOLD}Initializing Terraform for:${RESET}"
  echo ""
  echo "  ✅ ${GREEN} ${APP^^}${RESET} Application"
  echo "  ✅ ${GREEN} ${ENV^^}${RESET} Environment"
  echo ""

  terraform init \
    -backend-config="address=https://gitlab.example.com/api/v4/projects/${CI_PROJECT_ID:-123}/terraform/state/${APP}_${ENV}" \
    -backend-config="lock_address=https://gitlab.example.com/api/v4/projects/${CI_PROJECT_ID:-123}/terraform/state/${APP}_${ENV}/lock" \
    -backend-config="unlock_address=https://gitlab.example.com/api/v4/projects/${CI_PROJECT_ID:-123}/terraform/state/${APP}_${ENV}/lock" \
    -backend-config="username=gitlab-ci-token" \
    -backend-config="password=${CI_JOB_TOKEN:-dev-placeholder}"
}



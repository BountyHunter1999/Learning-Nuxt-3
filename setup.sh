#!/bin/bash
set -e

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
    tput setaf 1
    echo "Please run as root"
    exec sudo "$0" "$@"
    tput sgr0
fi

show_usage() {
    tput setaf 2
    echo "Usage: $0 [project_name]"
    echo "  project_name: The name of the project to initialize. (Default is 'hello-nuxt')."
    tput sgr0 # reset text attributes to default
}

# check if the first arg is help
#if [[ $# -eq 0 || $1 == -h || $1 == "--help" ]]; then
if [[ -n $project_name || $1 == -h || $1 == "--help" ]]; then
    show_usage
    exit 0
fi

project_name=${1:-hello-nuxt}

docker run -v $(pwd):/app -w /app --rm -it node:20.18.1-slim  bash -c "npm install -g pnpm && pnpm dlx nuxi@latest init ${project_name}"

sudo chown -R `id -u -n`:`id -g -n` $project_name .
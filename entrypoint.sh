#!/bin/bash

set -euo pipefail

GIT_USER_NAME="${1}"
GIT_USER_EMAIL="${2}"
LINTIAN_BRUSH_DIRECTORY="${3}"
LINTIAN_BRUSH_NO_UPDATE_CHANGELOG="${4}"
LINTIAN_BRUSH_MODERN="${5}"

# Default lintian-brush arguments
lintian_brush_args=(
    "--verbose"
    "--diff"
)

# Parse options
if [ -n "${LINTIAN_BRUSH_DIRECTORY}" ]; then
    lintian_brush_args+=("--directory=${LINTIAN_BRUSH_DIRECTORY}")
fi
if [ "${LINTIAN_BRUSH_NO_UPDATE_CHANGELOG}" == "true" ]; then
    lintian_brush_args+=("--no-update-changelog")
fi
if [ "${LINTIAN_BRUSH_MODERN}" == "true" ]; then
    lintian_brush_args+=("--modern")
fi

# Create .config directory, required by breezy
mkdir "${HOME}/.config/"

# Set git user information
git config user.name "${GIT_USER_NAME}"
git config user.email "${GIT_USER_EMAIL}"

# Run lintian-brush
lintian-brush "${lintian_brush_args[@]}"

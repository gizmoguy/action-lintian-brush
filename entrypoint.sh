#!/bin/bash

set -euo pipefail

LINTIAN_BRUSH_DIRECTORY="${1}"
LINTIAN_BRUSH_NO_UPDATE_CHANGELOG="${2}"
LINTIAN_BRUSH_MODERN="${3}"

env

#lintian-brush --verbose --diff

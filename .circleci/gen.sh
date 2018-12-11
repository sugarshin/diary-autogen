#!/usr/bin/env bash

set -o nounset
set -o errexit
set -o pipefail

readonly DIARY_REPO_NAME=diary
readonly WORKSPACE=$DIARY_REPO_NAME
readonly TARGET_DIR=$(date +%Y/%m)
readonly FILE_PATH=${TARGET_DIR}/$(date +%d).md

[ -d "$WORKSPACE" ] || git clone --depth 1 git@github.com:sugarshin/"$DIARY_REPO_NAME".git "$WORKSPACE"
cd "$WORKSPACE"
git pull --depth=1 || true
mkdir -p "$TARGET_DIR"
echo -e "# $(date '+%A %B %d %Y')\n" > "$FILE_PATH"
git add "$FILE_PATH"
git commit -m "Add ${FILE_PATH}"
git push origin

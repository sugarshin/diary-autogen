#!/bin/bash

set -o nounset
set -o errexit
set -o pipefail

DIARY_REPO_NAME=diary
WORKSPACE=$DIARY_REPO_NAME
TARGET_DIR=$(date +%Y/%m)
FILE_PATH=${TARGET_DIR}/$(date +%d).md

[ -d "${WORKSPACE}" ] || git clone --depth 1 "git@github.com:sugarshin/${DIARY_REPO_NAME}".git "${WORKSPACE}"
cd "${WORKSPACE}"
git pull --depth=1 || true
if [[ -f "${FILE_PATH}" ]]; then
  echo Already exists.
  exit 0
fi
mkdir -p "${TARGET_DIR}"
echo -e "# $(date '+%A %B %d %Y')\n" > "${FILE_PATH}"
git add "${FILE_PATH}"
git commit -m "Add ${FILE_PATH}"
git push origin

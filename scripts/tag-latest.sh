#!/usr/bin/env bash

VERSION=$1
TAG=${2:-latest}
PUBLISH_DIR=dist/packages
ORIG_DIRECTORY=$(pwd)

for package in "$PUBLISH_DIR"/*/; do
	PACKAGE_DIR="$(basename "${package}")"

	cd "$PUBLISH_DIR/$PACKAGE_DIR" || exit

	PACKAGE_NAME=$(node -e "console.log(require('./package.json').name)")

	echo "Publishing ${PACKAGE_NAME}@${VERSION} tag: ${TAG}"

	npm dist-tag add . ${TAG}

	cd "$ORIG_DIRECTORY" || exit
done
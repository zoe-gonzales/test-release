#!/usr/bin/env bash

VERSION=$1
TAG=${2:-latest}
PUBLISH_DIR=dist/packages
ORIG_DIRECTORY=$(pwd)
SOURCE_DIR="packages"
ASSETS=(package.json README.md)

for package in "$PUBLISH_DIR"/*/; do
	PACKAGE_DIR="$(basename "${package}")"

	for ASSET in "${ASSETS[@]}"; do
		if [ -f "$PUBLISH_DIR/$PACKAGE_DIR/$ASSET" ]; then
			echo "Skipping $PUBLISH_DIR/$PACKAGE_DIR/$ASSET: already exists, no copy needed."
		else
			cp "$SOURCE_DIR/$PACKAGE_DIR/$ASSET" "$PUBLISH_DIR/$PACKAGE_DIR/$ASSET"
			echo "Copied $ASSET to $PUBLISH_DIR/$PACKAGE_DIR/$ASSET"
		fi
	done

	cd "$PUBLISH_DIR/$PACKAGE_DIR" || exit

	PACKAGE_NAME=$(node -e "console.log(require('./package.json').name)")

	echo "Publishing ${PACKAGE_NAME}@${VERSION} tag: ${TAG}"

	npm version "$VERSION"
	npm publish --tag "$TAG"

	cd "$ORIG_DIRECTORY" || exit
done
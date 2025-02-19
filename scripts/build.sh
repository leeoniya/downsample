#!/usr/bin/env bash

# Some file system information first
SCRIPTS_PATH=$(dirname $0)
ROOT_PATH="$SCRIPTS_PATH/.."
DIST_PATH="$ROOT_PATH/dist"
TEST_PATH="$ROOT_PATH/test"

set -e
set -x

# Clean the build folder
npm run clean

# Make sure everything is okay
npm run lint
npm test

# Build the package
npm run build

# Lint the build
npm run lint:dist

# Copy all the metadata files to dist
cp LICENSE "$DIST_PATH/LICENSE"
cp package.json "$DIST_PATH/package.json"
cp *.md "$DIST_PATH/"

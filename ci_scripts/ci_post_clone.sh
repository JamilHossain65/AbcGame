#!/bin/sh

# git command
# git add --chmod=+x path/to/script.sh
# Navigate to the repository root directory
#cd ..

# Install CocoaPods dependencies using Homebrew
brew install cocoapods

# Run pod install to resolve and pull your dependencies
pod install

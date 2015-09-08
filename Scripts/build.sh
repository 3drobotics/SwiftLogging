#!/bin/bash

export PATH=$PATH:/usr/local/bin

xcodebuild -version | grep "Xcode 7" > /dev/null || { echo 'Not running Xcode 7' ; exit 1; }

cd `git rev-parse --show-toplevel`

xctool -project SwiftLogging.xcodeproj -scheme SwiftLogging_OSX build test
xctool -project SwiftLogging.xcodeproj -scheme SwiftLogging_iOS -sdk iphonesimulator build test
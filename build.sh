#!/bin/bash
set -e

# Install Flutter
git clone https://github.com/flutter/flutter.git --depth 1 -b stable flutter
export PATH="$PATH:$(pwd)/flutter/bin"

flutter pub get
flutter build web --release
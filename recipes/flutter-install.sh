#!/usr/bin/env bash

__FLUTTER_DOWNLOAD_URL='https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_1.22.5-stable.zip'

curl -L -o "$HOME/Coding/bin/flutter.zip" $__FLUTTER_DOWNLOAD_URL
unzip -q $HOME/Coding/bin/flutter.zip -d $HOME/Coding/bin/

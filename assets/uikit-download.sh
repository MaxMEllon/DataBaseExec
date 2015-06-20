#!/bin/sh
wget https://github.com/uikit/uikit/releases/download/v2.21.0/uikit-2.21.0.zip
unzip uikit-2.21.0.zip
mkdir uikit
mv css fonts js uikit
rm -rf uikit-2.21.0.zip


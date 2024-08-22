#!/bin/bash

echo ""
echo "Building Frontend"

cd app/ux
yarn
yarn build
cd ../..


echo ""
echo "Building Binary"

make silicon


echo ""
echo "Creating App"

rm -rf CellsSync.app
mkdir CellsSync.app
cd CellsSync.app

mkdir Contents
cd Contents

cp ../../Info.plist ./

mkdir MacOS
mkdir Resources

cp ../../launcher.sh ./MacOS/cells-sync
cp ../../cells-sync-m1 ./MacOS/cells-sync-bin
cp ../../app/resources/icon.icns ./Resources


echo ""
echo "Signing App"

codesign --force --deep --sign - ../../CellsSync.app


echo ""
echo "Finished"

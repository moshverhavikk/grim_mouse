#!/bin/bash
cp -f /usr/local/opt/zlib/lib/libz.a /usr/local/lib/
make bundle
rm /usr/local/lib/libz.a
cp dists/engine-data/mouse.lab ResidualVM.app/Contents/Resources/
rm -rf /tmp/pkg
mkdir -p /tmp/pkg
mv ResidualVM.app /tmp/pkg
cp README.ResidualVM /tmp/pkg/Readme_ResidualVM.txt
cp README /tmp/pkg/Readme.txt
hdiutil create /tmp/grim.dmg -ov -volname "Grim Mouse" -fs HFS+ -srcfolder /tmp/pkg
rm ~/Downloads/grim*.dmg
hdiutil convert /tmp/grim.dmg -format UDZO -o ~/Downloads/grim_mouse_0_5.dmg
scp ~/Downloads/grim_*.dmg pamplorange.cs.berkeley.edu:Downloads/

#!/bin/sh

# export XLua to dest folder
# useage ./export.sh <dest-path>

set -e

# first test arguments

if [ $# -ne 1 ]; then
    echo "export dest path not supplied"
    echo "Useage:"
    echo "$0 <dest-path-to-assets-folder>"
    exit 1
fi

MKDIR='mkdir -p'

# test dest folder exist or not
DEST=$1
if [ ! -d $DEST ]; then
    echo "Make dir for dest: $DEST"
    $MKDIR $DEST
fi

$MKDIR $DEST/3rd/XLua
$MKDIR $DEST/Plugins

# do real work
echo "Export current XLua build to $DEST..."

rm -rf $DEST/Plugins/xlua.bundle/
rsync -a ./Assets/Plugins/ $DEST/Plugins
rm -rf $DEST/3rd/XLua/Src $DEST/3rd/XLua/Resources
cp -rf ./Assets/XLua/CHANGELOG.txt ./Assets/XLua/Resources ./Assets/XLua/Src $DEST/3rd/XLua/

echo "Done!"

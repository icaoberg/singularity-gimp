#!/bin/bash

APP=gimp
VERSION=2.10.8
OS=debian-dusty
IMAGE=singularity-"$OS"-"$APP"-v"$VERSION".sif
DEFINITION=Singularity
LIST_OF_BINARIES=gimp

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

sudo singularity build $IMAGE $DEFINITION

if [ ! -d $APP/v$VERSION ]; then
	mkdir -p $APP/v$VERSION
fi

if [ -f $IMAGE ]; then
	mv -v $IMAGE $APP/v$VERSION/
fi

cp script.sh $APP/v$VERSION/
sed -i 's|OPERATING_SYSTEM|'$OS'|g' $APP/v$VERSION/script.sh
sed -i 's|VERSION_OF_THE_APPLICATION|'$VERSION'|g' $APP/v$VERSION/script.sh
sed -i 's|LIST_OF_BINARIES|'$LIST_OF_BINARIES'|g' $APP/v$VERSION/script.sh
sed -i 's|NAME_OF_THE_APPLICATION|'$APP'|g' $APP/v$VERSION/script.sh

cp modulefile $APP/v$VERSION/
sed -i 's|NAME_OF_THE_APPLICATION|'$APP'|g' $APP/v$VERSION/modulefile
sed -i 's|VERSION_OF_THE_APPLICATION|'$VERSION'|g' $APP/v$VERSION/modulefile

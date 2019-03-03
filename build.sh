#!/bin/bash

IMAGE=singularity-gimp.simg
DEFINITION=Singularity

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

singularity image.create -s 2000 $IMAGE
sudo singularity build $IMAGE $DEFINITION

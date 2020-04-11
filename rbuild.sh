#!/bin/bash

IMAGE=singularity-gimp.simg
DEFINITION=Singularity

if [ -f $IMAGE ]; then
	rm -fv $IMAGE
fi

singularity build --remote $IMAGE $DEFINITION

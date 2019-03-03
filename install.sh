#!/bin/bash

IMAGE=singularity-gimp
DIRECTORY=~/.singularity

if [ ! -d $DIRECTORY ]; then
	mkdir $DIRECTORY
fi

if [ ! -d ~/bin ]; then
	mkdir ~/bin
fi

if [ ! -f $DIRECTORY/$(echo $IMAGE | cut -d"-" -f2).simg ]; then
	singularity pull --name $(echo $IMAGE | cut -d"-" -f2).simg shub://icaoberg/$IMAGE
	mv -v $(echo $IMAGE | cut -d"-" -f2).simg $DIRECTORY
fi

cat << EOF > ~/bin/$(echo $IMAGE | cut -d"-" -f2)
#!/bin/bash

singularity run --app $(echo $IMAGE | cut -d"-" -f2) ~/.singularity/$(echo $IMAGE | cut -d"-" -f2).simg $1
EOF

chmod +x ~/bin/$(echo $IMAGE | cut -d"-" -f2)

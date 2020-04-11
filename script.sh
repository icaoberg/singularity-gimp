#!/bin/bash

APPS=(LIST_OF_BINARIES)

for APP in "${APPS[@]}"
do
cat << EOF > $APP
#!/bin/bash

IMAGE=singularity-OPERATING_SYSTEM-NAME_OF_THE_APPLICATION-vVERSION_OF_THE_APPLICATION.sif
DIRECTORY=\$(dirname \$0)
APPLICATION=$APP

source /containers/images/other/functions.sh

if is_compute_node; then
	singularity run --app \$APPLICATION \$DIRECTORY/\$IMAGE "\$1"
else
	cat /containers/images/other/MESSAGE
	exit 1
fi
EOF

chmod +x $APP
done

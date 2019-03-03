Bootstrap: docker
From: ubuntu:16.04

IncludeCmd: yes

%labels
    MAINTAINER icaoberg@cmu.edu
    WEBSITE http://www.cbd.cmu.edu/icaoberg
    VERSION 1.0

%runscript
    exec /bin/bash "$@"

%post
    echo "Update and upgrade"
    apt-get update && apt-get install -y --no-install-recommends apt-utils
    echo "Install Gimp"
    apt-get install -y gimp

####################################################################################
%appenv gimp
    APP=/usr/bin/gimp
    export APP

%apphelp gimp
    For more information about goto visit https://www.gimp.org/

%apprun gimp
    gimp "$@"

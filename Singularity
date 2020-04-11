Bootstrap: docker
From: debian:buster

IncludeCmd: yes

%labels
    AUTHOR icaoberg
    MAINTAINER icaoberg@cmu.edu
    WEBSITE http://www.andrew.cmu.edu/~icaoberg
    VERSION 2.10.8

%post
    apt-get update

####################################################################################
%appinstall gimp
    apt-get install -y gimp     

%apphelp gimp
    For more information about goto visit https://www.gimp.org/

%apprun gimp
    gimp "$@"

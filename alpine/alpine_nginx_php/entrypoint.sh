#!/bin/sh
#***********************************************
#
#      Filename: 1.sh
#      Author:   Mail - xfell96@163.com
#      Create:   2020-01-10 00:06:07
#      Modified: 2020-01-10 00:06:07
#      Note: 
#
#***********************************************
set -e 
supervisord --nodaemon --configuration /etc/supervisor/conf.d/supervisord.conf


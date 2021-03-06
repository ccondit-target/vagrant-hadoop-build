#!/usr/bin/env bash

#
# Base vars
#
SCRIPT_NAME=$(basename $0)
SCRIPT_DIR=$(cd `dirname $0` && pwd)

#
# Usage
#
usage() {
  echo "USAGE: $SCRIPT_NAME <hostname> <package/class> <log level>"
  exit 1
}

#
# Parse args
#
if [ $# -ne 3 ]; then
  usage
fi
HOST="$1"
PKG="$2"
LEVEL="$3"

#
# Variables
#
HADOOP_HOME=/usr/local/hadoop
NN_PORT=50070
NN3_PORT=9870
DN_PORT=50075
DN3_PORT=9864
RM_PORT=8088
NM_PORT=8042

#
# Main
#
echo -e "\n#### Enabling Namenode Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${NN_PORT} $PKG $LEVEL

echo -e "\n#### Enabling Hadoop 3 Namenode Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${NN3_PORT} $PKG $LEVEL

echo -e "\n#### Enabling Datanode Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${DN_PORT} $PKG $LEVEL

echo -e "\n#### Enabling Hadoop 3 Datanode Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${DN3_PORT} $PKG $LEVEL

echo -e "\n#### Enabling Resource Manager Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${RM_PORT} $PKG $LEVEL

echo -e "\n#### Enabling Nodemanager Debug Logging"
$HADOOP_HOME/bin/hadoop daemonlog -setlevel ${HOST}:${NM_PORT} $PKG $LEVEL

exit 0

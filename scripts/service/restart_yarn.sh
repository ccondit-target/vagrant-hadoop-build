#!/bin/bash
SCRIPT_PATH=$(cd `dirname $0` && pwd)
source /etc/profile

# NM
echo "stopping nodemanager"
su - yarn -c "$HADOOP_HOME/bin/yarn --daemon stop nodemanager"

# RM
echo "stopping resourcemanager"
su - yarn -c "$HADOOP_HOME/bin/yarn --daemon stop resourcemanager"

# RM
echo "starting resourcemanager"
su - yarn -c "$HADOOP_HOME/bin/yarn --daemon start resourcemanager"

# NM
echo "starting nodemanager"
su - yarn -c "$HADOOP_HOME/bin/yarn --daemon start nodemanager"

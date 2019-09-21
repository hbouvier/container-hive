#!/bin/sh

if [ ! -d metastore_db ] ; then 
	printf "Creating Hive metastore....."
	schematool -initSchema -dbType derby > /tmp/hive-schema.log 2>&1
	if [ $? ] ; then
		printf "[OK]\n"
	else
		printf "[FAILED]\n"
		/bin/sh
	fi
fi
printf "Staring Hive ...\n"
hive --service hiveserver2 --hiveconf hive.server2.thrift.port=10000 --hiveconf hive.root.logger=ERROR,console


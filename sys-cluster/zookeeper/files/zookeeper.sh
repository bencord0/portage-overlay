#!/bin/sh

for i in /usr/share/zookeeper/lib/*.jar
do
 CLASSPATH="$i":"$CLASSPATH"
done

exec java \
 -Dlog4j.configuration=file:/etc/zookeeper/log4j.properties \
 -Dzookeeper.log.dir=/var/log/zookeeper \
 -Dzookeeper.root.logger=INFO,CONSOLE \
 -cp "$CLASSPATH" \
 org.apache.zookeeper.server.quorum.QuorumPeerMain $@

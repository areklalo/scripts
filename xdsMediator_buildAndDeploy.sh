#!/bin/bash
mvn clean install
docker cp target/mediator-xds-1.0.3-jar-with-dependencies.jar ohie-il_demo:/root/
docker stop ohie-il_demo
docker start ohie-il_demo
BAR='##############################'
for i in {1..30}; do
    echo -ne "\r${BAR:0:$i}"
    sleep 1
done
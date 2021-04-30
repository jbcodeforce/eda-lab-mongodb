
sed 's/KAFKA_USER/'$KAFKA_USER'/g' ./scripts/kafdrop/kafka.properties > ./scripts/kafdrop/output.properties
sed -i '' 's/KAFKA_PASSWORD/'$KAFKA_PASSWORD'/g' ./scripts/kafdrop/output.properties

docker run --rm -p 9000:9000 \
    --name kafdrop \
    -e KAFKA_BROKERCONNECT=$KAFKA_BOOTSTRAP_SERVERS \
    -e KAFKA_PROPERTIES=$(cat ./scripts/kafdrop/output.properties | base64) \
    -e JVM_OPTS="-Xms32M -Xmx64M" \
    -e SERVER_SERVLET_CONTEXTPATH="/" \
    obsidiandynamics/kafdrop
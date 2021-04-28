FROM quay.io/strimzi/kafka:latest-kafka-2.7.0

USER root:root
RUN mkdir -p /opt/connectors && mkdir -p /opt/kafka/logs && chown 1001 /opt/connectors && chown 1001 /opt/kafka/logs
COPY ./camel-mongodb-kafka-connector-0.10.0-SNAPSHOT-package.tar.gz /opt/connectors
RUN tar -xvzf /opt/connectors/camel-mongodb-kafka-connector-0.10.0-SNAPSHOT-package.tar.gz --directory /opt/connectors
RUN rm /opt/connectors/camel-mongodb-kafka-connector-0.10.0-SNAPSHOT-package.tar.gz
COPY ./CamelMongodbSinkConnector.properties config/CamelMongodbSinkConnector.properties
WORKDIR /opt/kafka
EXPOSE 8083
USER 1001


ENTRYPOINT ["./bin/connect-distributed.sh", "config/CamelMongodbSinkConnector.properties"]
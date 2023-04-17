FROM docker.io/envoyproxy/envoy-dev

USER root

RUN apt-get update && \
    apt-get install -y protobuf-compiler curl unzip gettext-base && \
    mkdir /proto-google-common-protos && \
    curl -LO https://repo1.maven.org/maven2/com/google/api/grpc/proto-google-common-protos/2.14.3/proto-google-common-protos-2.14.3.jar && \
    unzip proto-google-common-protos-2.14.3.jar -d /proto-google-common-protos && \
    rm proto-google-common-protos-2.14.3.jar

USER envoy

EXPOSE 51051

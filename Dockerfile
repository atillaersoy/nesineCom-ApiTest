FROM openjdk:jre-slim

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*
ARG KARATE_VERSION=1.0.0
RUN wget -q -O /karate.jar "https://github.com/karatelabs/karate/releases/download/v$KARATE_VERSION/karate-$KARATE_VERSION.jar" && \
    mkdir /tests
WORKDIR /tests
VOLUME /tests
ENTRYPOINT ["java", "-cp", "/karate.jar:.", "com.intuit.karate.Main"]
CMD ["."]


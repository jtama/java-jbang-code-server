FROM linuxserver/code-server:4.96.2

LABEL org.opencontainers.image.source=https://github.com/jtama/java-jbang-code-server
LABEL org.opencontainers.image.description="A code server preconfigured with java and JBang"
LABEL org.opencontainers.image.licenses="Apache 2.0"


ENV JAVA_HOME=/opt/java/openjdk
ENV JBANG_HOME=/jbang/bin

COPY --from=eclipse-temurin:23 $JAVA_HOME $JAVA_HOME
COPY --from=jbangdev/jbang-action:0.119.0 $JBANG_HOME $JBANG_HOME

ENV PATH="${PATH}:${JAVA_HOME}/bin:${JBANG_HOME}"

RUN ["/app/code-server/bin/code-server", "--extensions-dir", "/config/extensions", "--install-extension", "redhat.java"]

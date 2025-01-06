FROM linuxserver/code-server:4.96.2

ENV JAVA_HOME=/opt/java/openjdk
ENV JBANG_HOME=/jbang/bin

COPY --from=eclipse-temurin:23 $JAVA_HOME $JAVA_HOME
COPY --from=jbangdev/jbang-action:0.119.0 $JBANG_HOME $JBANG_HOME

ENV PATH="${PATH}:${JAVA_HOME}/bin:${JBANG_HOME}"

RUN ["/app/code-server/bin/code-server", "--extensions-dir", "/config/extensions", "--install-extension", "redhat.java"]

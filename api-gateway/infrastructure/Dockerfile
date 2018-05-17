FROM openjdk:8-jre-alpine
EXPOSE 8080

WORKDIR /app

ADD target/api-gateway*.war /app/api-gateway.war
RUN chmod -R ugo=rx /app/api-gateway.war

CMD exec java $JAVA_OPTS -jar /app/api-gateway.war

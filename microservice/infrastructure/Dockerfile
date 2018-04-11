FROM openjdk:8-jre-alpine
EXPOSE 8080

WORKDIR /app

ADD target.tgz /app/

RUN mv microservice*.war microservice.war

RUN chmod -R ugo=rx /app/microservice.war

CMD exec java $JAVA_OPTS -jar /app/microservice.war

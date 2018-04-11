FROM openjdk:8-jre-alpine
EXPOSE 8080

WORKDIR /app

ADD target.tgz /app/

RUN mv uaa*.war uaa.war

RUN chmod -R ugo=rx /app/uaa.war

CMD exec java $JAVA_OPTS -jar /app/uaa.war

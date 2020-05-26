#Dockerfile contains all the commands with which
#Docker can build images reading the instructions.

FROM openjdk:11

#ADD ./target/spring-boot-docker-2.2.6.RELEASE.jar /usr/src/spring-boot-docker-2.2.6.RELEASE.jar

WORKDIR usr/src
COPY ./pom.xml ./pom.xml
RUN mvnw dependency:go-offline -B
COPY ./src ./src
RUN mvn package && cp target/spring-boot-docker-1.0.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar", "spring-boot-docker-1.0.0-SNAPSHOT.jar"]
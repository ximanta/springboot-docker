FROM openjdk:11
WORKDIR usr/src
COPY ./pom.xml ./pom.xml
RUN mvnw dependency:go-offline -B
COPY ./src ./src
RUN mvnw package && cp target/spring-boot-docker-1.0.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar", "spring-boot-docker-1.0.0-SNAPSHOT.jar"]
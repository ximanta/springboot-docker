FROM openjdk:11
WORKDIR usr/src
COPY ./pom.xml ./pom.xml
COPY mvnw .
COPY .mvn .mvn
COPY ./src ./src
RUN ["chmod", "+x", "mvnw"]
RUN ./mvnw dependency:go-offline -B

RUN ./mvnw clean package && cp target/spring-boot-docker-1.0.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar", "spring-boot-docker-1.0.0-SNAPSHOT.jar"]

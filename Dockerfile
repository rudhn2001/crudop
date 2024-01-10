# building stage 1


FROM maven:3.8.4-openjdk-17 AS build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests


#final stage 2


FROM openjdk:17-jdk-alpine

COPY --from=build /target/crudop-0.0.1-SNAPSHOT.jar /

ENTRYPOINT [ "java", "-jar", "/crudop-0.0.1-SNAPSHOT.jar" ]
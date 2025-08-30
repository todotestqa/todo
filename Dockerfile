FROM openjdk:17-jdk-slim

# Copy any jar from target/ and rename it to app.jar
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]

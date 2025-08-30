# Use Maven + JDK to build the project
FROM maven:3.9.0-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy source and pom
COPY pom.xml .
COPY src ./src

# Build the jar
RUN mvn clean package -DskipTests

# Use a slim JDK to run the app
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy the jar from the builder
COPY --from=builder /app/target/karate-todo-1.0-SNAPSHOT.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar", "."]

# Build stage
FROM maven:3.8-openjdk-11-slim AS build
WORKDIR /app
COPY pom.xml .
# Download dependencies first (cached layer)
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:11-jre-slim
WORKDIR /app

# Create logs directory and set permissions
RUN mkdir -p /app/logs && \
    chmod 777 /app/logs

# Add non-root user
RUN groupadd -r spring && useradd -r -g spring spring
USER spring:spring

# Copy jar from build stage
COPY --from=build /app/target/*.jar app.jar

# Expose port
EXPOSE 8080

# Set entry point
ENTRYPOINT ["java", \
            "-jar", \
            "app.jar"]

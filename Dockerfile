# Step 1: Use OpenJDK base image
FROM eclipse-temurin:17-jdk

# Step 2: Set working directory
WORKDIR /app

# Step 3: Copy Maven build files
COPY pom.xml .
COPY src ./src

# Step 4: Package the application
RUN ./mvnw clean package -DskipTests || mvn clean package -DskipTests

# Step 5: Expose port (matches application.yml)
EXPOSE 8087

# Step 6: Run the Spring Boot JAR
CMD ["java", "-jar", "target/quote-service-0.0.1-SNAPSHOT.jar"]

# =========================================
# 🏗️ Stage 1: Build the application
# =========================================
FROM eclipse-temurin:17-jdk AS build

WORKDIR /app
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .
COPY src ./src
RUN chmod +x mvnw
RUN ./mvnw clean package -DskipTests

# =========================================
# 🚀 Stage 2: Create lightweight runtime image
# =========================================
FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/quote-service-0.0.1-SNAPSHOT.jar app.jar
ENV PORT=8087
EXPOSE 8087
ENTRYPOINT ["java", "-jar", "app.jar"]

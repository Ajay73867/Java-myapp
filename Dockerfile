
# 1️⃣ Use OpenJDK base image
FROM openjdk:17-jdk

# 2️⃣ Set working directory inside the container
WORKDIR /app

# 3️⃣ Copy the JAR file from the local machine to the container
COPY target/Java-myapp-1.0-SNAPSHOT.jar app.jar

# 4️⃣ Run the Java application when the container starts
CMD ["java", "-jar", "app.jar"]

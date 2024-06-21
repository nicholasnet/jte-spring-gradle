FROM amazoncorretto:21

WORKDIR /app

# You will need to execute following commands first if you are builing Docker image locally
# ./mvnw clean -s .mvn/wrapper/settings.xml
# ./mvnw package -s .mvn/wrapper/settings.xml
# mkdir -p target/extracted
# java -Djarmode=tools -jar target/*.jar extract --layers --launcher --destination target/extracted
COPY build/target/dependencies ./
COPY build/target/spring-boot-loader/ ./
COPY build/target/snapshot-dependencies/ ./
COPY build/target/application/ ./
COPY jte-classes ./jte-classes

# Exposes port 8080 so the app can be accessed externally
EXPOSE 8080

# Runs java, sets JVM parameters, sets various elastic APM properties, and runs the application jar file
ENTRYPOINT ["java", \
  "-Xmx1024m", \
  "org.springframework.boot.loader.launch.JarLauncher" \
]
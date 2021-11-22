FROM openjdk:17-oraclelinux8

WORKDIR /app

COPY ./target/kt-cloud-iam-web-1.0.0-SNAPSHOT.jar /app

EXPOSE 8080

CMD ["java", "-jar", "/app/kt-cloud-iam-web-1.0.0-SNAPSHOT.jar"]
#ENTRYPOINT "echo $PATH"
FROM openjdk:8

COPY ./target/kt-iam-web-1.0.0-SNAPSHOT.jar /app

WORKDIR /app

RUN ['java ', '-jar', 'kt-iam-web-1.0.0-SNAPSHOT.jar']

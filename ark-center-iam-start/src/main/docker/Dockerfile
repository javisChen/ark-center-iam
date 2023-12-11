FROM openjdk:17-oraclelinux8
WORKDIR /app
COPY ark-center-iam.jar /app
EXPOSE 8080
ENV SYS_OPT=""
ENTRYPOINT java $SYS_OPT -jar /app/ark-center-iam.jar
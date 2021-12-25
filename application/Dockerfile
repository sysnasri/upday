FROM openjdk:11-jre
RUN adduser app --disabled-password --gecos ''
WORKDIR /app
COPY ./application/helloworld.jar /app/helloworld.jar
EXPOSE 8080
CMD ["java", "-jar", "helloworld.jar"]

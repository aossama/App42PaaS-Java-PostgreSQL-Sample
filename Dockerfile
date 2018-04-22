FROM maven:latest as build
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN mvn clean install

FROM tomcat:latest
COPY --from=build /usr/src/app/target/App42PaaS-Java-PostgreSQL-Sample-0.0.1-SNAPSHOT.war webapps/app.war

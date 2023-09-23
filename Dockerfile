FROM 3-amazoncorretto-17 AS builder
COPY . /spc
RUN cd /spc && mvn package

FROM gcr.io/distroless/java17-debian11
LABEL NAME="Sprint Pet Clinic"
LABEL OWNER="Karthitech.com"
ENV VAUL_NAME="VAUL_NAME_SPACE"
COPY --from=builder /spctarget/spring-petclinic-3.1.0-SNAPSHOT.jar /app/spring-petclinic-3.1.0-SNAPSHOT.jar
WORKDIR /app
CMD ["spring-petclinic-3.1.0-SNAPSHOT.jar"]

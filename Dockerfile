FROM swaggerapi/swagger-ui:latest

COPY openapi.yaml /swagger.yaml

ENV SWAGGER_JSON=/swagger.yaml
ENV PORT=8080

EXPOSE 8080
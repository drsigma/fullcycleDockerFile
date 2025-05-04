# Etapa 1: build
FROM golang:1.22 AS builder

WORKDIR /app
COPY . .

RUN go mod init hello 
RUN go build -o hello .

FROM scratch

COPY --from=builder /app/hello /hello

CMD ["/hello"]

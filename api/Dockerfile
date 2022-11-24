FROM golang:1.19-alpine

WORKDIR /app

COPY go.mod ./

COPY go.sum ./

RUN go mod download

COPY ./ ./

RUN go build -o build/mastermind-api

EXPOSE 8080

CMD [ "./build/mastermind-api" ]
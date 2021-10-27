# This docker file not include for postgre database that use in this project

FROM golang:alpine

RUN apk update && apk add --no-cache gcc libc-dev

WORKDIR /work

COPY go.mod go.sum ./

RUN go mod tidy

ADD . .

RUN go build -o main .

WORKDIR /

RUN rm -r /work

EXPOSE 8080

CMD /main
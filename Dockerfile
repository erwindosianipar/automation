# docker build -t [repository/application:tag] [path to file]
# docker run -d -p [port]:[port] [repository/application:tag]

FROM golang:alpine

RUN apk update && apk add --no-cache gcc libc-dev

WORKDIR /work

COPY go.mod go.sum ./

RUN go mod tidy

ADD . .

RUN go build -o /bin/automation .

WORKDIR /

RUN rm -r /work

EXPOSE 8080

CMD /bin/automation

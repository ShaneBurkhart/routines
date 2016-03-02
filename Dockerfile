FROM golang

ADD . /go/src/github.com/ShaneBurkhart/routines

RUN go get github.com/gorilla/mux

RUN go install github.com/ShaneBurkhart/routines

EXPOSE 3000

ENTRYPOINT /go/bin/routines

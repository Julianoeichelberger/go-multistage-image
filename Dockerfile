FROM golang:alpine as builder

RUN apk update
WORKDIR $GOPATH/go/bin/app 
COPY . .

RUN go env -w GO111MODULE=off 

RUN go build -o /go/bin/app

FROM scratch

COPY --from=builder /go/bin/app /go/bin/app

ENTRYPOINT ["/go/bin/app"]
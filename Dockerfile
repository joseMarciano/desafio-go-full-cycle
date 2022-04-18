FROM golang:stretch as stage_one

WORKDIR /app/

COPY ./hello.go /app

RUN go build hello.go

FROM scratch

WORKDIR /main/src
COPY  --from=stage_one /app/hello /main/src

CMD ["./hello"]


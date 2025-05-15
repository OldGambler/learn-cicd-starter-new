FROM golang:1.19 as builder
WORKDIR /app
COPY . .
RUN go build -o app cmd/main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app .
CMD ["./app"]

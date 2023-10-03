FROM golang:latest AS builder
WORKDIR /app
COPY main.go go.mod ./
RUN CGO_ENABLED=0 GOOS=linux go build -o app .

FROM scratch
WORKDIR /
COPY --from=builder /app/app /app/app
ENTRYPOINT ["/app/app"]
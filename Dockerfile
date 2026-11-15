
FROM golang:1.27-alpine AS builder

WORKDIR /usr/src/app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 \
    go build \
    -trimpath \
    -buildvcs=false \
    -ldflags="-w -s -buildid=" \
    -o /app .

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT ["/app"]

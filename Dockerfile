FROM golang:alpine AS builder
WORKDIR /build
COPY . .
RUN CGO_ENABLED=0 go build -ldflags="-w -s" -o /chipper .

FROM scratch
COPY --from=builder /chipper /chipper

ENTRYPOINT ["/chipper"]
CMD ["-s"]
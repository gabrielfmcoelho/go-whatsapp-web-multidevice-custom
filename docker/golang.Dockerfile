############################
# STEP 1 build executable binary
############################
FROM golang:1.23-alpine3.20 AS builder
RUN apk update && apk add --no-cache gcc musl-dev gcompat ffmpeg
WORKDIR /whatsapp
COPY ./src .

# Fetch dependencies.
RUN go mod download
# Build the binary.
RUN go build -ldflags='-s -w -extldflags "-static"' -o /app/whatsapp

#############################
## STEP 2 build a smaller image
#############################
FROM scratch AS runner
#RUN apk update && apk add --no-cache ffmpeg
WORKDIR /app
# Copy compiled from builder.
COPY --from=builder /app/whatsapp /app/whatsapp
# Run the binary.
ENTRYPOINT ["/app/whatsapp"]
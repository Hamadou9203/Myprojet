FROM golang AS worker

WORKDIR /app

COPY . .

RUN go mod tidy

RUN go build -o workerapp .

FROM scratch

COPY --from=worker /app/workerapp /workerapp

EXPOSE 8080

CMD ["workerapp"]
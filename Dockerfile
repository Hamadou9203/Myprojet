FROM golang AS worker

WORKDIR /app

COPY Go/* .

#telecharger les dependances 
RUN go mod tidy

RUN go build -o workerapp .

FROM scratch

COPY --from=worker /app/workerapp /workerapp

EXPOSE 8080

CMD ["/workerapp"]
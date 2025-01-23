# Étape 1 : Construction de l'application Go
FROM golang:1.23 AS builder

LABEL maintainer="Hamadou"

WORKDIR /app

# Copier tous les fichiers Go dans l'image
COPY . .

# Télécharger les dépendances Go
RUN go mod tidy

# Construire l'application
#RUN go build -o workerapp .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o workerapp .

# Vérifier que l'exécutable est bien présent
RUN ls -l /app

RUN chmod +x /app/workerapp

# Étape 2 : Image minimale pour l'exécution de l'application
FROM scratch

# Copier l'exécutable depuis l'étape de construction
COPY --from=builder /app/workerapp /workerapp

#RUN ls -l /workerapp
#RUN file /workerapp  # Vérifie le type du fichier
# Exposer le port 8080 (si ton app utilise ce port)
EXPOSE 8080

# Démarrer l'application
CMD ["/workerapp"]



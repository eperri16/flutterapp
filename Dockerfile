# Utiliser une image Flutter de base
FROM cirrusci/flutter:stable

# Définir le répertoire de travail
WORKDIR /app

# Copier les fichiers de ton projet dans le conteneur
COPY . /app

# Créer un répertoire pour le cache Flutter et ajuster les permissions
RUN mkdir -p /app/flutter_cache && chmod -R 777 /app/flutter_cache

# Définir une variable d'environnement pour spécifier le répertoire de cache
ENV FLUTTER_STORAGE_BASE_URL=https://storage.googleapis.com/download.flutter.io
ENV PUB_CACHE=/app/flutter_cache

# Installer les dépendances Flutter
RUN flutter pub get

# Construire l'application web
RUN flutter build web

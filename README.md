# Hermes + Ollama

Prérequis : une VM Linux avec Podman (+ podman-compose) **ou** Docker (+ Compose),
avec deux cartes réseau : une NAT (Internet) et une host-only (labo).

```
podman-compose up -d --build     # ou : docker compose up -d --build
```

Au premier lancement, un conteneur jetable (`ollama-pull`) télécharge le modèle (~5 Go) puis s'arrête ; Ollama lui-même n'a jamais accès à Internet :
`podman logs -f ollama-pull` pour suivre la progression.

Autre modèle : `OLLAMA_MODEL=llama3.1:8b podman-compose up -d --build`

Hermes utilise directement le réseau de la VM (Internet + labo).
Arrêter : `podman-compose down` (ajouter `-v` pour supprimer aussi les données).

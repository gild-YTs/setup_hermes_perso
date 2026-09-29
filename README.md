# Hermes + Ollama

Prérequis : une VM Linux avec Podman (+ podman-compose) **ou** Docker (+ Compose),
avec deux cartes réseau : une NAT (Internet) et une host-only (labo).

```
podman-compose up -d --build     # ou : docker compose up -d --build
```

Au premier lancement, un conteneur jetable (`ollama-pull`) télécharge le modèle (~2 Go) puis s'arrête ; Ollama lui-même n'a jamais accès à Internet :
`podman logs -f ollama-pull` pour suivre la progression.

Autre modèle : `OLLAMA_MODEL=llama3.1:8b podman-compose up -d --build`

Hermes utilise directement le réseau de la VM (Internet + labo).
Arrêter : `podman-compose down` (ajouter `-v` pour supprimer aussi les données).

## ⚠️ Dépannage & Gestion du Contexte Modèle (Qwen 2.5 7B) EXEMPLE

Hermes Agent impose une fenêtre de contexte minimale de **64 000 tokens**. Par défaut, le modèle `qwen2.5:7b` standard d'Ollama est configuré à 32k, ce qui déclenchera une erreur au démarrage de l'agent.

Un `Modelfile` est déjà inclus à la racine de ce dépôt pour étendre automatiquement le contexte à 64k sans avoir à retélécharger de nouveaux poids.

### Procédure :

1. **Générer le modèle personnalisé avec 64k de contexte dans Ollama :**
   ```bash
   podman exec -it ollama-brain ollama create qwen2.5:7b-64k -f /Modelfile
   
2 Configurer Hermes pour utiliser ce modèle :
   podman exec -it hermes-agent hermes model
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
   
2. Configurer Hermes pour utiliser ce modèle :
   ```bash
   podman exec -it hermes-agent hermes model












   tkt
   {
    "[php]": {
        "editor.defaultFormatter": "junstyle.php-cs-fixer"
    },
    "php-cs-fixer.executablePath": "E:\\programmation\\php8.4.7\\php-cs-fixer.phar",
    "editor.minimap.autohide": "mouseover",
    "editor.linkedEditing": true,
    "workbench.tree.indent": 15,
    "editor.fontFamily": "JetBrains Mono",
    "editor.fontLigatures": true,
    "workbench.colorCustomizations": {
        "[Tokyo Night]": {
            "editor.selectionBackground": "default",
            "editor.selectionHighlightBackground": "default",
            "editorBracketHighlight.foreground1": "#ffd900",
            "editorBracketHighlight.foreground2": "#da70d6",
            "editorBracketHighlight.foreground3": "#179fff",
            "editorBracketHighlight.foreground4": "#11ff00",
            "editorBracketHighlight.foreground5": "#22ffdee8",
            "editorBracketHighlight.foreground6": "#be07f6",
        }
    },
    "java.configuration.runtimes": [
        {
            "name": "JavaSE-23",
            "path": "E:/programmation/jdk-23.0.2"
        }
    ],
    "java.jdt.ls.java.home": "E:/programmation/jdk-23.0.2",
    "java.jdt.ls.vmargs": "--module-path E:/programmation/javafx-sdk-24/lib --add-modules javafx.controls,javafx.fxml",
    "java.debug.settings.stepping.skipClasses": [],
    "liveServer.settings.donotVerifyTags": true,
    "java.imports.gradle.wrapper.checksums": [
        {
            "sha256": "7d3a4ac4de1c32b59bc6a4eb8ecb8e612ccd0cf1ae1e99f66902da64df296172",
            "allowed": false
        }
    ],
    "java.debug.settings.vmArgs": "--module-path=E:/programmation/javafx-sdk-24/lib --add-modules javafx.controls,javafx.fxml",
    "liveServer.settings.donotShowInfoMsg": true,
    "powermode.enabled": true,
    "powermode.presets": "particles",
    "powermode.shake.enabled": false,
    "powermode.combo.counterEnabled": "hide",
    "powermode.combo.location": "off",
    "editor.formatOnSave": true,
    "editor.autoIndent": "full",
   \\Python313\\python.exe",
    "editor.autoIndentOnPaste": true,
    "editor.wordBasedSuggestions": "allDocuments",
    "editor.quickSuggestions": {
        "other": "on",
        "comments": "off",
        "strings": "on"
    },
    "php.suggest.basic": true,
    "php.validate.enable": true,
    "php-cs-fixer.formatHtml": true,
    "php.format.rules.alignConsecutiveAssignments": true,
    "editor.inlineSuggest.enabled": false,
    "files.autoSave": "afterDelay",
    "editor.unicodeHighlight.nonBasicASCII": false,
    "editor.tokenColorCustomizations": {
        "comments": "#ff7ab8"
    },
    "window.menuBarVisibility": "compact",
    "workbench.activityBar.location": "top",
    "window.commandCenter": false,
    "workbench.sideBar.location": "right",
    "vscode-pets.theme": "winter",
    "workbench.colorTheme": "Tokyo Night",
    "workbench.editor.enablePreview": false,
    "editor.unicodeHighlight.allowedCharacters": {
        " ": true
    },
    "git.ignoreMissingGitWarning": true
}

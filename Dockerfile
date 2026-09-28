FROM docker.io/library/python:3.11-slim

# Dépendances système (curl + ca-certificates : requis par la plupart des scripts d'install)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    ca-certificates \
    build-essential \
    supervisor \
    && rm -rf /var/lib/apt/lists/*

# Version d'Hermes à installer : mets un tag ou un commit pour un build reproductible
# (ex: --build-arg HERMES_REF=v1.2.3). "main" = dernière version, non figée.
ARG HERMES_REF=main

# Pas de "|| true" : si l'install échoue, le build doit échouer.
RUN git clone https://github.com/NousResearch/hermes-agent.git /opt/hermes-src \
    && cd /opt/hermes-src \
    && git checkout "${HERMES_REF}" \
    && chmod +x ./scripts/install.sh \
    && ./scripts/install.sh

# Le binaire "hermes" est souvent installé dans ~/.local/bin
ENV PATH="/root/.local/bin:/opt/hermes-src/venv/bin:${PATH}"

# Vérifie au build que la commande existe bien
RUN command -v hermes

COPY supervisord.conf /etc/supervisord.conf

EXPOSE 8000
VOLUME ["/root/.hermes"]

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

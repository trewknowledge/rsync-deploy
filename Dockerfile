FROM ubuntu:22.04

# Install rsync and OpenSSH client
RUN apt-get update && apt-get install -y \
    rsync \
    openssh-client \
 && rm -rf /var/lib/apt/lists/*

# Allow older ssh-rsa keys (if needed)
RUN echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/ssh_config

# Labels
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "com.github.actions.description"="Deploy to a remote server using rsync over ssh"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="upload"

LABEL "repository"="https://github.com/trewknowledge/rsync-deploy"
LABEL "homepage"="https://github.com/trewknowledge/rsync-deploy"
LABEL "maintainer"="Trew Knowledge <info@trewknowledge.com>"

# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

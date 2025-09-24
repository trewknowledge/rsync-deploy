FROM quay.io/alpine/alpine:3.18.4

RUN apk add --no-cache rsync openssh
RUN echo "PubkeyAcceptedKeyTypes +ssh-rsa" >> /etc/ssh/ssh_config

# Label
LABEL "com.github.actions.name"="Deploy with rsync"
LABEL "com.github.actions.description"="Deploy to a remote server using rsync over ssh"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.icon"="upload"

LABEL "repository"="https://github.com/trewknowledge/rsync-deploy"
LABEL "homepage"="https://github.com/trewknowledge/rsync-deploy"
LABEL "maintainer"="Trew Knowledge <info@trewknowledge.com>"

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

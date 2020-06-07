FROM hashicorp/packer:1.5.6

LABEL "com.github.actions.name" = "Packer build"
LABEL "com.github.actions.description" = "Run packer build on a template file"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="blue"

LABEL "repository" = "https://github.com/ericdahl/packer-build-action"
LABEL "homepage" = "https://github.com/ericdahl/packer-build-action"
LABEL "maintainer" = "Eric Dahl <ericdahl@gmail.com>"

RUN apk add ansible

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

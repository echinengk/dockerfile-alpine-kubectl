# ECR: 771893074192.dkr.ecr.sa-east-1.amazonaws.com/alpine-kubectl
FROM alpine:3.10

# Install kubectl
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
	&& mv kubectl /usr/local/bin \
	&& chmod +x /usr/local/bin/kubectl


ENV HOME=/config

RUN set -x && \
    apk add --no-cache curl ca-certificates && \
    chmod +x /usr/local/bin/kubectl && \
    \
    # Create non-root user (with a randomly chosen UID/GUI).
    adduser kubectl -Du 2342 -h /config && \
    \
    # Basic check it works.
    kubectl version --client

USER kubectl

ENTRYPOINT []
CMD []

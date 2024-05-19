FROM docker.io/debian:bookworm-20240423-slim

LABEL org.opencontainers.image.description="SpamAssassin container for GitHub Action spamassassin"
LABEL org.opencontainers.image.source=https://github.com/hspaans/spamassassin-rules

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
# hadolint ignore=DL3008
RUN apt update \
    && apt -y install --no-install-recommends spamassassin \
    # Clean up
    && apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod 555 /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
FROM alpine:3.16

# Install packages
RUN apk add openssh && \
    # Create ~/.ssh directory and ssh config
    mkdir -p /root/.ssh && chmod 700 /root/.ssh && echo -e "Host *\n\tStrictHostKeyChecking no\n" > ~/.ssh/config && \
    # Configure nameserver
    echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Copy docker entrypoint
COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh

# Permissions
RUN chmod +x /docker-entrypoint.sh

# Run entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
FROM alpine:3.16

# Install packages
RUN apk add openssh && \
    # Create ~/.ssh directory and ssh config
    mkdir -p /root/.ssh && chmod 700 /root/.ssh && \
    # Add some ssh server configurations
    echo "TCPKeepAlive yes" >> /etc/ssh/sshd_config && \
    echo "ClientAliveInterval 30" >> /etc/ssh/sshd_config && \
    echo "ClientAliveCountMax 3" >> /etc/ssh/sshd_config && \
    # Configure nameserver
    echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Copy ssh-config
COPY ./docker/ssh-config /root/.ssh/config

# Copy docker entrypoint
COPY ./docker/docker-entrypoint.sh /docker-entrypoint.sh

# Permissions
RUN chmod +x /docker-entrypoint.sh

# Run entrypoint
ENTRYPOINT ["/docker-entrypoint.sh"]
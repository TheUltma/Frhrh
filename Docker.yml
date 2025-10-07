# Base image
FROM node:20-alpine

# Install MeshCentral
RUN npm install -g meshcentral

# Create directories for config and data
RUN mkdir -p /meshcentral/meshcentral-data /meshcentral/meshcentral-files
WORKDIR /meshcentral

# Copy in your optional config file
# (Koyeb will override env vars anyway)
COPY config.json /meshcentral/meshcentral-data/config.json

# Expose HTTP port
EXPOSE 80

# Default environment values
ENV HOSTNAME=localhost \
    REVERSE_PROXY=true \
    WEBRTC=true \
    ALLOW_NEW_ACCOUNTS=true \
    TLS_OFFLOAD=true

# Run MeshCentral
CMD ["meshcentral"]

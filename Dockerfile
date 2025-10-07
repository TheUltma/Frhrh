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

FROM node:18-alpine
WORKDIR /opt/meshcentral
RUN npm install meshcentral
VOLUME /opt/meshcentral/data
EXPOSE 8080
ENV NODE_ENV=production
CMD ["node", "node_modules/meshcentral"]

# Run MeshCentral
CMD ["meshcentral"]

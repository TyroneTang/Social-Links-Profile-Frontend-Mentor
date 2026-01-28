FROM ubuntu:24.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
# Define where fnm will be installed
ENV FNM_DIR="/root/fnm"

RUN mkdir -p /root
RUN mkdir -p /root/fnm
RUN mkdir -p /root/workspace

WORKDIR /root

RUN apt-get update && \
    apt-get install -y \
    curl \
    git \
    unzip && \
    rm -rf /var/lib/apt/lists/*

# 1. Create the directory (though the installer often does this, it's safe to keep)
RUN mkdir -p $FNM_DIR

# 1. Use '-s --' to pass arguments to the script, not bash
# 2. Add --skip-shell to prevent it from trying to modify .bashrc interactively
RUN curl -fsSL https://fnm.vercel.app/install | bash -s -- --install-dir $FNM_DIR --skip-shell

# CRITICAL: Manually add fnm to the PATH so subsequent commands can use it
ENV PATH="$FNM_DIR:$PATH"

# 1. Install Node 24
# 2. Set it as the default alias (Critical step: this creates a stable path we can reference)
RUN fnm install 24 && fnm default 24

# 3. Add the 'default' alias bin directory to the PATH
# This ensures 'node', 'npm', and 'corepack' are found in all future commands
ENV PATH="$FNM_DIR/aliases/default/bin:$PATH"

# Verify Node.js
RUN node -v

# Enable Yarn via Corepack
# Note: Corepack is included with Node.js
RUN corepack enable

# Verify Yarn
RUN yarn -v
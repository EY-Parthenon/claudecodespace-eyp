FROM mcr.microsoft.com/devcontainers/base:ubuntu-22.04

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    build-essential \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# Install Claude Code
# Check https://docs.anthropic.com/en/docs/claude-code for the latest installation method
RUN curl -fsSL https://claude.ai/install.sh | bash || \
    (echo "Please check https://docs.anthropic.com/en/docs/claude-code for installation instructions" && \
     echo "You may need to install Claude Code manually after container starts")

# Install Python packages for Vertex AI
RUN pip install --no-cache-dir \
    google-cloud-aiplatform \
    google-cloud-storage \
    anthropic \
    vertexai \
    pandas \
    numpy \
    python-dotenv

# Install Node packages globally
RUN npm install -g \
    @anthropic-ai/sdk \
    @google-cloud/aiplatform \
    typescript \
    ts-node \
    nodemon

# Create workspace directory
WORKDIR /workspace

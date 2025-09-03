#!/bin/bash
set -e

echo "🚀 Setting up development environment..."

# Source environment variables for Claude Code and Vertex AI
echo "🔧 Setting up environment variables..."
if [ -f ".devcontainer/fix-env-vars.sh" ]; then
    source .devcontainer/fix-env-vars.sh
    echo "✅ Environment variables loaded from fix-env-vars.sh"
    
    # Add to .bashrc for persistence across shell sessions
    if ! grep -q "fix-env-vars.sh" ~/.bashrc; then
        echo "" >> ~/.bashrc
        echo "# Source Claude Code and Vertex AI environment variables" >> ~/.bashrc
        echo "if [ -f \"/workspaces/claudecodespace-eyp/.devcontainer/fix-env-vars.sh\" ]; then" >> ~/.bashrc
        echo "    source /workspaces/claudecodespace-eyp/.devcontainer/fix-env-vars.sh" >> ~/.bashrc
        echo "fi" >> ~/.bashrc
        echo "✅ Added environment variable sourcing to .bashrc"
    fi
else
    echo "⚠️ fix-env-vars.sh not found, skipping environment variable setup"
fi

# Install project-specific Node dependencies if package.json exists
if [ -f "package.json" ]; then
    echo "📦 Installing Node dependencies..."
    npm install
fi

# Install project-specific Python dependencies if requirements.txt exists
if [ -f "requirements.txt" ]; then
    echo "🐍 Installing Python dependencies..."
    pip install -r requirements.txt
fi

# Setup Google Cloud authentication
echo "☁️ Setting up Google Cloud authentication..."
if [ ! -f "$HOME/.config/gcloud/application_default_credentials.json" ]; then
    echo "Please run 'gcloud auth application-default login' to authenticate with Google Cloud"
fi

# Verify Claude Code installation
if command -v claude &> /dev/null; then
    echo "✅ Claude Code is installed: $(claude --version)"
else
    echo "⚠️ Claude Code not found. Installing via npm..."
    npm install -g @anthropic-ai/claude-cli
    if command -v claude &> /dev/null; then
        echo "✅ Claude Code installed successfully: $(claude --version)"
    else
        echo "❌ Failed to install Claude Code. Please install manually:"
        echo "Visit: https://docs.anthropic.com/en/docs/claude-code"
    fi
fi

echo "✨ Development environment ready!"

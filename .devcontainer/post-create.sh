#!/bin/bash
set -e

echo "🚀 Setting up development environment..."

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
if command -v claude-code &> /dev/null; then
    echo "✅ Claude Code is installed: $(claude-code --version)"
else
    echo "⚠️ Claude Code not found. Please install it manually:"
    echo "Visit: https://docs.anthropic.com/en/docs/claude-code"
fi

echo "✨ Development environment ready!"

# Development Environment Setup

## Prerequisites
1. Docker Desktop installed
2. VS Code with Dev Containers extension
3. Google Cloud CLI installed on host machine
4. Anthropic API key

## Initial Setup

1. **Clone the repository**
2. **Copy `.env.example` to `.env` and fill in your values**
3. **Authenticate with Google Cloud on your host machine:**
   ```bash
   gcloud auth application-default login
   gcloud config set project gp-ct-sbox-tas-ssg2

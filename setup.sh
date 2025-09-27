#!/bin/bash

echo "🚀 Setting up your data analysis project..."

# Check if UV is installed
if ! command -v uv &> /dev/null; then
    echo "📦 Installing UV package manager..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
fi

# Sync dependencies with UV
echo "📚 Installing dependencies..."
uv sync

echo "✅ Setup complete!"
echo ""
echo "To activate the virtual environment, run:"
echo "  source .venv/bin/activate"
echo ""
echo "To run Jupyter, use:"
echo "  uv run jupyter notebook"
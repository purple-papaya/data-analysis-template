#!/bin/bash

echo "🚀 Setting up your data analysis project..."
echo ""

# Check if UV is installed
if ! command -v uv &> /dev/null; then
    echo "📦 Installing UV package manager..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$PATH"
    echo "✅ UV installed successfully!"
else
    echo "✅ UV is already installed"
fi

echo ""
echo "📚 Installing dependencies (including Polars and Marimo)..."
uv sync --extra all

echo ""
echo "✅ Setup complete!"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "🎯 Quick Start Commands:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "  Activate environment:"
echo "    source .venv/bin/activate"
echo ""
echo "  Start Jupyter (traditional):"
echo "    uv run jupyter notebook"
echo ""
echo "  Start Marimo (reactive, modern):"
echo "    uv run marimo edit"
echo ""
echo "  Create new Marimo notebook:"
echo "    uv run marimo new notebooks/my-analysis.py"
echo ""
echo "  Run analysis:"
echo "    uv run python src/main.py"
echo ""
echo "  Run tests:"
echo "    uv run pytest"
echo ""
echo "  Or use Make commands:"
echo "    make help       # Show all commands"
echo "    make notebook   # Start Jupyter"
echo "    make marimo     # Start Marimo"
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "📦 Installed tools:"
echo "  • UV      - Fast package manager"
echo "  • Pandas  - Traditional DataFrames"
echo "  • Polars  - High-performance DataFrames (10-30x faster)"
echo "  • Marimo  - Reactive notebooks (auto-updating)"
echo "  • Jupyter - Traditional notebooks"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
.PHONY: help setup install install-dev clean test lint format run notebook marimo marimo-new marimo-run lock update

help:  ## Show this help message
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo "📋 Available Make Commands:"
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-18s\033[0m %s\n", $$1, $$2}'
	@echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
	@echo ""
	@echo "Examples:"
	@echo "  make install                    # Install dependencies"
	@echo "  make marimo-new name=analysis   # Create new Marimo notebook"
	@echo "  make marimo-run name=analysis   # Run Marimo as web app"
	@echo ""

setup:  ## Install UV package manager
	@echo "📦 Installing UV package manager..."
	@curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "✅ UV installed! Restart your shell or run: source $$HOME/.cargo/env"

install:  ## Install project dependencies
	@echo "📚 Installing dependencies with UV..."
	@uv sync
	@echo "✅ Dependencies installed!"

install-dev:  ## Install with dev dependencies
	@echo "📚 Installing dependencies (including dev tools)..."
	@uv sync --extra dev
	@echo "✅ All dependencies installed!"

clean:  ## Remove build artifacts and cache
	@echo "🧹 Cleaning build artifacts..."
	@find . -type d -name "__pycache__" -exec rm -rf {} + 2>/dev/null || true
	@find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} + 2>/dev/null || true
	@find . -type f -name "*.pyc" -delete 2>/dev/null || true
	@rm -rf .pytest_cache .coverage htmlcov/ dist/ build/ *.egg-info 2>/dev/null || true
	@echo "✅ Cleaned!"

test:  ## Run tests with pytest
	@echo "🧪 Running tests..."
	@uv run pytest tests/ -v

lint:  ## Check code quality with ruff
	@echo "🔍 Linting code..."
	@uv run ruff check src/

format:  ## Format code with ruff
	@echo "✨ Formatting code..."
	@uv run ruff format src/ tests/
	@echo "✅ Code formatted!"

run:  ## Run main analysis script
	@echo "🚀 Running analysis..."
	@uv run python src/main.py

notebook:  ## Start Jupyter notebook server
	@echo "📓 Starting Jupyter notebook..."
	@uv run jupyter notebook

marimo:  ## Start Marimo notebook editor
	@echo "🎨 Starting Marimo editor..."
	@uv run marimo edit

marimo-new:  ## Create new Marimo notebook (usage: make marimo-new name=mynotebook)
	@if [ -z "$(name)" ]; then \
		echo "❌ Error: Please provide a notebook name"; \
		echo "Usage: make marimo-new name=your-notebook-name"; \
		echo "Example: make marimo-new name=01-jd-exploration"; \
		exit 1; \
	fi
	@echo "📝 Creating new Marimo notebook: notebooks/$(name).py"
	@uv run marimo new notebooks/$(name).py
	@echo "✅ Notebook created! Edit with: make marimo"

marimo-run:  ## Run Marimo notebook as web app (usage: make marimo-run name=mynotebook)
	@if [ -z "$(name)" ]; then \
		echo "❌ Error: Please provide a notebook name"; \
		echo "Usage: make marimo-run name=your-notebook-name"; \
		echo "Example: make marimo-run name=01-jd-exploration"; \
		exit 1; \
	fi
	@echo "🚀 Running Marimo notebook as web app: notebooks/$(name).py"
	@uv run marimo run notebooks/$(name).py

lock:  ## Update dependency lock file
	@echo "🔒 Updating uv.lock..."
	@uv lock
	@echo "✅ Lock file updated!"

update:  ## Update all dependencies to latest versions
	@echo "⬆️  Updating dependencies..."
	@uv lock --upgrade
	@uv sync
	@echo "✅ Dependencies updated!"

.DEFAULT_GOAL := help
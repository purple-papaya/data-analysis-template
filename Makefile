.PHONY: help setup install install-dev clean test lint format run

help:  ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $1, $2}'

setup:  ## Install UV package manager
	curl -LsSf https://astral.sh/uv/install.sh | sh
	@echo "✅ UV installed! Restart your shell or run: source $HOME/.cargo/env"

install:  ## Install project dependencies with UV
	uv sync

install-dev:  ## Install project + development dependencies
	uv sync --extra dev

clean:  ## Remove build artifacts and cache
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".ipynb_checkpoints" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete
	rm -rf .pytest_cache .coverage htmlcov/ dist/ build/ *.egg-info

test:  ## Run tests with pytest
	uv run pytest tests/ -v

lint:  ## Check code quality with ruff
	uv run ruff check src/

format:  ## Format code with ruff
	uv run ruff format src/ tests/

run:  ## Run main analysis
	uv run python src/main.py

notebook:  ## Start Jupyter notebook
	uv run jupyter notebook

lock:  ## Update uv.lock file
	uv lock
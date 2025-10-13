# Using This Template with Copier

This template uses [Copier](https://copier.readthedocs.io/) for intelligent project scaffolding. Copier asks you questions and customizes the template based on your answers.

## 🚀 Quick Start

### Install Copier

```bash
# Using pipx (recommended)
pipx install copier

# Or using pip
pip install copier

# Or using UV
uv tool install copier
```

### Create a New Project

```bash
# From GitHub
copier copy gh:{{ github_username }}/data-analysis-template my-new-project

# Or from a local clone
copier copy /path/to/template my-new-project

# Follow the interactive prompts
```

### Update an Existing Project

If the template is updated, you can update your project:

```bash
cd my-new-project
copier update
```

## 📝 Template Questions

When you run `copier copy`, you'll be asked:

1. **Project name** - e.g., "customer-churn-analysis"
2. **Project slug** - Auto-generated Python package name (e.g., "customer_churn_analysis")
3. **Description** - Brief project description
4. **Author name** - Your name (auto-detected from git config)
5. **Author email** - Your email (auto-detected from git config)
6. **GitHub username** - For README links
7. **Python version** - Choose from 3.10, 3.11, or 3.12
8. **License** - MIT, Apache-2.0, GPL-3.0, BSD-3-Clause, or None
9. **Include Marimo?** - Reactive notebooks (default: yes)
10. **Include Jupyter?** - Traditional notebooks (default: yes)
11. **Include ML extras?** - XGBoost, LightGBM, etc. (default: no)
12. **Include docs?** - MkDocs setup (default: no)
13. **GitHub Actions?** - CI/CD workflows (default: yes)

## 🎯 What Gets Customized?

Copier will customize:

- ✅ `pyproject.toml` - Project name, author, description, dependencies
- ✅ `README.md` - Project name, author, GitHub links
- ✅ `src/` directory - Named after your project
- ✅ `.python-version` - Your chosen Python version
- ✅ `LICENSE` - Your chosen license
- ✅ Tests - Updated to match your project name
- ✅ CI/CD - Configured for your Python version
- ✅ Optional features - Only includes what you need

## 🔄 Smart Features

### Conditional Content

The template intelligently includes/excludes features:

- **No Marimo?** → Marimo dependencies and examples removed
- **No Jupyter?** → Jupyter dependencies and examples removed
- **No ML extras?** → XGBoost/LightGBM not installed
- **No docs?** → MkDocs setup excluded
- **No GitHub Actions?** → `.github/workflows/` removed

### Auto-detection

Copier tries to auto-detect:

- Git username from `git config user.name`
- Git email from `git config user.email`
- GitHub username (derived from name)

## 💡 Examples

### Minimal Data Analysis Project

```bash
copier copy gh:your-username/data-analysis-template minimal-project

# Answer prompts:
# - Include Marimo? yes
# - Include Jupyter? no
# - Include ML extras? no
# - Include docs? no
```

Result: Lightweight project with just Marimo, Pandas, and Polars.

### Full-Featured ML Project

```bash
copier copy gh:your-username/data-analysis-template ml-project

# Answer prompts:
# - Include Marimo? yes
# - Include Jupyter? yes
# - Include ML extras? yes
# - Include docs? yes
```

Result: Complete setup with all features for machine learning.

### Quick Analysis Project

```bash
# Non-interactive mode with defaults
copier copy --defaults \
  --data project_name="quick-analysis" \
  --data author_name="Your Name" \
  gh:your-username/data-analysis-template quick-analysis
```

## 🔧 Advanced Usage

### Using a Local Template

```bash
# Clone the template
git clone https://github.com/your-username/data-analysis-template.git

# Use it locally
copier copy ./data-analysis-template my-project
```

### Non-Interactive Mode

```bash
copier copy \
  --data project_name="my-analysis" \
  --data author_name="Jane Doe" \
  --data author_email="jane@example.com" \
  --data python_version="3.11" \
  --data include_ml_extras=true \
  gh:your-username/data-analysis-template my-project
```

### Updating Projects

```bash
# Update to latest template version
cd my-project
copier update

# Copier will:
# 1. Fetch the latest template
# 2. Ask about conflicts
# 3. Merge changes intelligently
```

## 📚 Learn More

- [Copier Documentation](https://copier.readthedocs.io/)
- [Jinja2 Templating](https://jinja.palletsprojects.com/)
- [Template Best Practices](https://copier.readthedocs.io/en/stable/creating/)

## 🐛 Troubleshooting

### "copier: command not found"

Install Copier first:
```bash
pipx install copier  # Recommended
# or
pip install copier
```

### Template version conflicts

```bash
# Force update to latest version
copier update --force
```

### Reset answers

```bash
# Re-run with different answers
copier copy --force \
  gh:your-username/data-analysis-template my-project
```

## 🎉 After Creation

After creating your project:

```bash
cd my-new-project

# Run setup script
./setup.sh  # or setup.bat on Windows

# Or manually:
uv sync --extra all
source .venv/bin/activate

# Start coding!
make marimo     # Start Marimo
make notebook   # Start Jupyter
make test       # Run tests
```
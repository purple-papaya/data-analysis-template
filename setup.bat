@echo off
echo Setting up your data analysis project...

:: Check if UV is installed
where uv >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo Installing UV package manager...
    powershell -c "irm https://astral.sh/uv/install.ps1 | iex"
)

:: Sync dependencies
echo Installing dependencies...
uv sync

echo Setup complete!
echo.
echo To activate the virtual environment, run:
echo   .venv\Scripts\activate
echo.
echo To run Jupyter, use:
echo   uv run jupyter notebook
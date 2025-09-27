import marimo

__generated_with = "0.9.0"
app = marimo.App(width="medium")


@app.cell
def __():
    import marimo as mo
    import pandas as pd
    import polars as pl
    import numpy as np
    import matplotlib.pyplot as plt
    import seaborn as sns
    from pathlib import Path
    return mo, pd, pl, np, plt, sns, Path


@app.cell
def __(mo):
    mo.md(
        """
        # Project Title: [Your Analysis Title]
        **Author:** [Your Name]  
        **Purpose:** [Brief description]
        
        This is a reactive Marimo notebook - cells auto-update when their dependencies change!
        """
    )
    return


@app.cell
def __(Path):
    # Constants
    DATA_DIR = Path("../data/raw")
    OUTPUT_DIR = Path("../reports/figures")
    return DATA_DIR, OUTPUT_DIR


@app.cell
def __(mo):
    # Interactive file selector
    file_path = mo.ui.text(
        placeholder="Enter data file path...",
        label="Data file:"
    )
    file_path
    return file_path,


@app.cell
def __(file_path, pl):
    # This cell automatically re-runs when file_path changes!
    if file_path.value:
        df = pl.read_csv(file_path.value)
        df.head()
    return df,


@app.cell
def __(df, mo):
    # Interactive column selector
    if 'df' in locals():
        column_selector = mo.ui.dropdown(
            options=df.columns,
            label="Select column to analyze:"
        )
        column_selector
    return column_selector,


@app.cell
def __(column_selector, df, plt):
    # Plot automatically updates when column changes!
    if 'column_selector' in locals() and column_selector.value:
        plt.figure(figsize=(10, 6))
        df[column_selector.value].hist(bins=50)
        plt.title(f"Distribution of {column_selector.value}")
        plt.gca()
    return


if __name__ == "__main__":
    app.run()
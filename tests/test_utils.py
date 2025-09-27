"""Basic tests for the template."""

import data_analysis_template


def test_version():
    """Test that version is defined."""
    assert hasattr(data_analysis_template, "__version__")
    assert data_analysis_template.__version__ == "0.1.0"


def test_import():
    """Test that package can be imported."""
    assert data_analysis_template is not None

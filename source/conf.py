project = 'Onefootball Network API'
copyright = '2020, Onefootball'
author = 'Onefootball'

# Custom extension requires this.
import sys, os
sys.path.append(os.path.dirname(os.path.realpath(__file__)))

master_doc = 'index'

# The full version, including alpha/beta/rc tags
release = '0.1'

extensions = [
    'sphinx.ext.todo',
    'sphinx.ext.githubpages',
    'codeexample',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []


html_theme = 'flask'
html_favicon = '_static/favicon.svg'
html_sidebars = { '**': ['localtoc.html'], }

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

source_suffix = '.rst'

pygments_style = 'trac'

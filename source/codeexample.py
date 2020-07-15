import os

from docutils import nodes
from docutils.parsers.rst import Directive
from sphinx.util.osutil import copyfile
from distutils.dir_util import copy_tree


class ExampleCodeDirective(Directive):
    has_content = True

    def run(self):
        self.assert_has_content()
        text = '\n'.join(self.content)
        node = nodes.container(text)
        node['classes'].append('example-code')
        self.add_name(node)
        self.state.nested_parse(self.content, self.content_offset, node)
        return [node]


def add_assets(app):
    app.add_css_file('main.css')
    app.add_js_file('codeexample.js')


def copy_assets(app, exception=None):
    if app.builder.name != 'html' or exception:
        return
    dest = os.path.join(app.builder.outdir, '_static/style')
    source = os.path.join(os.path.abspath(os.path.dirname(__file__)), "_static/style")
    copy_tree(source, dest)
    dest = os.path.join(app.builder.outdir, '_static/main.css')
    source = os.path.join(os.path.abspath(os.path.dirname(__file__)), "_static/main.css")
    copyfile(source, dest)
    dest = os.path.join(app.builder.outdir, '_static/codeexample.js')
    source = os.path.join(os.path.abspath(os.path.dirname(__file__)), "_static/codeexample.js")
    copyfile(source, dest)


def setup(app):
    app.add_directive('example-code',  ExampleCodeDirective)
    app.connect('builder-inited', add_assets)
    app.connect('build-finished', copy_assets)
    return {'version': '0.1'}

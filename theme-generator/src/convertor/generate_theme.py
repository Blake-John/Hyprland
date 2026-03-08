#!/usr/bin/env python3
import json
import re


def load_colors(path):
    with open(path) as f:
        return json.load(f)


def load_template(path):
    with open(path) as f:
        return f.read()


def render_template(template, colors, template_path=None):
    pattern = re.compile(r"\{\{\s*(\w+)\s*\}\}")
    strip_hash = template_path and "hypr-themer.conf" in template_path

    def replace(match):
        key = match.group(1)
        if key in colors:
            color = colors[key]
            if strip_hash and color.startswith("#"):
                color = color[1:]
            return color
        return match.group(0)

    return pattern.sub(replace, template)

import os
import argparse
from convertor.generate_theme import load_colors, load_template, render_template

def main():
    parser = argparse.ArgumentParser(
        prog="convertor",
        description="Generate theme configs from JSON color palette"
    )
    parser.add_argument(
        "-c", "--colors", required=True, help="Path to colors.json file"
    )
    parser.add_argument("-o", "--output", required=True, help="Output directory")
    parser.add_argument(
        "-t", "--templates", default="templates", help="Templates directory"
    )
    args = parser.parse_args()

    colors = load_colors(args.colors)

    os.makedirs(args.output, exist_ok=True)

    for filename in os.listdir(args.templates):
        template_path = os.path.join(args.templates, filename)
        if not os.path.isfile(template_path):
            continue

        template = load_template(template_path)
        rendered = render_template(template, colors, template_path)

        output_path = os.path.join(args.output, filename)
        with open(output_path, "w") as f:
            f.write(rendered)

        print(f"Generated {output_path}")


if __name__ == "__main__":
    main()

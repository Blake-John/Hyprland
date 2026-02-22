import argparse
import json
import sys
from pathlib import Path

from themer.material import get_colours_for_image


def main():
    parser = argparse.ArgumentParser(
        prog="themer",
        description="Extract a complete color theme from an image",
    )
    parser.add_argument("image", help="Path to the image file")
    parser.add_argument(
        "--mode",
        choices=["light", "dark"],
        default="dark",
        help="Color scheme mode (default: dark)",
    )
    parser.add_argument(
        "--variant",
        choices=[
            "tonalspot",
            "vibrant",
            "expressive",
            "fidelity",
            "fruitsalad",
            "monochrome",
            "neutral",
            "rainbow",
            "content",
        ],
        default="tonalspot",
        help="Color scheme variant (default: tonalspot)",
    )
    parser.add_argument(
        "--flavour",
        choices=["default", "hard"],
        default="default",
        help="Color scheme flavour (default: default)",
    )
    parser.add_argument(
        "--output",
        "-o",
        help="Output file (default: stdout)",
    )
    parser.add_argument(
        "--format",
        choices=["json", "plain"],
        default="json",
        help="Output format (default: json)",
    )

    args = parser.parse_args()

    image_path = Path(args.image)
    if not image_path.exists():
        print(f"Error: Image file not found: {args.image}", file=sys.stderr)
        sys.exit(1)

    colours = get_colours_for_image(
        image_path,
        mode=args.mode,
        variant=args.variant,
        flavour=args.flavour,
    )

    if args.format == "json":
        output = json.dumps(colours, indent=2)
    else:
        output = "\n".join(f"{name} {color}" for name, color in colours.items())

    if args.output:
        Path(args.output).write_text(output)
    else:
        print(output)


if __name__ == "__main__":
    main()

#!/usr/bin/env python3
"""Kontrola spójności plików JSON Schema w katalogu schemas/.

Sprawdza, że każdy plik `schemas/*.schema.json`:
  - jest poprawnym JSON-em,
  - ma klucze: $schema, title, type, properties, required,
  - ma główny typ `object`.

Kod wyjścia: 0 gdy wszystko przeszło, 1 gdy wykryto błąd.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SCHEMA_DIR = REPO_ROOT / "schemas"
REQUIRED_KEYS = ("$schema", "title", "type", "properties", "required")


def validate_file(path: Path) -> list[str]:
    """Zwraca listę błędów wykrytych w jednym pliku schematu."""
    errors: list[str] = []

    try:
        raw = path.read_text(encoding="utf-8")
    except OSError as exc:
        return [f"nie udało się odczytać pliku: {exc}"]

    try:
        document = json.loads(raw)
    except json.JSONDecodeError as exc:
        return [f"niepoprawny JSON: {exc}"]

    if not isinstance(document, dict):
        return ["dokument główny musi być obiektem JSON"]

    for key in REQUIRED_KEYS:
        if key not in document:
            errors.append(f"brak wymaganego klucza: {key}")

    root_type = document.get("type")
    if "type" in document and root_type != "object":
        errors.append(f"główny typ musi być 'object', jest: {root_type!r}")

    properties = document.get("properties")
    if "properties" in document and not isinstance(properties, dict):
        errors.append("'properties' musi być obiektem")

    required = document.get("required")
    if "required" in document and not isinstance(required, list):
        errors.append("'required' musi być tablicą")

    return errors


def main() -> int:
    if not SCHEMA_DIR.is_dir():
        print(f"BŁĄD: brak katalogu {SCHEMA_DIR}", file=sys.stderr)
        return 1

    files = sorted(SCHEMA_DIR.glob("*.schema.json"))
    if not files:
        print(f"BŁĄD: brak plików *.schema.json w {SCHEMA_DIR}", file=sys.stderr)
        return 1

    failed = 0
    for path in files:
        relative = path.relative_to(REPO_ROOT)
        errors = validate_file(path)
        if errors:
            failed += 1
            print(f"BŁĄD {relative}", file=sys.stderr)
            for error in errors:
                print(f"  - {error}", file=sys.stderr)
        else:
            print(f"OK   {relative}")

    print(f"\nSprawdzono schematów: {len(files)}, z błędami: {failed}")
    return 1 if failed else 0


if __name__ == "__main__":
    sys.exit(main())

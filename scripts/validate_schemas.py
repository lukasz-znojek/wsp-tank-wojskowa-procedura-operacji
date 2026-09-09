#!/usr/bin/env python3
"""Kontrola spójności plików JSON Schema w katalogu schemas/.

Sprawdza, że każdy plik `schemas/*.schema.json`:
  - jest poprawnym JSON-em,
  - ma klucze: $schema, title, type, properties, required,
  - ma główny typ `object`.

Po przejściu kontroli struktury, jeżeli dostępna jest opcjonalna biblioteka
`jsonschema`, waliduje przykłady JSON z katalogu examples/ wobec
odpowiadających im kontraktów. Bez biblioteki walidacja przykładów jest
pomijana z komunikatem na stderr, a kontrola struktury pozostaje w mocy.

Kod wyjścia: 0 gdy wszystko przeszło, 1 gdy wykryto błąd.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

REPO_ROOT = Path(__file__).resolve().parent.parent
SCHEMA_DIR = REPO_ROOT / "schemas"
EXAMPLE_DIR = REPO_ROOT / "examples"
REQUIRED_KEYS = ("$schema", "title", "type", "properties", "required")

# Pary (przykład, kontrakt) - ścieżki względem katalogu głównego repozytorium.
EXAMPLE_SCHEMA_PAIRS = (
    ("examples/operation-example-alpha.json", "schemas/operation.schema.json"),
    ("examples/message-example-alpha.json", "schemas/message.schema.json"),
    ("examples/sitrep-example-alpha.json", "schemas/sitrep.schema.json"),
)

SKIP_MESSAGE = "Pominięto walidację przykładów JSON: biblioteka jsonschema nie jest dostępna."


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


def load_json(path: Path) -> tuple[object | None, str | None]:
    """Wczytuje plik JSON. Zwraca (dokument, None) albo (None, opis błędu)."""
    try:
        raw = path.read_text(encoding="utf-8")
    except OSError as exc:
        return None, f"nie udało się odczytać pliku: {exc}"
    try:
        return json.loads(raw), None
    except json.JSONDecodeError as exc:
        return None, f"niepoprawny JSON: {exc}"


def validate_examples() -> int:
    """Waliduje przykłady JSON wobec kontraktów. Zwraca liczbę przykładów z błędami.

    Zwraca -1, gdy biblioteka jsonschema nie jest dostępna (walidacja pominięta).
    """
    try:
        import jsonschema
        from jsonschema import validators as jsonschema_validators
    except ImportError:
        print(SKIP_MESSAGE, file=sys.stderr)
        return -1

    failed = 0
    for example_rel, schema_rel in EXAMPLE_SCHEMA_PAIRS:
        example_path = REPO_ROOT / example_rel
        schema_path = REPO_ROOT / schema_rel
        label = f"{example_rel} wobec {schema_rel}"

        schema, schema_error = load_json(schema_path)
        if schema_error is not None:
            failed += 1
            print(f"BŁĄD {label}: kontrakt - {schema_error}", file=sys.stderr)
            continue

        instance, instance_error = load_json(example_path)
        if instance_error is not None:
            failed += 1
            print(f"BŁĄD {label}: przykład - {instance_error}", file=sys.stderr)
            continue

        validator_cls = jsonschema_validators.validator_for(schema)
        try:
            validator_cls.check_schema(schema)
        except jsonschema.SchemaError as exc:
            failed += 1
            print(f"BŁĄD {label}: kontrakt niepoprawny - {exc.message}", file=sys.stderr)
            continue

        validator = validator_cls(schema)
        errors = sorted(validator.iter_errors(instance), key=lambda e: list(e.absolute_path))
        if errors:
            failed += 1
            print(f"BŁĄD {label}", file=sys.stderr)
            for error in errors:
                location = "/".join(str(part) for part in error.absolute_path) or "(korzeń)"
                print(f"  - {location}: {error.message}", file=sys.stderr)
        else:
            print(f"OK   {label}")

    return failed


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
    if failed:
        return 1

    print()
    examples_failed = validate_examples()
    if examples_failed < 0:
        return 0
    total = len(EXAMPLE_SCHEMA_PAIRS)
    if examples_failed:
        print(f"Zwalidowano przykładów: {total}, z błędami: {examples_failed}", file=sys.stderr)
        return 1
    print(f"Zwalidowano przykładów: {total}, z błędami: 0")
    return 0


if __name__ == "__main__":
    sys.exit(main())

#!/usr/bin/env bash
# Kontrola kompletności sekcji w procedurach z docs/03-procedures/.
#
# Każda procedura (poza README.md) musi zawierać wszystkie dziewięć
# wymaganych sekcji. Brak choćby jednej kończy skrypt kodem niezerowym.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
procedures_dir="${repo_root}/docs/03-procedures"

required_sections=(
  "## Cel"
  "## Zakres"
  "## Role"
  "## Dane wejściowe"
  "## Kroki"
  "## Punkty decyzyjne"
  "## Dane wyjściowe"
  "## Wyjątki"
  "## Powiązane artefakty"
)

if [[ ! -d "${procedures_dir}" ]]; then
  echo "BŁĄD: brak katalogu ${procedures_dir}" >&2
  exit 1
fi

checked=0
failed=0

while IFS= read -r file; do
  base="$(basename "${file}")"
  if [[ "${base}" == "README.md" ]]; then
    continue
  fi

  checked=$((checked + 1))
  missing=()

  for section in "${required_sections[@]}"; do
    if ! grep -qxF "${section}" "${file}"; then
      missing+=("${section}")
    fi
  done

  relative="${file#"${repo_root}/"}"
  if [[ ${#missing[@]} -gt 0 ]]; then
    failed=$((failed + 1))
    echo "BŁĄD ${relative}" >&2
    for section in "${missing[@]}"; do
      echo "  - brak sekcji: ${section}" >&2
    done
  else
    echo "OK   ${relative}"
  fi
done < <(find "${procedures_dir}" -maxdepth 1 -type f -name '*.md' | sort)

if [[ ${checked} -eq 0 ]]; then
  echo "BŁĄD: nie znaleziono żadnej procedury do sprawdzenia" >&2
  exit 1
fi

echo
echo "Sprawdzono procedur: ${checked}, z błędami: ${failed}"

if [[ ${failed} -gt 0 ]]; then
  exit 1
fi

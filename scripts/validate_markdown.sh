#!/usr/bin/env bash
# Kontrola spójności dokumentacji Markdown.
#
# Sprawdza trzy rzeczy:
#   1. każda procedura z docs/03-procedures/ (poza README.md) zawiera dokładnie
#      dziewięć wymaganych sekcji, w wymaganej kolejności i bez dodatkowych
#      nagłówków tego poziomu;
#   2. żaden plik .md nie zawiera tekstu zastępczego;
#   3. żaden plik .md nie zawiera bezwzględnej ścieżki systemu plików.
#
# Kod wyjścia: 0 gdy wszystko przeszło, 1 gdy wykryto naruszenie.

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

# Tekst zastępczy budowany ze składowych, żeby ten skrypt sam nie był trafieniem.
placeholder="[do uzupe""łnienia]"

failed=0

# --- 1. Kompletność i kolejność sekcji procedur ---

checked=0

while IFS= read -r file; do
  base="$(basename "${file}")"
  if [[ "${base}" == "README.md" ]]; then
    continue
  fi

  checked=$((checked + 1))
  relative="${file#"${repo_root}/"}"
  problems=()

  mapfile -t found < <(grep '^## ' "${file}" || true)

  for section in "${required_sections[@]}"; do
    if ! grep -qxF "${section}" "${file}"; then
      problems+=("brak sekcji: ${section}")
    fi
  done

  if [[ ${#found[@]} -ne ${#required_sections[@]} ]]; then
    problems+=("liczba nagłówków '##' wynosi ${#found[@]}, wymagane ${#required_sections[@]}")
  fi

  for i in "${!found[@]}"; do
    if [[ ${i} -lt ${#required_sections[@]} && "${found[${i}]}" != "${required_sections[${i}]}" ]]; then
      problems+=("nagłówek na pozycji $((i + 1)) to '${found[${i}]}', wymagany '${required_sections[${i}]}'")
    fi
  done

  if [[ ${#problems[@]} -gt 0 ]]; then
    failed=$((failed + 1))
    echo "BŁĄD ${relative}" >&2
    for problem in "${problems[@]}"; do
      echo "  - ${problem}" >&2
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

# --- 2. Tekst zastępczy ---

echo
placeholder_hits=0
while IFS= read -r hit; do
  echo "BŁĄD tekst zastępczy: ${hit}" >&2
  placeholder_hits=$((placeholder_hits + 1))
done < <(grep -rnF "${placeholder}" --include='*.md' "${repo_root}" \
           | sed "s|^${repo_root}/||" || true)

if [[ ${placeholder_hits} -gt 0 ]]; then
  failed=$((failed + placeholder_hits))
  echo "Tekst zastępczy: ${placeholder_hits} wystąpień" >&2
else
  echo "Tekst zastępczy: 0 wystąpień"
fi

# --- 3. Bezwzględne ścieżki systemu plików ---

echo
path_hits=0
while IFS= read -r hit; do
  echo "BŁĄD ścieżka bezwzględna: ${hit}" >&2
  path_hits=$((path_hits + 1))
done < <(grep -rnE '/Users/|/home/|C:\\' --include='*.md' "${repo_root}" \
           | sed "s|^${repo_root}/||" || true)

if [[ ${path_hits} -gt 0 ]]; then
  failed=$((failed + path_hits))
  echo "Ścieżki bezwzględne: ${path_hits} wystąpień" >&2
else
  echo "Ścieżki bezwzględne: 0 wystąpień"
fi

if [[ ${failed} -gt 0 ]]; then
  exit 1
fi

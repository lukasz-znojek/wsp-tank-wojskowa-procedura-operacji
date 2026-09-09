#!/usr/bin/env bash
# Kontrola spójności dokumentacji Markdown.
#
# Sprawdza cztery rzeczy:
#   1. każda procedura z docs/03-procedures/ (poza README.md) zawiera dokładnie
#      dziewięć wymaganych sekcji, w wymaganej kolejności i bez dodatkowych
#      nagłówków tego poziomu;
#   2. żaden plik .md nie zawiera tekstu zastępczego;
#   3. żaden plik .md nie zawiera bezwzględnej ścieżki systemu plików;
#   4. żaden plik .md nie zawiera pustej sekcji: nagłówka, po którym (poza
#      pustymi liniami) następuje od razu nagłówek tego samego albo wyższego
#      poziomu albo koniec pliku. Nagłówki wewnątrz bloków kodu są pomijane.
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

# --- 4. Puste sekcje ---
#
# Sekcja jest pusta, gdy po jej nagłówku - z pominięciem pustych linii - stoi
# nagłówek tego samego albo wyższego poziomu (mniej lub tyle samo znaków '#')
# albo kończy się plik. Nagłówek, po którym następuje podsekcja, nie jest pusty.
# Szablony zgłoszeń w .github/ISSUE_TEMPLATE/ są formularzami: ich sekcje mają
# być puste do chwili wypełnienia, dlatego ta kontrola je pomija.

echo
empty_hits=0
while IFS= read -r hit; do
  echo "BŁĄD pusta sekcja: ${hit}" >&2
  empty_hits=$((empty_hits + 1))
done < <(find "${repo_root}" -type f -name '*.md' \
           -not -path '*/.git/*' -not -path '*/.github/ISSUE_TEMPLATE/*' | sort \
           | while IFS= read -r md; do
               awk -v file="${md#"${repo_root}/"}" '
                 function flush_if_empty(next_level) {
                   if (open_line && !has_content && (next_level == 0 || next_level <= open_level)) {
                     printf "%s:%d: %s\n", file, open_line, open_text
                   }
                 }
                 /^```/ { in_fence = !in_fence; has_content = 1; next }
                 in_fence { has_content = 1; next }
                 /^#{1,6} / {
                   level = length($0) - length(substr($0, index($0, " ")))
                   flush_if_empty(level)
                   open_line = NR; open_level = level; open_text = $0; has_content = 0
                   next
                 }
                 /^[[:space:]]*$/ { next }
                 { has_content = 1 }
                 END { flush_if_empty(0) }
               ' "${md}"
             done)

if [[ ${empty_hits} -gt 0 ]]; then
  failed=$((failed + empty_hits))
  echo "Puste sekcje: ${empty_hits} wystąpień" >&2
else
  echo "Puste sekcje: 0 wystąpień"
fi

if [[ ${failed} -gt 0 ]]; then
  exit 1
fi

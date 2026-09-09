#!/usr/bin/env bash
# Kontrola skilla w skill/tank/. Trzy rzeczy:
#   1. frontmatter SKILL.md: name równy nazwie katalogu, dozwolone znaki,
#      description nie dłuższy niż 1024 znaki;
#   2. komplet plików: dokładnie 13, bez nadwyżek i braków;
#   3. samodzielność: każdy przywołany plik .md istnieje w katalogu skilla,
#      i zero przywołań skilli zewnętrznych.
#
# Bash 3.2 (macOS): bez mapfile, bez declare -A.
# Kod wyjścia: 0 gdy wszystko przeszło, 1 gdy wykryto naruszenie.

set -euo pipefail

repo_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
skill_dir="${repo_root}/skill/tank"
skill_name="$(basename "${skill_dir}")"
failed=0

expected_files="SKILL.md arsenal.md procedura_komendy.md procedura_lacznosc.md
procedura_meldunek.md procedura_przejazd.md procedura_rozpoznanie.md
procedura_think_tank.md procedura_zwiad.md szablon_bms.md szablon_dziennik.md
szablon_operacja.md szablon_sitrep.md"

# Artefakty wytwarzane przez skill w trakcie pracy - nie są jego plikami.
runtime_artifacts="_operacja.md _dziennik.md"

# Listy wieloliniowe trzeba zwinac do jednej linii: dopasowanie
# case *" ${base} "* wymaga spacji po obu stronach, nie znaku nowej linii.
# Bez tego skrypt zglasza 6 falszywych trafien "plik nadwyzkowy"
# (pomiar 2026-09-09 na kopii probnej).
expected_flat="$(printf '%s' "${expected_files}" | tr '\n' ' ')"

echo "--- 1. Frontmatter SKILL.md ---"

name_value="$(sed -n 's/^name: *//p' "${skill_dir}/SKILL.md" | head -1)"
if [ -z "${name_value}" ]; then
  echo "BŁĄD: SKILL.md nie ma pola 'name'" >&2
  failed=$((failed + 1))
elif [ "${name_value}" != "${skill_name}" ]; then
  echo "BŁĄD: 'name' to '${name_value}', wymagane '${skill_name}' (nazwa katalogu)" >&2
  failed=$((failed + 1))
elif ! printf '%s' "${name_value}" | grep -qE '^[a-z0-9]+(-[a-z0-9]+)*$'; then
  echo "BŁĄD: 'name' zawiera znaki poza [a-z0-9-]: '${name_value}'" >&2
  failed=$((failed + 1))
else
  echo "OK   name = ${name_value}"
fi

desc_value="$(sed -n 's/^description: *//p' "${skill_dir}/SKILL.md" | head -1)"
desc_len="$(printf '%s' "${desc_value}" | wc -m | tr -d ' ')"
if [ -z "${desc_value}" ]; then
  echo "BŁĄD: SKILL.md nie ma pola 'description'" >&2
  failed=$((failed + 1))
elif [ "${desc_len}" -gt 1024 ]; then
  echo "BŁĄD: 'description' ma ${desc_len} znaków, limit 1024" >&2
  failed=$((failed + 1))
else
  echo "OK   description = ${desc_len} znaków (limit 1024)"
fi

echo
echo "--- 2. Komplet plików ---"

for want in ${expected_files}; do
  if [ ! -f "${skill_dir}/${want}" ]; then
    echo "BŁĄD: brakuje pliku ${want}" >&2
    failed=$((failed + 1))
  fi
done

while IFS= read -r have; do
  base="$(basename "${have}")"
  case " ${expected_flat} " in
    *" ${base} "*) ;;
    *) echo "BŁĄD: plik nadwyżkowy ${base}" >&2; failed=$((failed + 1)) ;;
  esac
done < <(find "${skill_dir}" -maxdepth 1 -type f -name '*.md' | sort)

count="$(find "${skill_dir}" -maxdepth 1 -type f -name '*.md' | wc -l | tr -d ' ')"
echo "OK   plików .md w katalogu: ${count}"

echo
echo "--- 3. Samodzielność ---"

while IFS= read -r ref; do
  case " ${runtime_artifacts} " in
    *" ${ref} "*) continue ;;
  esac
  if [ ! -f "${skill_dir}/${ref}" ]; then
    echo "BŁĄD: przywołany plik nie istnieje w skillu: ${ref}" >&2
    failed=$((failed + 1))
  fi
done < <(grep -rhoE '`[A-Za-z0-9_./-]+\.md`' "${skill_dir}" \
           | tr -d '`' | xargs -n1 basename | sort -u)

external=0
while IFS= read -r hit; do
  echo "BŁĄD przywołanie skilla zewnętrznego: ${hit}" >&2
  external=$((external + 1))
done < <(grep -rnoE 'superpowers:[a-z-]+|anthropic-skills:[a-z-]+|design:[a-z-]+' \
           "${skill_dir}" | sed "s|^${repo_root}/||" || true)

if [ "${external}" -gt 0 ]; then
  failed=$((failed + external))
else
  echo "OK   przywołań skilli zewnętrznych: 0"
fi

echo
if [ "${failed}" -gt 0 ]; then
  echo "Naruszeń: ${failed}" >&2
  exit 1
fi
echo "Skill przeszedł wszystkie kontrole."

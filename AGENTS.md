# Instrukcje dla współautorów i agentów

## Charakter projektu

Repozytorium opisuje środowisko symulacyjne i szkoleniowe. Nie twórz treści przeznaczonych do użycia w rzeczywistych działaniach ani nie dodawaj rzeczywistych danych operacyjnych.

## Zasady bezpieczeństwa

- Używaj wyłącznie syntetycznych nazw, identyfikatorów, czasów i lokalizacji.
- Nie zapisuj danych osobowych, danych o podmiotach rzeczywistych, sekretów, tokenów, kluczy ani danych wrażliwych.
- Jeżeli wymaganie jest niejednoznaczne lub może prowadzić do treści operacyjnej o realnym zastosowaniu, oznacz je jako pytanie otwarte i poproś o decyzję właściciela projektu.

## Zasady edycji

- Pisz po polsku, w prostym i jednoznacznym języku.
- Stosuj nazwy plików małymi literami, z myślnikami.
- Nie mieszaj procedury, szablonu i przykładu w jednym pliku.
- Utrzymuj względne odnośniki Markdown.
- Zachowuj historię decyzji: nie nadpisuj uzasadnienia bez aktualizacji odpowiedniego ADR.

## Wymagana struktura procedury

Każda procedura w `docs/03-procedures/` musi zawierać: cel, zakres, role, dane wejściowe, kroki, punkty decyzyjne, dane wyjściowe, wyjątki oraz powiązane artefakty.

## Zasady zmian

1. Zmiana procedury wymaga oceny wpływu na szablony, przykłady i schematy.
2. Nowy typ artefaktu wymaga pliku w `docs/04-templates/`, odpowiedniego kontraktu w `schemas/` i przykładu w `examples/`.
3. Zmiana architektury, zakresu lub kontraktu danych wymaga ADR.
4. Po zmianie uruchom walidację Markdown i JSON Schema albo wyjaśnij, dlaczego nie była możliwa.
5. Zaktualizuj `PROJECT_CONTEXT.md`, gdy zmienia się etap, cel, zakres, decyzja lub pytanie otwarte.

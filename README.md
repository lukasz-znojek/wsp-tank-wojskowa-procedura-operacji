# WSP Tank — Wojskowa Procedura Operacji

Repozytorium wiedzy, specyfikacji i materiałów projektowych dla symulacyjnego środowiska BMS (Battle Management System) oraz ustrukturyzowanych procedur operacyjnych.

> Status: faza specyfikacji i porządkowania wiedzy.

## Cel

Celem projektu jest zbudowanie spójnego, audytowalnego zbioru procedur, szablonów i kontraktów danych, które mogą stanowić podstawę demonstratora lub aplikacji szkoleniowej. Materiały mają charakter symulacyjny, edukacyjny i projektowy.

## Jak korzystać z repozytorium

1. Zacznij od [kontekstu projektu](PROJECT_CONTEXT.md).
2. Zapoznaj się z dokumentami w katalogu `docs/`.
3. Czytaj procedury razem z odpowiadającymi im szablonami i przykładami.
4. Przed zmianą przeczytaj [zasady współpracy](CONTRIBUTING.md) oraz [instrukcje dla agentów](AGENTS.md).

## Docelowa struktura

- `docs/` — dokumentacja produktu, architektury, procedur, szablonów i zarządzania
- `examples/` — wyłącznie fikcyjne przykłady
- `schemas/` — kontrakty JSON Schema dla artefaktów BMS
- `scripts/` — narzędzia kontroli spójności dokumentacji
- `.github/` — szablony zmian i automatyczna walidacja

## Zasady bezpieczeństwa

- Nie dodawaj danych rzeczywistych, danych osobowych, rzeczywistych lokalizacji, identyfikatorów jednostek ani informacji wrażliwych.
- Nie interpretuj dokumentów jako instrukcji użycia w realnych działaniach.
- Wszystkie nazwy, dane i scenariusze przykładowe muszą być syntetyczne.

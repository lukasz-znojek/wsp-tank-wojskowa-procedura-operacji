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

## Struktura repozytorium

| Katalog | Zawartość |
| --- | --- |
| [`docs/00-overview/`](docs/00-overview/) | cel, zakres, status, glosariusz, ograniczenia |
| [`docs/01-product/`](docs/01-product/) | wymagania, scenariusze użycia, role, kryteria akceptacji |
| [`docs/02-architecture/`](docs/02-architecture/) | architektura pojęciowa, model danych, model stanów, integracje, ADR-y |
| [`docs/03-procedures/`](docs/03-procedures/) | procedury — przebieg działania |
| [`docs/04-templates/`](docs/04-templates/) | szablony — format zapisu artefaktu |
| [`docs/05-reference/`](docs/05-reference/) | materiały referencyjne i rejestr pochodzenia |
| [`docs/06-governance/`](docs/06-governance/) | klasyfikacja informacji, wersjonowanie, tryb zmian |
| [`examples/`](examples/) | wyłącznie fikcyjne przykłady |
| [`schemas/`](schemas/) | kontrakty JSON Schema dla artefaktów |
| [`scripts/`](scripts/) | narzędzia kontroli spójności |
| [`.github/`](.github/) | szablony zmian i automatyczna walidacja |

## Kolejność czytania

1. [Kontekst projektu](PROJECT_CONTEXT.md) — cel, zakres, stan bieżący.
2. [`docs/00-overview/`](docs/00-overview/) — granice projektu i słownik pojęć.
3. [`docs/01-product/`](docs/01-product/) — czego demonstrator ma dostarczać.
4. [`docs/02-architecture/`](docs/02-architecture/) — model danych i decyzje architektoniczne.
5. [`docs/03-procedures/`](docs/03-procedures/) razem z [`docs/04-templates/`](docs/04-templates/) i [`examples/`](examples/) — procedura, jej szablon i fikcyjny przykład czytane łącznie.
6. [Zasady współpracy](CONTRIBUTING.md) i [instrukcje dla agentów](AGENTS.md) — przed pierwszą zmianą.

## Walidacja

```bash
python3 scripts/validate_schemas.py
bash scripts/validate_markdown.sh
```

Oba polecenia uruchamia także workflow [`validate-docs`](.github/workflows/validate-docs.yml) dla każdego pull requesta oraz przy zmianie gałęzi `main`.

## Zasady bezpieczeństwa

- Nie dodawaj danych rzeczywistych, danych osobowych, rzeczywistych lokalizacji, identyfikatorów jednostek ani informacji wrażliwych.
- Nie interpretuj dokumentów jako instrukcji użycia w realnych działaniach.
- Wszystkie nazwy, dane i scenariusze przykładowe muszą być syntetyczne.

## Stan treści

Struktura repozytorium jest kompletna. Treść przeniesiona z materiałów źródłowych — siedem procedur, cztery szablony, materiały referencyjne, glosariusz, architektura pojęciowa i model stanów — jest gotowa. Pozostałe dokumenty produktowe, ADR-y i dokumenty governance mają szkielety z treścią oznaczoną `[do uzupełnienia]`.

Pochodzenie materiałów, zakres przeniesienia i rozstrzygnięte rozbieżności opisuje [rejestr pochodzenia](docs/05-reference/sources.md). Zagnieżdżony katalog źródłowy został usunięty po potwierdzeniu przeniesienia treści plik po pliku; pliki źródłowe pozostają odtwarzalne z historii repozytorium.

Liczbę dokumentów oczekujących na treść odtwarza polecenie — liczy puste sekcje, nie wystąpienia samego tekstu:

```bash
grep -rl '^\[do uzupełnienia\]$' --include='*.md' docs/ examples/ | wc -l
```

Wynik na dziś: **22** dokumenty z pustymi sekcjami, **20** dokumentów z treścią kompletną.

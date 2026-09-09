# Architektura

Katalog opisuje architekturę **pojęciową** symulacyjnego środowiska BMS, model danych, cykl życia artefaktu oraz decyzje, które te opisy uzasadniają. Nie opisuje wdrożenia: projekt nie ma integracji produkcyjnych i jest to decyzja, nie zaległość.

## Zawartość katalogu

| Plik | Co zawiera |
| --- | --- |
| [architektura-bms.md](architektura-bms.md) | pięć elementów architektury pojęciowej, przepływ informacji, tabela dojrzałości |
| [model-danych.md](model-danych.md) | cztery typy artefaktów, pola obowiązkowe, relacje, odwzorowanie na kontrakty danych |
| [model-stanow.md](model-stanow.md) | cykl życia artefaktu, przejścia dozwolone i niedozwolone, historia zmian |
| [integracje.md](integracje.md) | brak integracji produkcyjnych jako decyzja oraz warunki dla przyszłych integracji |
| [decyzje/](decyzje/) | pięć zapisów ADR |

## Kolejność czytania

1. [architektura-bms.md](architektura-bms.md) — z czego środowisko się składa i jaka zasada nim rządzi.
2. [model-danych.md](model-danych.md) — co jest przechowywane i w jakich relacjach.
3. [model-stanow.md](model-stanow.md) — jak artefakt przechodzi przez cykl życia i kto o tym rozstrzyga.
4. [integracje.md](integracje.md) — czego nie ma i pod jakimi warunkami mogłoby powstać.
5. ADR-y — dlaczego powyższe wygląda tak, a nie inaczej.

## Rejestr decyzji

| ADR | Temat | Status |
| --- | --- | --- |
| [ADR-001](decyzje/adr-001-zakres-symulacyjny.md) | Zakres wyłącznie symulacyjny i szkoleniowy | Zaakceptowana |
| [ADR-002](decyzje/adr-002-markdown-zrodlo-prawdy.md) | Markdown jako źródło prawdy | Zaakceptowana |
| [ADR-003](decyzje/adr-003-json-schema.md) | JSON Schema dla kluczowych artefaktów | Planowana |
| [ADR-004](decyzje/adr-004-rozdzielenie-artefaktow.md) | Rozdzielenie procedury, szablonu i przykładu | Zaakceptowana |
| [ADR-005](decyzje/adr-005-stan-pozycji-w-kontrakcie.md) | Stan pozycji mapy etapów w kontrakcie planu operacji | Zaakceptowana |

Indeks nadrzędny: [`DECISIONS.md`](../../DECISIONS.md). Każdy ADR ma sekcje Status, Kontekst, Decyzja i Konsekwencje, a w Konsekwencjach osobno skutki pozytywne i koszty.

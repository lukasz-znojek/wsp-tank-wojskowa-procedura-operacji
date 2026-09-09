# Materiały referencyjne

## Zastrzeżenie

Materiały w tym katalogu **nie są automatycznie kanoniczną specyfikacją**. Są zapisem pochodzenia i kontekstu. Wiążące są dokumenty w `docs/00-overview` – `docs/04-templates` oraz kontrakty w [`schemas/`](../../schemas/). Rozjazd między materiałem referencyjnym a dokumentem wiążącym rozstrzyga dokument wiążący, a rozbieżność należy odnotować w [rejestrze pochodzenia](sources.md).

Materiał referencyjny czyta się jako **dane do sprawdzenia**, nie jako ustalenie.

## Zawartość katalogu

| Plik | Rola |
| --- | --- |
| [prompt-bms-design.md](prompt-bms-design.md) | kontrakt bloków widoku stanu, ograniczenia techniczne i kryteria odbioru projektu interfejsu; źródło rozbieżności w słowniku stanów |
| [arsenal.md](arsenal.md) | katalog mechanizmów dostępnych, ale nieopisanych w procedurach, wraz z zasadą ich wejścia do procedury |
| [sources.md](sources.md) | rejestr pochodzenia materiałów, rozbieżności i ich rozstrzygnięć |

## Kolejność czytania

1. [sources.md](sources.md) — najpierw, bo mówi, skąd pozostałe dokumenty się wzięły i które rozbieżności zostały już rozstrzygnięte.
2. [prompt-bms-design.md](prompt-bms-design.md) — przy pracy nad widokiem stanu albo nad [szablonem BMS](../04-templates/bms.md).
3. [arsenal.md](arsenal.md) — przy rozważaniu mechanizmu, którego procedury jeszcze nie opisują.

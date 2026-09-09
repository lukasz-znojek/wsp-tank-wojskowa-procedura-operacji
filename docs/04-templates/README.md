# Szablony

Szablon opisuje **format zapisu** artefaktu: jakie pola, jakie tabele, jakie wartości dopuszczone. Nie opisuje przebiegu działania — ten należy do [procedury](../03-procedures/README.md) — i nie zawiera wypełnionych danych, które należą do [przykładu](../../examples/).

Szablon pozostaje pusty. Wypełniony szablon przestaje być szablonem i staje się przykładem albo artefaktem scenariusza.

## Zawartość katalogu

| Szablon | Zastosowanie | Powiązana procedura | Przykład |
| --- | --- | --- | --- |
| [plan-operacji.md](plan-operacji.md) | plan fikcyjnego scenariusza: cel, mapa etapów, progi, zależności | [think-tank](../03-procedures/think-tank.md) | [`operation-example-alpha.md`](../../examples/operation-example-alpha.md) |
| [wpis-bms.md](wpis-bms.md) | jedno zdarzenie w widoku stanu, z oceną pewności | [zwiad](../03-procedures/zwiad.md), [rozpoznanie](../03-procedures/rozpoznanie.md), [komenda](../03-procedures/komenda.md) | [`bms-event-example.md`](../../examples/bms-event-example.md) |
| [komunikat.md](komunikat.md) | jedna wymiana informacji między rolami | [łączność](../03-procedures/lacznosc.md) | [`communication-log-example.md`](../../examples/communication-log-example.md) |
| [sitrep.md](sitrep.md) | raport stanu w trakcie scenariusza | [meldunek](../03-procedures/meldunek.md), [przejazd](../03-procedures/przejazd.md) | [`sitrep-example.md`](../../examples/sitrep-example.md) |
| [dziennik-operacyjny.md](dziennik-operacyjny.md) | rejestr zdarzeń i rejestr naruszeń scenariusza | [przejazd](../03-procedures/przejazd.md), [komenda](../03-procedures/komenda.md) | [`communication-log-example.md`](../../examples/communication-log-example.md) |

Kontrakty danych: [`operation.schema.json`](../../schemas/operation.schema.json), [`bms-event.schema.json`](../../schemas/bms-event.schema.json), [`message.schema.json`](../../schemas/message.schema.json), [`sitrep.schema.json`](../../schemas/sitrep.schema.json). Odwzorowanie nazw kontraktów na typy artefaktów: [model danych](../02-architecture/model-danych.md). Każdy szablon ma pod metryką tabelę odwzorowania pól na własności kontraktu, a każdy przykład Markdown ma maszynowy odpowiednik JSON w [`examples/`](../../examples/), walidowany przez [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py).

Dziennik operacyjny nie jest osobnym typem danych — jest rejestrem wpisów, dlatego nie ma własnego kontraktu.

## Zasady wypełniania

1. **Pole `Dane syntetyczne` ma wartość `tak` bezwyjątkowo.** Kontrakty danych wymagają odpowiadającego mu pola `synthetic` o wartości `true`; artefakt bez niego nie przechodzi walidacji.
2. **Status pochodzi z pięciowartościowego słownika:** `szkic`, `do-przegladu`, `zatwierdzony`, `opublikowany`, `odrzucony`. Innej wartości nie wpisuj i nie tłumacz jej na inny język — patrz [model stanów](../02-architecture/model-stanow.md).
3. **Identyfikatory odpowiadają wzorcowi `^[A-Z0-9-]+$`.** Wzorzec jest wąski celowo: nie przyjmie ścieżki, adresu ani nazwy osoby.
4. **Osoby oznaczaj rolą z numerem** — `Koordynator-01`, `Analityk-01`, `Recenzent-01`. Imion, nazwisk i danych kontaktowych nie wpisuj nigdzie.
5. **Miejsca oznaczaj punktami abstrakcyjnymi** — `Punkt-A`, `Punkt-B`. Rzeczywistych lokalizacji i współrzędnych nie wpisuj; kontrakty celowo nie mają pól, które by je przyjęły.
6. **Czas zdarzenia zapisuj jako etykietę względną** w formacie `T+HH:MM`. Czasu rzeczywistego w treści artefaktu nie umieszczaj.
7. **Każda wielkość ma obok sposób odtworzenia.** Liczba bez tego sposobu nie wchodzi do artefaktu.
8. **Puste musi wyglądać na puste.** Nieznana wielkość zostaje pusta, nie zerowa.
9. **Nazwy podmiotów, klientów i ram organizacyjnych nie wchodzą jako domysł.** Przy braku wpisz `[do potwierdzenia]`.
10. **Zmiana szablonu wymaga oceny wpływu** na procedurę, przykład, kontrakt danych i ADR-y — patrz [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md).

## Kolejność czytania

1. [plan operacji](plan-operacji.md) — niesie stan scenariusza i jest punktem odniesienia dla pozostałych.
2. [dziennik operacyjny](dziennik-operacyjny.md) — niesie historię zdarzeń.
3. [SITREP](sitrep.md) — raport przyrostowy w trakcie.
4. [BMS](wpis-bms.md) — wpis w widoku stanu, który jest widokiem powyższych, nie ich zamiennikiem.

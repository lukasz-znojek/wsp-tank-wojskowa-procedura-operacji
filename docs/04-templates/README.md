# Szablony

Szablon opisuje **format zapisu** artefaktu: jakie pola, jakie tabele, jakie wartości dopuszczone. Nie opisuje przebiegu działania — ten należy do [procedury](../03-procedures/README.md) — i nie zawiera wypełnionych danych, które należą do [przykładu](../../examples/).

Szablon pozostaje pusty. Wypełniony szablon przestaje być szablonem i staje się przykładem albo artefaktem scenariusza.

## Zawartość katalogu

| Szablon | Artefakt | Kontrakt danych | Przykład |
| --- | --- | --- | --- |
| [bms.md](bms.md) | wpis w widoku stanu | [`schemas/bms-event.schema.json`](../../schemas/bms-event.schema.json) | nie dotyczy — wpisy widoku pokazuje [dziennik komunikatów](../../examples/communication-log-example.md) |
| [dziennik-operacyjny.md](dziennik-operacyjny.md) | dziennik operacyjny | [`schemas/message.schema.json`](../../schemas/message.schema.json) | [`examples/communication-log-example.md`](../../examples/communication-log-example.md) |
| [plan-operacji.md](plan-operacji.md) | plan operacji | [`schemas/operation.schema.json`](../../schemas/operation.schema.json) | [`examples/operation-example-alpha.md`](../../examples/operation-example-alpha.md) |
| [sitrep.md](sitrep.md) | SITREP | [`schemas/sitrep.schema.json`](../../schemas/sitrep.schema.json) | [`examples/sitrep-example.md`](../../examples/sitrep-example.md) |

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
4. [BMS](bms.md) — wpis w widoku stanu, który jest widokiem powyższych, nie ich zamiennikiem.

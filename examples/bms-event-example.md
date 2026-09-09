# DANE SYNTETYCZNE

## Przykład: wpis BMS scenariusza ALFA

Przykład fikcyjny, utworzony wyłącznie w celu szkoleniowym i projektowym. Wszystkie nazwy, identyfikatory, czasy i punkty odniesienia są wymyślone i nie odnoszą się do żadnych rzeczywistych podmiotów, jednostek, osób ani lokalizacji.

Szablon źródłowy: [`docs/04-templates/wpis-bms.md`](../docs/04-templates/wpis-bms.md). Kontrakt danych: [`schemas/bms-event.schema.json`](../schemas/bms-event.schema.json). Postać maszynowa: [`bms-event-example-alpha.json`](bms-event-example-alpha.json).

## Metryka wpisu

| Pole | Wartość |
| --- | --- |
| ID | `BMS-ALFA-001` |
| Tytuł | Plan `OP-ALFA-001` opublikowany po kontroli kontraktu |
| Status | zatwierdzony |
| Autor | Analityk-01 |
| Czas utworzenia | puste - przykład syntetyczny nie zapisuje czasu rzeczywistego; pole kontraktu `created_at` jest opcjonalne |
| Czas zdarzenia | `T+01:20` |
| Typ | zmiana-statusu |
| Priorytet | niski |
| Poziom pewności | potwierdzone |
| Dane syntetyczne | tak |

## Opis

Plan `OP-ALFA-001` przeszedł ze stanu `zatwierdzony` do stanu `opublikowany`. Zmianę wykonał Koordynator-01 po kontroli kontraktu zakończonej kodem 0; źródłem wpisu jest komunikat `MSG-ALFA-005` z rejestru zdarzeń dziennika.

Wpis niesie stan odczytany z pliku, nie drugą prawdę: gdyby plan i widok się rozjechały, rozstrzyga metryka planu w [`operation-example-alpha.md`](operation-example-alpha.md).

## Źródła i powiązania

| Rodzaj | Identyfikator | Uwagi |
| --- | --- | --- |
| źródło | `MSG-ALFA-005` | wiersz `T+01:20` w [`communication-log-example.md`](communication-log-example.md) |
| powiązany artefakt | `OP-ALFA-001` | plan operacji, którego zmianę stanu wpis odnotowuje |
| punkt odniesienia | `Punkt-A` | punkt abstrakcyjny scenariusza |

## Potwierdzenie odbioru

| Pole | Wartość |
| --- | --- |
| Potwierdzono | tak |
| Kto potwierdził | Koordynator-01 |
| Uwagi | odbiór wpisu razem z odbiorem etapu 3 |

## Historia zmian

| Poprzedni stan | Nowy stan | Rola decyzyjna | Uzasadnienie |
| --- | --- | --- | --- |
| - | szkic | Analityk-01 | utworzenie wpisu wg szablonu po publikacji planu |
| szkic | do-przegladu | Analityk-01 | źródło wskazane, poziom pewności `potwierdzone` uzasadniony wierszem dziennika |
| do-przegladu | zatwierdzony | Koordynator-01 | przegląd potwierdził zgodność wpisu z metryką planu i wierszem `MSG-ALFA-005` |

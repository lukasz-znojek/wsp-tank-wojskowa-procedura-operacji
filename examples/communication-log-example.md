# DANE SYNTETYCZNE

## Przykład: dziennik komunikatów scenariusza ALFA

Przykład fikcyjny, utworzony wyłącznie w celu szkoleniowym i projektowym. Wszystkie nazwy, identyfikatory, czasy i punkty odniesienia są wymyślone i nie odnoszą się do żadnych rzeczywistych podmiotów, jednostek, osób ani lokalizacji.

Szablon źródłowy: [`docs/04-templates/dziennik-operacyjny.md`](../docs/04-templates/dziennik-operacyjny.md). Kontrakt danych komunikatów: [`schemas/message.schema.json`](../schemas/message.schema.json).

## Metryka dziennika

| Pole | Wartość |
| --- | --- |
| Identyfikator scenariusza | `OP-ALFA-001` |
| Okres | scenariusz ALFA, etapy 1–3 |
| Prowadzący | Koordynator-01 |
| Dane syntetyczne | tak |

## Rejestr zdarzeń

| Czas | ID artefaktu | Zdarzenie | Status | Autor | Uwagi |
| --- | --- | --- | --- | --- | --- |
| T+00:00 | `MSG-ALFA-001` | Koordynator-01 zleca Analitykowi-01 utworzenie planu scenariusza ALFA | zatwierdzony | Koordynator-01 | Punkt-A |
| T+00:15 | `MSG-ALFA-002` | Analityk-01 przekazuje plan `OP-ALFA-001` do przeglądu | zatwierdzony | Analityk-01 | Punkt-A |
| T+00:40 | `MSG-ALFA-003` | Recenzent-01 wskazuje brak powiązania między planem a dziennikiem | zatwierdzony | Recenzent-01 | Punkt-B |
| T+01:05 | `MSG-ALFA-004` | Koordynator-01 zatwierdza plan po uzupełnieniu powiązania | zatwierdzony | Koordynator-01 | Punkt-A |
| T+01:20 | `MSG-ALFA-005` | Koordynator-01 publikuje plan `OP-ALFA-001` po kontroli kontraktu | opublikowany | Koordynator-01 | Punkt-A |

## Rejestr naruszeń

| Kiedy | Pozycja | Reguła | Zmierzone | Wymagane | Runda |
| --- | --- | --- | --- | --- | --- |
| T+00:40 | 1 | Artefakt wskazuje co najmniej jedno powiązanie, gdy relacja istnieje (`WF-5`) | 0 powiązań w sekcji planu | co najmniej 1 powiązanie | 1 |

Naruszenie wystąpiło raz i zostało usunięte w tej samej rundzie. Reguła nie wymaga przepisania: przepisuje się ją po trzecim naruszeniu przez różnych wykonawców.

## Powiązane artefakty

| Rodzaj | Identyfikator albo odnośnik |
| --- | --- |
| plan operacji | `OP-ALFA-001` — [`operation-example-alpha.md`](operation-example-alpha.md) |
| SITREP | `SITREP-ALFA-001` — [`sitrep-example.md`](sitrep-example.md) |

## Uwagi

Czasy są etykietami względnymi scenariusza w formacie `T+HH:MM`, nie znacznikami czasu rzeczywistego. Punkty odniesienia `Punkt-A` i `Punkt-B` są abstrakcyjne i nie odpowiadają żadnym lokalizacjom.

Wiersz `MSG-ALFA-003` jest jedynym, który zgłasza lukę — i to on uruchamia wpis w rejestrze naruszeń. Pozostałe cztery komunikaty prowadzą plan przez cykl życia artefaktu: utworzenie, przekazanie do przeglądu, zatwierdzenie, publikacja.

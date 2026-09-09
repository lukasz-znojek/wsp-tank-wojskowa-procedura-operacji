# Szablon: wpis BMS

> Wyłącznie dane syntetyczne. Kontrakt danych: [`schemas/bms-event.schema.json`](../../schemas/bms-event.schema.json).

Szablon opisuje **format zapisu** jednego wpisu w widoku stanu scenariusza. Przebieg działania, który taki wpis wytwarza, opisuje [procedura przejazdu](../03-procedures/przejazd.md).

## Zasada wiodąca

Plan operacji i dziennik operacyjny są **źródłem prawdy**. Widok stanu jest widokiem i kanałem zwrotnym, **nigdy drugą prawdą** — przy rozjeździe rozstrzyga plik.

| Kierunek | Co niesie |
| --- | --- |
| plan operacji → widok | stany pozycji mapy, zadania w toku, wielkości zmierzone |
| dziennik operacyjny → widok | rejestr zdarzeń, rejestr naruszeń |
| widok → autor prowadzący | zgłoszenia koordynatora: odbiór pozycji, rozstrzygnięcie, uwaga |

Zgłoszenie koordynatora w widoku **nie zmienia stanu scenariusza samo z siebie**. Autor prowadzący je odczytuje, przepisuje do planu operacji i dopiero ten zapis jest stanem. Dlatego widok musi rozróżniać „zgłoszone, czeka na przepisanie" od „potwierdzone z pliku".

## Metryka wpisu

| Pole | Wartość | Uwagi do wypełnienia |
| --- | --- | --- |
| ID | `[ ]` | wzorzec `^[A-Z0-9-]+$`, wyłącznie syntetyczny |
| Tytuł | [ ] | do 200 znaków, jedno zdanie oznajmujące |
| Status | szkic / do-przegladu / zatwierdzony / opublikowany / odrzucony | dokładnie jedna z pięciu wartości — patrz [model stanów](../02-architecture/model-stanow.md) |
| Autor | [ ] | oznaczenie syntetyczne roli, np. `Analityk-01`; nigdy imię i nazwisko |
| Czas utworzenia | [ ] | znacznik czasu zapisu dokumentu |
| Czas zdarzenia | `T+[ ]:[ ]` | **względna etykieta scenariusza**, nie czas rzeczywisty |
| Typ | obserwacja / zadanie / decyzja / zmiana-statusu / adnotacja | jedna wartość ze słownika kontraktu |
| Priorytet | niski / sredni / wysoki | |
| Poziom pewności | potwierdzone / prawdopodobne / niepotwierdzone | `potwierdzone` wymaga wskazanego źródła w sekcji niżej |
| Dane syntetyczne | tak | pole obowiązkowe; wartość inna niż `tak` unieważnia wpis |

## Opis

[ ]

Jedno zdanie faktu, potem kontekst. Ocena należy do poziomu pewności, nie do opisu.

## Źródła i powiązania

| Rodzaj | Identyfikator | Uwagi |
| --- | --- | --- |
| źródło | `[ ]` | wzorzec `^[A-Z0-9-]+$` |
| powiązany artefakt | `[ ]` | plan operacji, komunikat albo SITREP |
| punkt odniesienia | `Punkt-[ ]` | **abstrakcyjny** punkt scenariusza; nigdy rzeczywista lokalizacja ani współrzędne |

## Potwierdzenie odbioru

| Pole | Wartość |
| --- | --- |
| Potwierdzono | tak / nie |
| Kto potwierdził | [ ] |
| Uwagi | [ ] |

Brak potwierdzenia jest stanem dopuszczalnym i musi wyglądać na brak, nie na odmowę.

## Czego wpis nie zawiera

- Prognoz terminu bez przelicznika wskazanego w źródle.
- Ocen postawionych w miejscu pomiaru.
- Treści dokumentów — wpis niesie stan, nie dorobek.
- Rzeczywistych lokalizacji, współrzędnych geograficznych, danych osobowych i danych operacyjnych. Kontrakt danych celowo nie ma pól, które by je przyjęły.

## Powiązane artefakty

- Procedura: [przejazd](../03-procedures/przejazd.md)
- Kontrakt danych: [`schemas/bms-event.schema.json`](../../schemas/bms-event.schema.json)
- Architektura: [architektura BMS](../02-architecture/architektura-bms.md), [model stanów](../02-architecture/model-stanow.md)
- Referencja projektowa: [prompt projektowy interfejsu BMS](../05-reference/prompt-bms-design.md)

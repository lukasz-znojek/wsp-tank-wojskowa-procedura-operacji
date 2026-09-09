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

**Odwzorowanie na kontrakt danych** - kolumna „Obowiązkowość” odpowiada liście `required` w kontrakcie [`bms-event.schema.json`](../../schemas/bms-event.schema.json); odtworzenie: `grep -n required schemas/bms-event.schema.json`. Wartość `wymagane` oznacza pole z listy `required`, `opcjonalne` - pole z `properties` poza tą listą, `poza kontraktem` - element szablonu bez własności w kontrakcie (kontrakt ma `additionalProperties: false`, więc taki element nie wchodzi do artefaktu JSON).

| Pole szablonu | Własność kontraktu | Obowiązkowość |
| --- | --- | --- |
| ID | `id` | wymagane |
| Tytuł | `title` | wymagane |
| Status | `status` | wymagane |
| Autor | `author_role` | opcjonalne |
| Czas utworzenia | `created_at` | opcjonalne |
| Czas zdarzenia | `event_time_label` | opcjonalne |
| Typ | `event_type` | wymagane |
| Priorytet | `priority` | opcjonalne |
| Poziom pewności | `confidence` | wymagane |
| Dane syntetyczne | `synthetic` (stała `true`) | wymagane |
| Opis | `description` | wymagane |
| Źródło | `sources` | opcjonalne |
| Powiązany artefakt | `related_artifacts` | opcjonalne |
| Punkt odniesienia | `reference_points` | opcjonalne |
| Potwierdzono | `acknowledged` | opcjonalne |
| Kto potwierdził | brak | poza kontraktem |
| Uwagi (potwierdzenie odbioru) | brak | poza kontraktem |

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

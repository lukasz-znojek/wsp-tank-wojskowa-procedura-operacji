# Szablon: komunikat

> Wyłącznie dane syntetyczne. Kontrakt danych: [`schemas/message.schema.json`](../../schemas/message.schema.json).

Szablon opisuje **format zapisu jednego komunikatu** wymienionego między rolami w fikcyjnym scenariuszu. Rejestr wielu komunikatów opisuje [szablon dziennika operacyjnego](dziennik-operacyjny.md); przebieg działania, który komunikat wytwarza, opisuje [procedura łączności](../03-procedures/lacznosc.md).

## Metryka komunikatu

| Pole | Wartość | Uwagi do wypełnienia |
| --- | --- | --- |
| Identyfikator komunikatu | `[ ]` | wzorzec `^[A-Z0-9-]+$`, np. `MSG-ALFA-001` |
| Czas | `T+[ ]:[ ]` | **etykieta względna** scenariusza w formacie `T+HH:MM`; nigdy czas rzeczywisty |
| Nadawca | [ ] | oznaczenie syntetyczne roli, np. `Koordynator-01`; nigdy imię i nazwisko |
| Odbiorca | [ ] | oznaczenie syntetyczne roli, np. `Analityk-01` |
| Kanał | symulowany-tekstowy / symulowany-glosowy / notatka-wewnetrzna | jedna wartość ze słownika kontraktu |
| Punkt odniesienia | `Punkt-[ ]` | **punkt abstrakcyjny** scenariusza, np. `Punkt-A`; nigdy rzeczywista lokalizacja, adres ani współrzędne |
| Temat | [ ] | do 200 znaków, jedno zdanie oznajmujące |
| Poziom pewności | potwierdzone / prawdopodobne / niepotwierdzone | `potwierdzone` wymaga wskazanego artefaktu źródłowego w sekcji powiązań |
| Stan artefaktu | szkic / do-przegladu / zatwierdzony / opublikowany / odrzucony | patrz [model stanów](../02-architecture/model-stanow.md) |
| Dane syntetyczne | tak | pole obowiązkowe; wartość inna niż `tak` unieważnia komunikat |

**Odwzorowanie na kontrakt danych** - kolumna „Obowiązkowość” odpowiada liście `required` w kontrakcie [`message.schema.json`](../../schemas/message.schema.json); odtworzenie: `grep -n required schemas/message.schema.json`. Wartość `wymagane` oznacza pole z listy `required`, `opcjonalne` - pole z `properties` poza tą listą, `poza kontraktem` - element szablonu bez własności w kontrakcie (kontrakt ma `additionalProperties: false`, więc taki element nie wchodzi do artefaktu JSON).

| Pole szablonu | Własność kontraktu | Obowiązkowość |
| --- | --- | --- |
| Identyfikator komunikatu | `id` | wymagane |
| Czas | `sent_at_label` | opcjonalne |
| Nadawca | `sender_role` | wymagane |
| Odbiorca | `recipient_role` | wymagane |
| Kanał | `channel` | opcjonalne |
| Punkt odniesienia | brak | poza kontraktem |
| Temat | `subject` | wymagane |
| Poziom pewności | `confidence` | opcjonalne |
| Stan artefaktu | `status` | wymagane |
| Dane syntetyczne | `synthetic` (stała `true`) | wymagane |
| Treść | `body` | wymagane |
| Powiązane artefakty (plan operacji, artefakt źródłowy, wpis BMS) | `related_artifacts` | opcjonalne |
| Potwierdzono | `acknowledged` | opcjonalne |
| Kto potwierdził | brak | poza kontraktem |
| Uwagi (potwierdzenie odbioru) | brak | poza kontraktem |
| Historia zmian | brak | poza kontraktem |

## Treść

[ ]

Jedno zdanie faktu, potem kontekst. Ocena należy do poziomu pewności, nie do treści.

## Powiązane artefakty

| Rodzaj | Identyfikator | Uwagi |
| --- | --- | --- |
| plan operacji | `[ ]` | powiązanie obowiązkowe |
| artefakt źródłowy | `[ ]` | obowiązkowy, gdy poziom pewności to `potwierdzone` |
| wpis BMS | `[ ]` | opcjonalny |

## Potwierdzenie odbioru

| Pole | Wartość |
| --- | --- |
| Potwierdzono | tak / nie |
| Kto potwierdził | [ ] |
| Uwagi | [ ] |

Brak potwierdzenia jest stanem dopuszczalnym i musi wyglądać na brak, nie na odmowę.

## Historia zmian

| Poprzedni stan | Nowy stan | Rola decyzyjna | Uzasadnienie |
| --- | --- | --- | --- |
|  |  |  |  |

Wiersz przy każdej zmianie stanu — wymaganie [`WF-6`](../01-product/wymagania.md). Rejestr zbiorczy prowadzi [dziennik operacyjny](dziennik-operacyjny.md).

## Czego komunikat nie zawiera

- Czasu rzeczywistego, daty bezwzględnej ani terminu odnoszącego się do rzeczywistości.
- Rzeczywistych lokalizacji, adresów i współrzędnych geograficznych.
- Danych osobowych nadawcy i odbiorcy — wyłącznie oznaczenia ról.
- Treści dokumentów przekazywanych w komunikacie; komunikat wskazuje artefakt identyfikatorem.

## Powiązane artefakty

- Procedura: [łączność](../03-procedures/lacznosc.md)
- Szablony: [dziennik operacyjny](dziennik-operacyjny.md), [wpis BMS](wpis-bms.md)
- Kontrakt danych: [`schemas/message.schema.json`](../../schemas/message.schema.json)
- Przykład: [`examples/communication-log-example.md`](../../examples/communication-log-example.md)

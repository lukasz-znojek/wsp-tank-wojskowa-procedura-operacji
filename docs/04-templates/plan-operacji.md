# Szablon: plan operacji

> Wyłącznie dane syntetyczne. Kontrakt danych: [`schemas/operation.schema.json`](../../schemas/operation.schema.json).

Plan niesie **stan** fikcyjnego scenariusza i jest nadpisywany. Historia zdarzeń należy do [dziennika operacyjnego](dziennik-operacyjny.md). Przebieg działania, który plan wytwarza, opisuje [procedura think-tank](../03-procedures/think-tank.md).

## Metryka planu

| Pole | Wartość | Uwagi do wypełnienia |
| --- | --- | --- |
| ID | `[ ]` | wzorzec `^[A-Z0-9-]+$` |
| Nazwa syntetyczna | [ ] | oznaczenie abstrakcyjne, np. `ALFA`; nazw rzeczywistych podmiotów nie wpisuj — przy braku wpisz `[do potwierdzenia]` |
| Status | szkic / do-przegladu / zatwierdzony / opublikowany / odrzucony | patrz [model stanów](../02-architecture/model-stanow.md) |
| Właściciel | [ ] | oznaczenie syntetyczne roli, np. `Koordynator-01` |
| Wersja | [ ] | wzorzec `MAJOR.MINOR.PATCH` — patrz [polityka wersjonowania](../06-governance/polityka-wersjonowania.md) |
| Przejazd | [ ] | licznik zamkniętych cykli etapu |
| Postęp | [ ] / [ ] | pozycje zaliczone wobec wszystkich; osobno główne, osobno poboczne |
| Dane syntetyczne | tak | pole obowiązkowe |

**Odwzorowanie na kontrakt danych** - kolumna „Obowiązkowość” odpowiada liście `required` w kontrakcie [`operation.schema.json`](../../schemas/operation.schema.json); odtworzenie: `grep -n required schemas/operation.schema.json`. Wartość `wymagane` oznacza pole z listy `required`, `opcjonalne` - pole z `properties` poza tą listą, `poza kontraktem` - element szablonu bez własności w kontrakcie (kontrakt ma `additionalProperties: false`, więc taki element nie wchodzi do artefaktu JSON).

| Pole szablonu | Własność kontraktu | Obowiązkowość |
| --- | --- | --- |
| ID | `id` | wymagane |
| Nazwa syntetyczna | `title` (nazwa planu jako tekst do 200 znaków) | wymagane |
| Status | `status` | wymagane |
| Właściciel | `owner_role` | opcjonalne |
| Wersja | `version` | wymagane |
| Przejazd | brak | poza kontraktem |
| Postęp | brak | poza kontraktem |
| Dane syntetyczne | `synthetic` (stała `true`) | wymagane |
| Cel scenariusza | `scenario_goal` | wymagane |
| Założenia przyjęte | `assumptions` | opcjonalne |
| Role | `roles` (element: `role`, `label` - oba wymagane w elemencie) | opcjonalne |
| Etapy | `stages` (element: `ordinal`, `name`, `status` wymagane; `expected_result`, `verification` opcjonalne) | wymagane |
| Etapy, kolumna „Stan” | `stages[].status` - słownik stanu pozycji mapy: `niezaliczone`, `w-toku` (zapis maszynowy stanu „w toku”), `zielone`, `odrzucone`; odrębny od cyklu życia artefaktu w polu `status` planu | wymagane w elemencie |
| Kryteria ukończenia | `completion_criteria` | opcjonalne |
| Ryzyka i luki | `risks` | opcjonalne |
| Powiązane artefakty | `related_artifacts` | opcjonalne |

## Cel scenariusza

**Opis:** [dwa–trzy zdania: co ten scenariusz robi i po co]

**Cel:** [jeden sprawdzalny stan końcowy — pozycja pierwsza mapy etapów]

**Dowód:** [polecenie albo sprawdzian, który rozstrzyga]

**Zamiar:** [po co ten cel istnieje — to pole rozstrzyga korekty kursu bez wracania do koordynatora]

**Progi przerwania** — odwrotność celu, ustalane przez koordynatora w think-tanku, nie przez autora prowadzącego w toku pracy:

| Próg | Wartość | Stan |
| --- | --- | --- |
| zużycie w toku głównym | powyżej [ ] | poniżej / **przekroczony** |
| przejazdy zamknięte bez zaliczenia pozycji pierwszej | co najmniej [ ] | poniżej / **przekroczony** |
| zadanie utracone bez zapisanego produktu | wystąpiło | nie / **tak** |

Skutek przekroczenia: **przerwa w pracy** — zapis, utrwalenie zmian, SITREP i rozstrzygnięcie koordynatora: kontynuacja, zmiana obsady albo wycofanie z raportem. Wycofanie jest rozstrzygnięciem, nie stratą. Tryby pracy bez raportów pośrednich i bez przerw na odbiór progów **nie znoszą**.

## Kontekst i założenia

**Położenie** — wynik [rozpoznania](../03-procedures/rozpoznanie.md):

| Co | Czym sprawdzone | Wynik |
| --- | --- | --- |
|  |  |  |

**Nieustalone** (korzeń · wzorzec · wykluczenia): [ ]

**Założenia przyjęte** — każde z sposobem sprawdzenia; założenie bez niego wchodzi jako niesprawdzone:

| # | Założenie | Czym sprawdzone | Status |
| --- | --- | --- | --- |
|  |  |  |  |

## Role

| Rola | Oznaczenie syntetyczne | Zakres |
| --- | --- | --- |
| koordynator |  |  |
| autor |  |  |
| recenzent |  |  |
| administrator |  |  |

Zakresy odpowiedzialności: [role i uprawnienia](../01-product/role-i-uprawnienia.md).

## Etapy

Mapa etapów: pozycje główne w kolejności zależności, potem pozycje poboczne (`P1`, `P2`…) w tej samej tabeli. Pozycja pierwsza opisuje rezultat kompletny, nie fragment.

| # | Etap | Rezultat | Sposób sprawdzenia | Stan |
| --- | --- | --- | --- | --- |
| 1 |  |  |  | niezaliczone |
| P1 |  |  |  | niezaliczone |

Pozycja bez wypełnionej kolumny „sposób sprawdzenia" nie wchodzi do mapy.

Kolumna „Stan” używa słownika stanu pozycji mapy: `niezaliczone` → `w toku` → `zielone`, plus `odrzucone`. To słownik odrębny od cyklu życia artefaktu, którym opisany jest status całego planu - patrz [model stanów](../02-architecture/model-stanow.md) i [ADR-005](../02-architecture/decyzje/adr-005-stan-pozycji-w-kontrakcie.md). W kontrakcie stan „w toku” ma zapis `w-toku`.

## Kryteria ukończenia

[ ]

Kryterium musi dać się sprawdzić, nie ocenić — patrz [kryteria akceptacji](../01-product/kryteria-akceptacji.md).

## Ryzyka i luki

| # | Ryzyko albo luka | Wyzwalacz | Skutek | Co ją obali |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

**Operacje nieodwracalne** — kolumna „jak cofnąć" jest obowiązkowa; jej brak stawia rozstrzygnięcie u koordynatora bezwarunkowo:

| Operacja | Zasięg skutków | Kto wykonuje | Jak cofnąć |
| --- | --- | --- | --- |
|  |  | człowiek / autor prowadzący |  |

**Zależności zewnętrzne** — uruchamiane od razu, nie w chwili zablokowania:

| Rzecz | Od kogo | Co blokuje | Ile trwa | Uruchomiona |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

Zależność nieuruchomiona o długim czasie realizacji jest ostrzeżeniem, nie wierszem tabeli.

## Powiązane artefakty

| Rodzaj | Identyfikator albo odnośnik |
| --- | --- |
| dziennik operacyjny | [ ] |
| widok stanu | [ ] |
| SITREP | [ ] |
| mechanizm walidacji | [ ] |

## Raport końcowy

Wypełniany wg [procedury meldunku](../03-procedures/meldunek.md), po ostatnim przejeździe.

**Koszt zespołu** — każda wielkość z sposobem odtworzenia:

| Pozycja | Wartość | Czym odtworzyć |
| --- | --- | --- |
| szczyt zużycia w toku głównym |  |  |
| przejazdy |  |  |
| zadania analityczne |  |  |

**Rezultaty i straty** — rezultaty przed stratami; przy stracie wniosek jest obowiązkowy:

| # | Rezultat / strata | Wielkość albo koszt | Wniosek |
| --- | --- | --- | --- |
|  |  |  |  |

**Odrzucone po drodze:** [pozycja · powód]

**Przegląd poobserwacyjny** — cztery pytania, każde z dowodem wskazującym dokument i wiersz:

1. Co miało się wydarzyć: [ ]
2. Co się wydarzyło: [z dziennika; rozjazdy wypisane, nie wygładzone]
3. Co poszło dobrze, co źle i dlaczego: [ ]
4. Jak wykonać do standardu następnym razem: [ ]

**Wnioski:**

| # | Wniosek | Dowód | Zmiana procedury albo dokumentu | Sprawdzian |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

Wniosek bez sprawdzianu wchodzi ze statusem niesprawdzone.

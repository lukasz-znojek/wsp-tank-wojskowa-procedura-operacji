# DANE SYNTETYCZNE

## Przykład: plan operacji ALFA

Przykład fikcyjny, utworzony wyłącznie w celu szkoleniowym i projektowym. Wszystkie nazwy, identyfikatory, czasy i punkty odniesienia są wymyślone i nie odnoszą się do żadnych rzeczywistych podmiotów, jednostek, osób ani lokalizacji.

Szablon źródłowy: [`docs/04-templates/plan-operacji.md`](../docs/04-templates/plan-operacji.md). Kontrakt danych: [`schemas/operation.schema.json`](../schemas/operation.schema.json).

## Metryka planu

| Pole | Wartość |
| --- | --- |
| ID | `OP-ALFA-001` |
| Nazwa syntetyczna | ALFA |
| Status | opublikowany |
| Właściciel | Koordynator-01 |
| Wersja | 1.0.0 |
| Postęp | 3 / 3 |
| Dane syntetyczne | tak |

## Cel scenariusza

**Opis:** Scenariusz ALFA jest ćwiczeniem porządkowania informacji na fikcyjnym materiale dokumentowym. Uczestnicy tworzą plan, rejestrują komunikaty i opracowują raport sytuacyjny, ćwicząc rozdział faktów od hipotez.

**Cel:** Zestaw trzech artefaktów scenariusza — plan, dziennik komunikatów i raport SITREP — jest kompletny, wzajemnie powiązany identyfikatorami i przechodzi kontrolę odpowiednich kontraktów danych.

**Dowód:** `python3 scripts/validate_schemas.py` kończy się kodem 0, a każdy z trzech artefaktów wskazuje co najmniej jeden powiązany identyfikator.

**Zamiar:** Uczestnik ma po scenariuszu odróżniać twierdzenie ze wskazanym źródłem od hipotezy z falsyfikatorem i wiedzieć, gdzie każde z nich zapisać.

## Kontekst i założenia

**Położenie:**

| Co | Czym sprawdzone | Wynik |
| --- | --- | --- |
| Szablony trzech artefaktów istnieją | obecność plików w `docs/04-templates/` | plan, komunikat i SITREP dostępne |
| Kontrakty danych przechodzą kontrolę | `python3 scripts/validate_schemas.py` | kod 0, cztery kontrakty |
| Słownik stanów artefaktu jest ustalony | [model stanów](../docs/02-architecture/model-stanow.md) | pięć wartości, przejścia opisane |

**Nieustalone** (korzeń · wzorzec · wykluczenia): brak — scenariusz szkoleniowy nie ma niewiadomych poza wprowadzonymi celowo w etapie 2.

**Założenia przyjęte:**

| # | Założenie | Czym sprawdzone | Status |
| --- | --- | --- | --- |
| 1 | Uczestnicy znają rozdział procedury, szablonu i przykładu | [ADR-004](../docs/02-architecture/decyzje/adr-004-rozdzielenie-artefaktow.md) przeczytany przed startem | przyjęte |
| 2 | Trzy etapy wystarczają do pokazania rozdziału faktów i hipotez | scenariusz przeprowadzony do końca daje raport z obiema sekcjami wypełnionymi | przyjęte |

## Role

| Rola | Oznaczenie syntetyczne | Zakres |
| --- | --- | --- |
| koordynator | Koordynator-01 | zatwierdza plan, publikuje artefakty, rozstrzyga przy odrzuceniu |
| autor | Analityk-01 | tworzy plan, rejestruje komunikaty, opracowuje raport |
| recenzent | Recenzent-01 | sprawdza artefakty wobec kryteriów akceptacji |

## Etapy

| # | Etap | Rezultat | Sposób sprawdzenia | Stan |
| --- | --- | --- | --- | --- |
| 1 | Przygotowanie planu | plan `OP-ALFA-001` z metryką, celem i trzema etapami | plan przechodzi kontrolę `operation.schema.json`; pole `synthetic` ma wartość `true` | zielone |
| 2 | Rejestracja komunikatów | dziennik z pięcioma komunikatami `MSG-ALFA-001` … `MSG-ALFA-005` | każdy komunikat ma czas w formacie `T+HH:MM`, nadawcę, odbiorcę i powiązanie | zielone |
| 3 | Opracowanie raportu | raport `SITREP-ALFA-001` z rozdzielonymi faktami i hipotezami | każde twierdzenie potwierdzone wskazuje artefakt źródłowy; każda hipoteza ma falsyfikator | zielone |

Stan pozycji planu używa słownika `niezaliczone → w toku → zielone → odrzucone`, odrębnego od cyklu życia artefaktu — patrz [model stanów](../docs/02-architecture/model-stanow.md).

## Kryteria ukończenia

1. Trzy artefakty scenariusza istnieją i mają wypełnione pola obowiązkowe swoich kontraktów.
2. Każdy artefakt wskazuje co najmniej jeden powiązany identyfikator.
3. Każde twierdzenie w sekcji informacji potwierdzonych raportu wskazuje artefakt źródłowy.
4. Każda hipoteza w raporcie ma poziom pewności i falsyfikator.
5. `python3 scripts/validate_schemas.py` oraz `bash scripts/validate_markdown.sh` kończą się kodem 0.

## Ryzyka i luki

| # | Ryzyko albo luka | Wyzwalacz | Skutek | Co ją obali |
| --- | --- | --- | --- | --- |
| 1 | Uczestnik wpisze twierdzenie bez źródła do sekcji informacji potwierdzonych | pośpiech przy etapie 3 | raport traci rozdział faktów od hipotez, czyli cel scenariusza | przegląd potwierdza, że każde twierdzenie potwierdzone wskazuje artefakt źródłowy |
| 2 | Komunikat dostanie czas bezwzględny zamiast etykiety względnej | odruch zapisu daty | artefakt przestaje być zgodny z kontraktem `message.schema.json` | kontrola wzorca `^T\+[0-9]{2}:[0-9]{2}$` we wszystkich pięciu komunikatach |
| 3 | Powiązania między artefaktami zostaną pominięte | etapy prowadzone niezależnie przez różne osoby | wymaganie `WF-5` niespełnione, artefakty rozłączne | przegląd kompletności potwierdza powiązanie w każdym z trzech artefaktów |

## Powiązane artefakty

| Rodzaj | Identyfikator albo odnośnik |
| --- | --- |
| dziennik komunikatów | [`communication-log-example.md`](communication-log-example.md) |
| SITREP | `SITREP-ALFA-001` — [`sitrep-example.md`](sitrep-example.md) |
| komunikaty | `MSG-ALFA-001` … `MSG-ALFA-005` |

## Historia zmian

| Poprzedni stan | Nowy stan | Rola decyzyjna | Uzasadnienie |
| --- | --- | --- | --- |
| — | szkic | Analityk-01 | utworzenie planu wg szablonu |
| szkic | do-przegladu | Analityk-01 | metryka, cel i trzy etapy wypełnione |
| do-przegladu | zatwierdzony | Koordynator-01 | przegląd bez zastrzeżeń, kryteria ukończenia sprawdzalne |
| zatwierdzony | opublikowany | Koordynator-01 | kontrola kontraktu zakończona kodem 0 |

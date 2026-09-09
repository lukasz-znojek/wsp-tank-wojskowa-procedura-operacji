# DANE SYNTETYCZNE

## Przykład: SITREP scenariusza ALFA

Przykład fikcyjny, utworzony wyłącznie w celu szkoleniowym i projektowym. Wszystkie nazwy, identyfikatory, czasy i punkty odniesienia są wymyślone i nie odnoszą się do żadnych rzeczywistych podmiotów, jednostek, osób ani lokalizacji.

Szablon źródłowy: [`docs/04-templates/sitrep.md`](../docs/04-templates/sitrep.md). Kontrakt danych: [`schemas/sitrep.schema.json`](../schemas/sitrep.schema.json).

## Metryka raportu

| Pole | Wartość |
| --- | --- |
| ID | `SITREP-ALFA-001` |
| Status | zatwierdzony |
| Identyfikator scenariusza | `OP-ALFA-001` |
| Okres raportowania | scenariusz ALFA, etapy 1–3 |
| Autor | Analityk-01 |
| Dane syntetyczne | tak |

**Położenie:** etap 3 · przejście etapu 3 · zlecenie cząstkowe: opracowanie raportu z rozdziałem faktów i hipotez.

**Kurs:** w granicach zamiaru — rozdział twierdzeń potwierdzonych od hipotez został zachowany bez korekty zakresu.

## Podsumowanie

Trzy etapy scenariusza ALFA są zaliczone. Plan `OP-ALFA-001` jest opublikowany, dziennik zawiera pięć komunikatów, a ten raport zamyka etap trzeci. Na koordynatora nie czeka żadne rozstrzygnięcie. Najbardziej narażona na niepowodzenie jest kompletność powiązań między artefaktami: jedna luka tego rodzaju wystąpiła już w etapie pierwszym.

## Potwierdzone informacje

| # | Twierdzenie | Źródło | Czym sprawdzone |
| --- | --- | --- | --- |
| 1 | Plan `OP-ALFA-001` zawiera trzy etapy | `OP-ALFA-001` | tabela etapów w [`operation-example-alpha.md`](operation-example-alpha.md), trzy wiersze |
| 2 | Dziennik zawiera komunikat `MSG-ALFA-001` | [`communication-log-example.md`](communication-log-example.md) | wiersz `T+00:00` w rejestrze zdarzeń |
| 3 | Plan `OP-ALFA-001` jest w stanie `opublikowany` | `OP-ALFA-001` | metryka planu oraz ostatni wiersz jego historii zmian |

Do tej sekcji weszły wyłącznie twierdzenia ze wskazanym źródłem i sposobem sprawdzenia.

## Oceny i hipotezy

| # | Hipoteza | Poziom pewności | Co ją obali |
| --- | --- | --- | --- |
| 1 | Przegląd kompletności może ujawnić brak powiązania artefaktu | prawdopodobne | przegląd potwierdza kompletność wszystkich powiązań we wszystkich trzech artefaktach |
| 2 | Wersja robocza raportu może wymagać doprecyzowania źródła informacji | niepotwierdzone | każde twierdzenie w raporcie wskazuje artefakt źródłowy |

Hipoteza 1 opiera się na jednym zaobserwowanym wystąpieniu: naruszenie `WF-5` odnotowane w rejestrze naruszeń dziennika o czasie `T+00:40`. Hipoteza 2 nie ma dziś żadnego wystąpienia i dlatego jej poziom pewności jest najniższy.

## Luki i rozbieżności

**Nieustalone** (korzeń · wzorzec · wykluczenia):

- **korzeń** — nie ustalono, czy naruszenie `WF-5` z etapu pierwszego wynikało z pośpiechu czy z niejasności szablonu;
- **wzorzec** — jedno wystąpienie nie pozwala stwierdzić wzorca; przy drugim naruszenie stanie się kandydatem do zmiany szablonu;
- **wykluczenia** — sprawdzono i odrzucono przypuszczenie, że kontrakt danych nie wymagał powiązania: kontrakt dopuszcza pole powiązań jako opcjonalne, więc kontrola maszynowa nie mogła tego wykryć.

**Rozbieżności:**

| # | Rozbieżność | Strona A | Strona B | Co rozstrzyga |
| --- | --- | --- | --- | --- |
| 1 | Obowiązkowość powiązania artefaktu | wymaganie `WF-5`: powiązanie obowiązkowe, gdy relacja istnieje | kontrakt danych: pole powiązań opcjonalne | [model danych](../docs/02-architecture/model-danych.md) — obowiązkowość jest zapisem, nie mechanizmem; kontrola należy do przeglądu |

**Postęp:** mapa 3 / 3 · pozycja pierwsza: zielone · zaliczone od poprzedniego raportu: 3 — to pierwszy raport w scenariuszu.

## Działania następcze

**Czeka na koordynatora:** nic.

**Zależności:** wszystkie uruchomione.

**Zagrożenia:** kolejne naruszenie `WF-5` przy następnym scenariuszu. Wyzwalacz: prowadzenie etapów niezależnie przez różne osoby, bez przeglądu kompletności powiązań przed przekazaniem artefaktu.

**Następny krok:** przy drugim wystąpieniu naruszenia `WF-5` rozważyć wyróżnienie sekcji powiązań w [szablonie planu operacji](../docs/04-templates/plan-operacji.md).

## Źródła

| Rodzaj | Identyfikator albo odnośnik |
| --- | --- |
| plan operacji | `OP-ALFA-001` — [`operation-example-alpha.md`](operation-example-alpha.md) |
| dziennik komunikatów | [`communication-log-example.md`](communication-log-example.md) |
| komunikaty | `MSG-ALFA-001` … `MSG-ALFA-005` |

## Historia zmian

| Poprzedni stan | Nowy stan | Rola decyzyjna | Uzasadnienie |
| --- | --- | --- | --- |
| — | szkic | Analityk-01 | utworzenie raportu wg szablonu |
| szkic | do-przegladu | Analityk-01 | fakty i hipotezy rozdzielone, każda hipoteza z falsyfikatorem |
| do-przegladu | zatwierdzony | Koordynator-01 | przegląd potwierdził, że każde twierdzenie potwierdzone wskazuje artefakt źródłowy |

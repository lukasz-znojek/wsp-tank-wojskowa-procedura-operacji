# ADR-003: JSON Schema dla kluczowych artefaktów danych

## Status

Planowana.

Kontrakty istnieją i przechodzą kontrolę, ale decyzja pozostaje planowana, ponieważ nie zostało rozstrzygnięte, które artefakty muszą mieć walidację maszynową od początku, a które mogą pozostać przy kontroli ludzkiej. Pytanie jest otwarte w [`PROJECT_CONTEXT.md`](../../../PROJECT_CONTEXT.md).

## Kontekst

[ADR-002](adr-002-markdown-zrodlo-prawdy.md) ustanowił Markdown źródłem prawdy, ale zostawił lukę: dane w tabelach Markdown nie są danymi strukturalnymi. Nie da się maszynowo sprawdzić, czy status ma dopuszczoną wartość, czy identyfikator odpowiada wzorcowi, czy pole obowiązkowe zostało wypełnione ani czy w artefakcie nie pojawiło się pole, którego nie powinno tam być.

Przy zakresie z [ADR-001](adr-001-zakres-symulacyjny.md) ostatni punkt jest najważniejszy. Reguła „bez danych rzeczywistych" zapisana w tekście jest kontekstem, który wykonawca może pominąć bez żadnego sygnału. Ta sama reguła wyrażona jako brak pola w kontrakcie z `additionalProperties: false` jest blokadą techniczną.

Rozważane były trzy warianty: brak kontraktów i kontrola wyłącznie ludzka, kontrakty opisowe bez walidacji, oraz kontrakty walidowalne.

## Decyzja

**Cztery kluczowe typy artefaktów danych mają kontrakty JSON Schema w wersji Draft 2020-12:** plan operacji, wpis BMS, komunikat i SITREP. Kontrakty spełniają następujące wymogi:

| Wymóg | Zastosowanie |
| --- | --- |
| `$schema`, `$id`, `title`, `type: object`, `properties`, `required` | obecne w każdym kontrakcie; sprawdzane przez [`validate_schemas.py`](../../../scripts/validate_schemas.py) |
| `additionalProperties: false` | pole nieopisane w kontrakcie jest odrzucane |
| pole `synthetic` wymagane, wartość `true` | oznaczenie danych syntetycznych jako warunek zgodności |
| słownik statusów ograniczony do pięciu wartości | `szkic`, `do-przegladu`, `zatwierdzony`, `opublikowany`, `odrzucony` |
| wzorzec identyfikatora `^[A-Z0-9-]+$` | wąski celowo: nie przyjmie ścieżki, adresu ani nazwy osoby |
| czas zdarzenia jako etykieta względna | wzorzec `^T\+[0-9]{2}:[0-9]{2}$` zamiast znacznika czasu |
| punkt odniesienia jako punkt abstrakcyjny | wzorzec `^Punkt-[A-Z0-9]+$` |
| brak pól geograficznych, osobowych i operacyjnych | nieobecność pola jako mechanizm, nie zapis |

Kontrakty są sprawdzane automatycznie przy każdej zmianie — [`.github/workflows/validate-docs.yml`](../../../.github/workflows/validate-docs.yml).

## Konsekwencje

### Skutki pozytywne

- Część reguł zakresu z [ADR-001](adr-001-zakres-symulacyjny.md) przestaje być zapisem i staje się mechanizmem. To najmocniejszy efekt tej decyzji.
- Format artefaktu jest opisany dwukrotnie, z dwóch stron: szablon dla człowieka, kontrakt dla maszyny. Rozjazd między nimi jest wykrywalny.
- Kontrola nie zależy od tego, kto przegląda zmianę: te same polecenia dają ten sam wynik dla tego samego commitu, co spełnia wymaganie `WN-4`.
- Zgodność wstecz da się ocenić formalnie, bo kontrakt jest jawny — patrz [polityka wersjonowania](../../06-governance/polityka-wersjonowania.md).

### Koszty

- Zmiana formatu artefaktu wymaga teraz trzech spójnych zmian naraz: szablonu, kontraktu i przykładu. Pominięcie którejkolwiek daje rozjazd.
- `additionalProperties: false` czyni każde dodanie pola zmianą kontraktu. Wygoda pracy spada, przewidywalność rośnie.
- Nazwy plików kontraktów pochodzą z pierwszej wersji struktury i nie odpowiadają nazwom szablonów. Odwzorowanie jest jawne w [modelu danych](../model-danych.md), ale trzeba je znać.
- Stan pozycji planu nie ma własnego kontraktu i pozostaje polem wewnątrz planu operacji; jego słownik opisuje pole `stages[].status` kontraktu planu - rozstrzygnięcie w [modelu stanów](../model-stanow.md) i [ADR-005](adr-005-stan-pozycji-w-kontrakcie.md).
- Walidator waliduje przykłady JSON wobec kontraktów tylko wtedy, gdy dostępna jest biblioteka `jsonschema`. Lokalnie jej brak jest dopuszczony i sygnalizowany komunikatem; automatyczna walidacja instaluje bibliotekę i uruchamia skrypt z opcją `--require-jsonschema`, więc tam brak biblioteki kończy się kodem niezerowym. Otwarte pozostaje pytanie, które artefakty muszą mieć walidację maszynową od początku - to ono utrzymuje status decyzji jako planowany.
- Kontrakt nie sprawdza legalności przejścia między stanami — tylko wartość pola. Kontrola przejść pozostaje zapisem.

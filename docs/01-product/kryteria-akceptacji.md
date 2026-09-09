# Kryteria akceptacji

Kryterium musi dać się **sprawdzić**, nie ocenić. Odpowiedź na każdą pozycję poniżej jest `tak` albo `nie`; odpowiedź „częściowo" oznacza `nie`.

## Kryteria dla zmiany dokumentacji

| # | Kryterium | Czym sprawdzić |
| --- | --- | --- |
| 1 | Wszystkie odnośniki względne wskazują istniejące pliki | przejście odnośników w zmienionych plikach |
| 2 | Brak danych rzeczywistych, osobowych, lokalizacyjnych i operacyjnych | [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md) |
| 3 | Brak sekretów: kluczy, tokenów, haseł, certyfikatów | przegląd zmiany |
| 4 | Brak bezwzględnych ścieżek systemu plików | `bash scripts/validate_markdown.sh` |
| 5 | Brak tekstów zastępczych i pustych sekcji | `bash scripts/validate_markdown.sh` |
| 6 | Stan artefaktu należy do pięciowartościowego słownika | [model stanów](../02-architecture/model-stanow.md) |
| 7 | Każde twierdzenie podane jako potwierdzone wskazuje źródło | przegląd treści |
| 8 | Każdy wniosek ma falsyfikator albo status `niesprawdzone` | przegląd treści |
| 9 | Każda wielkość ma obok sposób jej odtworzenia | przegląd treści |
| 10 | Zmiana dotyczy jednego spójnego problemu | opis zmiany |
| 11 | Oba walidatory kończą się kodem 0 | `python3 scripts/validate_schemas.py`, `bash scripts/validate_markdown.sh` |

## Kryteria dla nowego artefaktu

| # | Kryterium | Czym sprawdzić |
| --- | --- | --- |
| 1 | Istnieje szablon opisujący format tego artefaktu | [`docs/04-templates/`](../04-templates/README.md) |
| 2 | Istnieje kontrakt danych albo jawne stwierdzenie, że go nie ma i dlaczego | [`schemas/`](../../schemas/) |
| 3 | Istnieje przykład syntetyczny wypełniający szablon | [`examples/`](../../examples/) |
| 4 | Identyfikator odpowiada wzorcowi z kontraktu danych | kontrakt danych |
| 5 | Pole oznaczające dane syntetyczne jest wypełnione | szablon i kontrakt |
| 6 | Artefakt wskazuje co najmniej jedno powiązanie, gdy relacja istnieje | [model danych](../02-architecture/model-danych.md), wymaganie `WF-5` |
| 7 | Stan artefaktu jest ustawiony i dozwolony dla tego etapu | [model stanów](../02-architecture/model-stanow.md) |
| 8 | Historia zmian zawiera poprzedni stan, nowy stan, rolę i uzasadnienie | wymaganie `WF-6` |
| 9 | Procedura wskazuje ten artefakt w sekcji danych wyjściowych | [`docs/03-procedures/`](../03-procedures/README.md) |

## Kryteria dla zmiany schematu

| # | Kryterium | Czym sprawdzić |
| --- | --- | --- |
| 1 | Plik jest poprawnym JSON-em | `python3 scripts/validate_schemas.py` |
| 2 | Obecne są `$schema`, `title`, `type`, `properties`, `required` | `python3 scripts/validate_schemas.py` |
| 3 | Typ główny to `object`, a `additionalProperties` ma wartość `false` | przegląd schematu |
| 4 | Pole oznaczające dane syntetyczne jest wymagane i ma wartość `true` | przegląd schematu |
| 5 | Słownik statusów obejmuje dokładnie pięć dopuszczonych wartości | [model stanów](../02-architecture/model-stanow.md) |
| 6 | Brak pól przyjmujących współrzędne, dane osobowe i dane operacyjne | przegląd schematu |
| 7 | Zgodność wstecz oceniona i nazwana | [polityka wersjonowania](../06-governance/polityka-wersjonowania.md) |
| 8 | Szablon i przykład zaktualizowane wraz ze schematem | [`docs/04-templates/`](../04-templates/README.md), [`examples/`](../../examples/) |
| 9 | Zmiana kontraktu danych ma ADR albo odnosi się do istniejącego | [`docs/02-architecture/decyzje/`](../02-architecture/decyzje/) |

## Definicja kompletnej zmiany

Zmiana jest kompletna, gdy **wszystkie** poniższe odpowiedzi są `tak`:

| # | Warunek |
| --- | --- |
| 1 | Spełnione są kryteria dla zmiany dokumentacji |
| 2 | Spełnione są kryteria właściwe dla rodzaju zmiany: nowy artefakt albo zmiana schematu |
| 3 | Tabela oceny wpływu jest wypełniona dla wszystkich czterech obszarów: szablony, przykłady, schematy, ADR-y |
| 4 | Oba walidatory kończą się kodem 0, a wyniki są podane wraz z kodami wyjścia |
| 5 | Opis zmiany wskazuje cel, zmienione artefakty i sposób walidacji |
| 6 | Rozbieżność wykryta w trakcie zmiany jest odnotowana w [rejestrze pochodzenia](../05-reference/sources.md) |
| 7 | Nazwa podmiotu, klienta ani ramy nie została wprowadzona jako domysł |

Zmiana, która spełnia warunki 1–7, ale nie została zatwierdzona przez koordynatora, jest kompletna, lecz nieprzyjęta. Rozstrzygnięcie należy do roli wskazanej w [macierzy uprawnień](role-i-uprawnienia.md).

# Status projektu

Dokument opisuje stan dokumentacji, nie plan. Twierdzenie o stanie ma obok sposób sprawdzenia; twierdzenie bez niego jest oznaczone jako **niesprawdzone**.

## Stan bieżący

Dokumentacja jest ukończona: struktura, treść, przykłady i kontrola zgodności.

| Obszar | Stan | Czym sprawdzone |
| --- | --- | --- |
| Struktura katalogów | kompletna | obecność `docs/00-overview` – `docs/06-governance`, `examples/`, `schemas/`, `scripts/`, `.github/` |
| Procedury | siedem procedur, dokładnie dziewięć wymaganych sekcji w każdej | `bash scripts/validate_markdown.sh` → 7 z 7, kod 0 |
| Szablony | pięć szablonów, każdy z instrukcją wypełniania i odnośnikiem do kontraktu albo jawnym stwierdzeniem, że kontraktu nie ma | tabela w [`docs/04-templates/README.md`](../04-templates/README.md) |
| Kontrakty danych | cztery kontrakty JSON Schema Draft 2020-12 | `python3 scripts/validate_schemas.py` → 4 schematy, kod 0 |
| Przykłady | cztery przykłady syntetyczne, każdy w postaci Markdown i JSON, spójne identyfikatorami, rolami i linią zdarzeń | wspólne `OP-ALFA-001`, `BMS-ALFA-001`, `MSG-ALFA-001` … `MSG-ALFA-005`, `SITREP-ALFA-001`; `python3 scripts/validate_schemas.py` z biblioteką `jsonschema` → 4 przykłady, kod 0 |
| Dokumenty produktowe | wymagania `WF-1` … `WF-7` i `WN-1` … `WN-4`, cztery scenariusze, macierz uprawnień, listy kontrolne | [`docs/01-product/`](../01-product/README.md) |
| Architektura i decyzje | pięć elementów architektury, model danych, model stanów, integracje, pięć ADR-ów | [`docs/02-architecture/`](../02-architecture/README.md) |
| Governance | klasyfikacja informacji, polityka wersjonowania, polityka zmian procedur | [`docs/06-governance/`](../06-governance/README.md) |
| Walidacja automatyczna | działa dla pull requestów i gałęzi domyślnej | [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml) |
| Materiały źródłowe | przeniesione i odpersonalizowane; katalog źródłowy usunięty po kontroli plik po pliku | [rejestr pochodzenia](../05-reference/sources.md) |

## Kamienie milowe

```text
struktura → procedury i szablony → kontrakty danych → demonstrator
```

| # | Kamień | Stan |
| --- | --- | --- |
| 1 | Struktura repozytorium | osiągnięty |
| 2 | Procedury i szablony | osiągnięty |
| 3 | Kontrakty danych | osiągnięty |
| 4 | Demonstrator | poza zakresem tej fazy — patrz [cel i zakres](cel-i-zakres.md) |

## Ryzyka stałe

Ryzyka nie są zadaniami do wykonania: występują trwale i każde ma kontrolę, która je ogranicza. Kontrola nie usuwa ryzyka, tylko zwiększa szansę wykrycia.

| # | Ryzyko | Kontrola ograniczająca | Rodzaj kontroli |
| --- | --- | --- | --- |
| 1 | Wprowadzenie danych niedopuszczonych: osobowych, lokalizacyjnych, operacyjnych, sekretów | kontrakty danych nie mają pól przyjmujących te dane; wzorce wymuszają czas względny i punkt abstrakcyjny; walidator odrzuca ścieżki bezwzględne; kontrola ludzka wobec [klasyfikacji informacji](../06-governance/klasyfikacja-informacji.md) jako kryterium przeglądu | częściowo mechanizm, częściowo zapis |
| 2 | Zerwanie odnośników przy zmianie nazwy albo przeniesieniu pliku | przegląd odnośników względnych jako kryterium akceptacji; odnośniki sprawdzane przy każdej zmianie | zapis |
| 3 | Rozjazd dokumentacji i schematów: szablon opisuje inne pola niż kontrakt | wymóg zmiany szablonu, kontraktu i przykładu w jednej zmianie; ocena wpływu na cztery obszary w [polityce zmian procedur](../06-governance/polityka-zmian-procedur.md); przykłady JSON walidowane wobec kontraktów w automatycznej walidacji; tabela odwzorowania pól na kontrakt w każdym szablonie | częściowo mechanizm, częściowo zapis |
| 4 | Pozostawienie tekstu zastępczego albo pustej sekcji | walidator odrzuca teksty zastępcze i puste sekcje w plikach Markdown | mechanizm |
| 5 | Niezgodna wstecz zmiana kontraktu wprowadzona nieświadomie | obowiązkowa ocena zgodności wstecz wg [polityki wersjonowania](../06-governance/polityka-wersjonowania.md); tabela trzech wyników oceny | zapis |
| 6 | Zmiana stanu artefaktu przez rolę bez uprawnienia albo przejściem niedozwolonym | [macierz uprawnień](../01-product/role-i-uprawnienia.md) i tabela przejść w [modelu stanów](../02-architecture/model-stanow.md) | zapis |

Ryzyka 2, 5 i 6 są ograniczone wyłącznie zapisem, ryzyko 3 tylko częściowo mechanizmem. Zapis jest kontekstem, nie blokadą: wykonawca może go pominąć bez żadnego sygnału. Jedyną blokadą techniczną są walidatory i automatyczna walidacja.

## Ustalenia przeniesione z fazy poprzedniej

Zapis, nie prawda — pozycje pochodzą z notatki roboczej poprzedzającej reorganizację i wymagają sprawdzenia przed użyciem jako podstawy rozstrzygnięcia.

1. **Materiał źródłowy był prowadzony poza kontrolą wersji.** Każdy zapis był natychmiastowy i nieodwracalny bez udziału człowieka. Stan: rozwiązany przez umieszczenie dokumentacji w repozytorium z kontrolą wersji.
2. **Samodzielność materiału była wymogiem, nie preferencją.** Dokument, który da się ocenić dopiero po zajrzeniu do wersji poprzedniej, tego wymogu nie spełnia. Stan: realizowany przez [rejestr pochodzenia](../05-reference/sources.md).
3. **Wykonywalność:** każda czynność w procedurze ma adres — nazwę narzędzia, polecenie albo dokument. Stan: zastosowane w siedmiu procedurach; **niesprawdzone** — brak pomiaru na wykonawcy nieznającym kontekstu.
4. **Pomiary:** każda wielkość, której dokument żąda, ma obok sposób jej odtworzenia. Stan: zastosowane w szablonach i w [procedurze meldunku](../03-procedures/meldunek.md).
5. **Metoda zmiany:** żadna zmiana reguły bez wcześniejszego, obserwowanego niepowodzenia. Stan: zapisane w [polityce zmian procedur](../06-governance/polityka-zmian-procedur.md), krok 3; **niesprawdzone** jako praktyka.
6. **Kolizja konwencji nazw dokumentów stanu.** Konwencja warstwy osobistej właściciela wymaga od projektu dokumentu planu o jednej nazwie, natomiast materiał źródłowy wytwarzał dokumenty stanu i dziennika o nazwach innych. Obie strony są nazwane; **rozstrzygnięcie należy do właściciela projektu** i nie zostało podjęte w tej dokumentacji.

## Następny krok

Utrzymanie zgodności przy każdej zmianie: ocena wpływu na cztery obszary, walidatory z kodem 0, sprawdzone odnośniki, brak materiału niedopuszczonego. Tryb opisuje [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md), a warunki przyjęcia — [kryteria akceptacji](../01-product/kryteria-akceptacji.md).

Rozbudowa produktu nie jest przedmiotem tej fazy. Pytania otwarte, których rozstrzygnięcie należy do właściciela projektu, są w [`PROJECT_CONTEXT.md`](../../PROJECT_CONTEXT.md).

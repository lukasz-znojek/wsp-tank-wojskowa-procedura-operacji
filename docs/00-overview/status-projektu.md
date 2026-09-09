# Status projektu

Dokument opisuje stan prac, nie plan. Twierdzenie o stanie ma obok sposób sprawdzenia; twierdzenie bez niego jest oznaczone jako **niesprawdzone**.

## Stan bieżący

Projekt jest w fazie specyfikacji i porządkowania wiedzy.

| Obszar | Stan | Czym sprawdzone |
| --- | --- | --- |
| Struktura dokumentacji | kompletna | obecność katalogów `docs/00-overview` – `docs/06-governance`, `examples/`, `schemas/`, `scripts/`, `.github/` |
| Procedury | siedem procedur z treścią, komplet dziewięciu sekcji w każdej | `bash scripts/validate_markdown.sh` → 7 procedur, 0 błędów |
| Szablony | cztery szablony z instrukcją wypełniania każdego pola | odnośnik do kontraktu danych obecny w każdym |
| Kontrakty danych | cztery kontrakty JSON Schema | `python3 scripts/validate_schemas.py` → 4 schematy, 0 błędów |
| Walidacja automatyczna | działa dla pull requestów i gałęzi domyślnej | [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml) |
| Dokumenty produktowe | szkielety z treścią oznaczoną `[do uzupełnienia]` | `grep -rc '\[do uzupełnienia\]' docs/01-product/` |
| ADR-y | cztery pliki utworzone, treść do uzupełnienia | indeks w [`DECISIONS.md`](../../DECISIONS.md) |
| Rejestr artefaktów jako mechanizm | nie istnieje; realizowany plikami | [architektura BMS](../02-architecture/architektura-bms.md), tabela dojrzałości |
| Demonstrator | nie rozpoczęty | — |

## Kamienie milowe

| # | Kamień | Stan |
| --- | --- | --- |
| 1 | Struktura repozytorium, kontrakty danych i walidacja | osiągnięty |
| 2 | Treść procedur i szablonów przeniesiona z materiałów źródłowych | osiągnięty |
| 3 | Treść dokumentów produktowych, architektonicznych i governance | w toku |
| 4 | Kontrola przejść między stanami wbudowana w walidator | nie rozpoczęty |
| 5 | Demonstrator: utworzenie planu, wpisu, komunikatu i SITREP z walidacją | nie rozpoczęty |

Kamień 3 jest warunkiem kamienia 4: kontrola przejść wymaga uzgodnionej macierzy uprawnień, a ta należy do dokumentów produktowych.

## Ryzyka i luki

| # | Ryzyko albo luka | Skutek | Co ją obali |
| --- | --- | --- | --- |
| 1 | Większość reguł tej dokumentacji jest **zapisem, nie mechanizmem** | wykonawca może regułę pominąć bez żadnego sygnału | rozszerzenie walidatora tak, by sprawdzał regułę, o której mowa; do tego czasu ryzyko pozostaje |
| 2 | Walidator sprawdza obecność sekcji, nie ich treść | procedura z kompletem nagłówków i pustą treścią przechodzi walidację | kontrola minimalnej treści sekcji albo obecności znaczników `[do uzupełnienia]` w walidatorze |
| 3 | Kontrakty danych nie sprawdzają legalności przejścia między stanami | artefakt może przejść ze `szkicu` wprost do `opublikowany` | reguła przejść w walidatorze — patrz [model stanów](../02-architecture/model-stanow.md) |
| 4 | Rejestr artefaktów i warstwa audytu są realizowane plikami prowadzonymi ręcznie | rozjazd między statusem artefaktu a wpisem w dzienniku jest wykrywalny dopiero przy przeglądzie poobserwacyjnym | automatyczny zapis zdarzeń przy zmianie stanu |
| 5 | Pozycje [katalogu zdolności rezerwowych](../05-reference/arsenal.md) nie mają pomiaru wykonanego w tym projekcie | opisy zastosowań pochodzą z materiału źródłowego i są danymi do sprawdzenia | zmierzone użycie którejkolwiek pozycji w ramach scenariusza |
| 6 | Nazwa ramy organizacyjnej pozostaje nieustalona | dokumenty niosą `[do potwierdzenia]` w miejscach, gdzie nazwa byłaby potrzebna | rozstrzygnięcie właściciela projektu |

## Ustalenia z fazy poprzedniej

Zapis, nie prawda — pozycje przeniesione z notatki roboczej poprzedzającej reorganizację. Każda wymaga sprawdzenia przed użyciem jako podstawy decyzji.

1. **Materiał źródłowy był prowadzony poza kontrolą wersji.** Każdy zapis był natychmiastowy i nieodwracalny bez udziału człowieka. Skutek dla tej dokumentacji: przed nadpisaniem dokumentu należy pokazać, co zniknie. Stan: rozwiązany przez umieszczenie dokumentacji w repozytorium z kontrolą wersji.
2. **Samodzielność materiału była wymogiem, nie preferencją.** Dokument, który da się ocenić dopiero po zajrzeniu do wersji poprzedniej, tego wymogu nie spełnia. Brak w materiale jest ustaleniem do zapisania, nie powodem, by sięgnąć po tekst wcześniejszy. Stan: obowiązuje nadal; realizowany przez [rejestr pochodzenia](../05-reference/sources.md).
3. **Wykonywalność:** każda czynność w procedurze musi mieć adres — nazwę narzędzia, polecenie albo dokument. Czynność opisana nazwą ogólną, bez wskazania czym ją wykonać, jest instrukcją niewykonalną. Stan: zastosowane w siedmiu procedurach; **niesprawdzone** — brak pomiaru na świeżym wykonawcy.
4. **Pomiary:** każda wielkość, której dokument żąda, ma obok sposób jej odtworzenia. Stan: zastosowane w szablonach i w [procedurze meldunku](../03-procedures/meldunek.md).
5. **Metoda zmiany:** żadna zmiana w tekście regulaminowym bez wcześniejszego, obserwowanego niepowodzenia. Kolejność: pokaż tryb porażki, dopiero potem popraw. Stan: przyjęte jako zasada w [polityce zmian procedur](../06-governance/polityka-zmian-procedur.md); **niesprawdzone** jako praktyka.
6. **Kolizja konwencji nazw dokumentów stanu.** Konwencja warstwy osobistej właściciela wymaga od projektu dokumentu planu o jednej nazwie, natomiast materiał źródłowy wytwarzał dokumenty stanu i dziennika o nazwach innych. Obie strony są nazwane; **rozstrzygnięcie należy do właściciela projektu** i nie zostało podjęte w tej dokumentacji.

## Otwarte pytania

Pytania przeniesione i uzupełnione; pełna lista w [`PROJECT_CONTEXT.md`](../../PROJECT_CONTEXT.md).

1. Jaki będzie pierwszy interfejs demonstratora: aplikacja webowa, narzędzie terminalowe czy zestaw dokumentów prowadzonych ręcznie?
2. Które artefakty muszą mieć walidację maszynową od początku, a które mogą pozostać przy kontroli ludzkiej?
3. Czy kontrola przejść między stanami ma trafić do walidatora w tej fazie, czy dopiero po uzgodnieniu macierzy uprawnień?
4. Kto zatwierdza zmianę procedury przed jej publikacją jako stabilnej?
5. Jak nazywa się rama organizacyjna projektu — pozycja dziś oznaczona jako `[do potwierdzenia]`?

## Następny krok

Uzupełnić treść dokumentów produktowych, architektonicznych i governance oznaczonych `[do uzupełnienia]`, zaczynając od [ról i uprawnień](../01-product/role-i-uprawnienia.md) oraz [kryteriów akceptacji](../01-product/kryteria-akceptacji.md) — te dwa dokumenty są warunkiem kontroli przejść między stanami.

Liczbę pozostałych znaczników odtwarza polecenie:

```bash
grep -rl '\[do uzupełnienia\]' --include='*.md' docs/ | wc -l
```

# Wymagania

Wymagania dotyczą demonstratora pracującego wyłącznie na fikcyjnych artefaktach dokumentowych. Każde wymaganie ma sprawdzalny rezultat: zdanie, które da się rozstrzygnąć jako spełnione albo niespełnione bez oceny.

## Wymagania funkcjonalne

| ID | Wymaganie | Sprawdzalny rezultat | Artefakt śledzenia |
| --- | --- | --- | --- |
| WF-1 | Plan scenariusza | Można utworzyć plan z identyfikatorem, etapami i stanem artefaktu | [szablon planu operacji](../04-templates/plan-operacji.md), [przykład ALFA](../../examples/operation-example-alpha.md) |
| WF-2 | Wpis BMS | Można zarejestrować wpis z identyfikatorem, źródłem i poziomem pewności | [szablon wpisu BMS](../04-templates/wpis-bms.md), [przykład wpisu BMS](../../examples/bms-event-example.md) |
| WF-3 | Komunikat | Można zapisać komunikat z czasem względnym i powiązaniem | [szablon komunikatu](../04-templates/komunikat.md), [dziennik przykładowy](../../examples/communication-log-example.md) |
| WF-4 | SITREP | Można utworzyć raport z faktami, hipotezami, falsyfikatorami i lukami | [szablon SITREP](../04-templates/sitrep.md), [przykład SITREP](../../examples/sitrep-example.md) |
| WF-5 | Powiązania artefaktów | Artefakt wskazuje co najmniej jeden powiązany identyfikator, gdy relacja istnieje | [model danych](../02-architecture/model-danych.md) |
| WF-6 | Historia zmian | Każda zmiana stanu ma poprzedni i nowy stan, rolę oraz uzasadnienie | [model stanów](../02-architecture/model-stanow.md) |
| WF-7 | Walidacja podstawowa | Walidatory kończą się kodem 0 dla stanu zgodnego | [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py), [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh) |

## Wymagania niefunkcjonalne

| ID | Wymaganie | Sprawdzalny rezultat |
| --- | --- | --- |
| WN-1 | Dane syntetyczne | Brak danych rzeczywistych w przykładach i dokumentacji |
| WN-2 | Wersjonowanie | Dokumenty i schematy mają historię zmian w kontroli wersji |
| WN-3 | Czytelne kontrakty | Każdy typ artefaktu ma opis i schemat albo wyraźne ograniczenie |
| WN-4 | Powtarzalna walidacja | Te same polecenia dają ten sam wynik dla tego samego commitu |

## Sposób sprawdzenia

| ID | Czym sprawdzić |
| --- | --- |
| WF-1 … WF-4 | obecność szablonu z kompletem pól obowiązkowych oraz przykładu w postaci Markdown i JSON; przykład JSON przechodzi kontrolę odpowiedniego schematu w `python3 scripts/validate_schemas.py` uruchomionym z dostępną biblioteką `jsonschema` |
| WF-5 | każdy przykład wskazuje co najmniej jeden powiązany identyfikator w sekcji powiązań |
| WF-6 | każda zmiana stanu w tabeli „Historia zmian” przykładowego artefaktu ma wypełnione: poprzedni stan, nowy stan, rolę, uzasadnienie; przykładowy dziennik niesie dla tej samej zmiany czas, nowy status i autora |
| WF-7, WN-4 | `python3 scripts/validate_schemas.py` oraz `bash scripts/validate_markdown.sh` kończą się kodem 0 |
| WN-1 | `bash scripts/validate_markdown.sh` nie zgłasza ścieżek bezwzględnych; kontrola ludzka wobec [klasyfikacji informacji](../06-governance/klasyfikacja-informacji.md) |
| WN-2 | historia commitów dla pliku dokumentu i pliku schematu |
| WN-3 | każdy szablon odsyła do kontraktu w [`schemas/`](../../schemas/) albo nosi jawne stwierdzenie, że kontraktu nie ma i dlaczego |

## Poza zakresem wymagań

| Obszar | Uzasadnienie |
| --- | --- |
| Integracje produkcyjne | brak połączeń z systemami zewnętrznymi jest decyzją projektową — [ADR-001](../02-architecture/decyzje/adr-001-zakres-symulacyjny.md), [integracje](../02-architecture/integracje.md) |
| Dane rzeczywiste | repozytorium przyjmuje wyłącznie dane syntetyczne — [ograniczenia i zasady](../00-overview/ograniczenia-i-zasady.md) |
| Automatyczne decyzje operacyjne | rozstrzygnięcia dotyczą stanu dokumentów i podejmuje je człowiek w roli wskazanej w [macierzy uprawnień](role-i-uprawnienia.md) |
| Instrukcje działań rzeczywistych | poza zakresem projektu bezwarunkowo |

## Śledzenie wymagań

Wymaganie zmienione bez aktualizacji artefaktu śledzenia przestaje być sprawdzalne. Zmiana wymagania wymaga oceny wpływu na szablon, przykład, schemat i ADR-y — tryb opisuje [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md).

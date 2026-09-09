# Ograniczenia i zasady

Zasady obowiązują każdy dokument, szablon, przykład i kontrakt danych w tym repozytorium. Naruszenie którejkolwiek jest defektem zmiany, nie kwestią stylu.

## Charakter symulacyjny

Repozytorium opisuje środowisko symulacyjne i szkoleniowe. Z tego wynikają trzy ograniczenia treści:

1. **Żaden dokument nie jest instrukcją do rzeczywistych działań.** Procedury opisują pracę nad artefaktami dokumentowymi: porządkowanie informacji, rejestrowanie zdarzeń, ocenę pewności, zatwierdzanie, publikację i audyt.
2. **Żaden przykład nie odnosi się do rzeczywistości.** Nazwy, identyfikatory, role, czasy i punkty odniesienia są wymyślone.
3. **Brak zastosowania rzeczywistego jest decyzją, nie brakiem dojrzałości.** Zapisano ją w [ADR-001](../02-architecture/decyzje/adr-001-zakres-symulacyjny.md) i nie podlega zmianie w ramach zwykłej zmiany dokumentacji.

## Dane syntetyczne

Dopuszczone są wyłącznie dane w całości wymyślone. Obowiązuje zamknięty zestaw oznaczeń:

| Rodzaj | Dopuszczone wartości |
| --- | --- |
| Scenariusz | `ALFA`, `BRAVO` |
| Punkt odniesienia | `Punkt-A`, `Punkt-B` |
| Rola z numerem | `Koordynator-01`, `Analityk-01`, `Recenzent-01` |
| Plan operacji | `OP-ALFA-001` |
| SITREP | `SITREP-ALFA-001` |
| Komunikat | `MSG-ALFA-001` … `MSG-ALFA-005` |
| Czas | etykieta względna `T+HH:MM`, np. `T+00:15` |

Zakazane bezwarunkowo: dane osobowe, imiona i nazwiska, adresy, adresy e-mail, rzeczywiste lokalizacje, współrzędne geograficzne, nazwy podmiotów, identyfikatory jednostek, stany zasobów, harmonogramy, dane operacyjne, klucze, tokeny, hasła, certyfikaty oraz bezwzględne ścieżki systemu plików. Pełna lista i tryb postępowania po wykryciu: [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md).

**Oznaczanie.** Każdy przykład zaczyna się nagłówkiem `DANE SYNTETYCZNE`. Każdy artefakt zawierający dane przykładowe nosi pole oznaczające dane syntetyczne, a odpowiadające mu pole `synthetic` w kontrakcie danych ma wartość `true` i jest obowiązkowe.

## Nazw nie wymyślaj

Nazwa firmy, klienta, projektu ani ramy prawnej nie wchodzi do dokumentacji jako założenie. Gdy nazwa jest potrzebna, a nie wynika ze źródeł ani z polecenia, wpisz `[do potwierdzenia]` — nie najbardziej prawdopodobną nazwę. Nazwa katalogu, nazwa gałęzi ani nazwa narzędzia nie są źródłem nazwy podmiotu.

## Jednoznaczny język

Jednoznaczność jest wymogiem sprawdzalnym, nie postulatem stylistycznym. Praktycznie oznacza pięć rzeczy:

1. **Liczba zamiast przybliżenia.** „Około pięciu" nie jest wielkością. Podaj liczbę albo napisz, że jej nie znasz.
2. **Sposób odtworzenia obok liczby.** Każda wielkość ma obok polecenie albo wskazane źródło, którym da się ją odtworzyć. Liczba bez tego nie wchodzi do dokumentu.
3. **Brak prognozy bez przelicznika.** Termin ani wynik nie są podawane bez wskazania, z czego zostały wyliczone.
4. **Falsyfikator przy wniosku.** Wniosek bez zdania mówiącego, co by go obaliło, wchodzi ze statusem `niesprawdzone`, nie jako ustalenie.
5. **`niemierzalne` zamiast oceny w miejscu pomiaru.** Gdy reguły nie da się zmierzyć dostępnym narzędziem, wpisz `niemierzalne`. Ocena podana jako pomiar jest gorsza niż brak pomiaru: brak widać, ocena udaje liczbę.

Poza tym: zdania oznajmujące, strona czynna, jeden termin na jedno pojęcie zgodnie z [glosariuszem](glosariusz.md).

## Konwencje formalne

- Nazwy plików: małe litery, znaki ASCII, myślniki jako separator.
- Dokumentacja w języku polskim.
- Odnośniki Markdown względne i wskazujące istniejące pliki.
- Procedura, szablon i przykład są trzema odrębnymi artefaktami i nie mieszają się w jednym pliku — patrz [ADR-004](../02-architecture/decyzje/adr-004-rozdzielenie-artefaktow.md).
- Każda procedura ma dokładnie dziewięć wymaganych sekcji, bez dodatkowych nagłówków tego poziomu.

## Czego ta dokumentacja nie robi

- **Nie egzekwuje większości własnych reguł.** Jedyną blokadą techniczną są walidatory i automatyczna walidacja: [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py), [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh) oraz [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml). Reguła zapisana wyłącznie w tekście jest kontekstem i wykonawca może ją pominąć bez żadnego sygnału. Reguła, która ma naprawdę obowiązywać, musi trafić do walidatora albo do kontraktu danych.
- **Nie rozstrzyga za koordynatora.** Dokumenty opisują kryteria; rozstrzygnięcie należy do roli wskazanej w [macierzy uprawnień](../01-product/role-i-uprawnienia.md).
- **Nie zastępuje kontroli ludzkiej przy danych niedopuszczonych.** Walidator wykrywa brakującą sekcję i niepoprawny schemat, ale nie rozpoznaje danych rzeczywistych wpisanych w prawidłowe pole.

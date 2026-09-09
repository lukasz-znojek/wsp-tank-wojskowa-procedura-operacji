---
typ: szablon_pliku_operacji
rola: układ _operacja.md — STAN misji prowadzonej skillem tank, pięciopunktowy rozkaz bojowy, nadpisywany przez porucznika. Dziennik działań i log naruszeń w _dziennik.md (szablon_dziennik.md)
wersja: 3
data: 2026-09-09
---

# OPERACJA „[KRYPTONIM]"

**Status:** w toku / zakończona · **Przejazd:** [n] · **Mapa:** [zielone] / [wszystkie] · **Poligon:** [Claude Code / Cowork / inne] · **Dziennik:** `_dziennik.md`

Ten plik niesie **stan** i jest nadpisywany.

## 1. POŁOŻENIE

| Co | Czym zmierzone | Wynik |
|---|---|---|
| | | |

Nieustalone (korzeń · wzorzec · wykluczenia): -

## 2. ZADANIE

**OPIS:** [dwa-trzy zdania ludzkim językiem: co ta operacja robi i po co]
**ZASIĘG:** odczyt [LOKALNY / KONTYNENTALNY / GLOBALNY] · skutki [ŻADNE / LOKALNY / KONTYNENTALNY / MIĘDZYKONTYNENTALNY / GLOBALNY]
**CEL:** [jeden mierzalny stan końcowy — pozycja pierwsza mapy]
**DOWÓD:** [komenda albo sprawdzian, który rozstrzyga]
**ZAMIAR:** [po co ten cel istnieje — rozstrzyga korekty kursu bez wracania do Generała]

**KULMINACJA** — odwrotność celu, progi ustalone przez Generała w think-tanku: szczyt okna porucznika ponad [n] tys. tokenów (punkt odniesienia: 620 tys. porzucone, sierpień 2026) · co najmniej [n] przejazdów zamkniętych bez zazielenienia pozycji pierwszej · limit sesji (HTTP 429) · jednostka stracona bez zapisanego stanu. Skutek: **pauza operacyjna** — zapis + commit, SITREP, decyzja Generała: kontynuacja / ZMIANA WARTY / wycofanie z meldunkiem; wycofanie jest decyzją, nie stratą. CISZA RADIOWA i WEDŁUG UZNANIA kulminacji **nie znoszą**.

Skala zasięgu — eskalacja nieodwracalności: LOKALNY (folder, cofane ręcznie) → KONTYNENTALNY (komputer, wymaga sprzątania) → MIĘDZYKONTYNENTALNY (commit/push, historia trwała) → GLOBALNY (publikacja, nieodwracalne — **zawsze bramka Generała**).

## 3. WYKONANIE — mapa etapów

Pozycje główne, potem poboczne (`P1`, `P2`…) w tej samej tabeli:

| # | Co ma być prawdą | Czym sprawdzę | Stan |
|---|---|---|---|
| 1 | [koniec do końca: uruchamia się i robi X] | | niezaliczone |
| P1 | | | niezaliczone |

## 4. ZABEZPIECZENIE

**Sztab:** [narzędzia i skille włączone w tej sesji; uzupełnienia dopisuj z datą]
**BMS:** [adres artefaktu — udostępnienie komukolwiek = bramka Generała]
**Sygnał działa / nie działa:** [komenda pass/fail dostępna od pierwszego przejazdu]
**Podłoże trwałości:** [`git rev-parse --is-inside-work-tree` → OK: commit na zamknięciu każdego przejazdu · błąd: dziennik tylko dopisywany + wersje i kosz Dysku, odzysk przez człowieka w UI, nie przez agenta]

**Operacje nieodwracalne** — kolumna „jak cofnąć" obowiązkowa; jej brak stawia bramkę bezwarunkowo:

| Operacja | Zasięg skutków | Kto wykonuje | Jak cofnąć |
|---|---|---|---|
| | | człowiek / porucznik | |

**Zależności zewnętrzne** — uruchamiane pierwszego dnia, nie w chwili zablokowania:

| Rzecz | Od kogo | Co blokuje | Ile trwa | Uruchomiona |
|---|---|---|---|---|
| | | | | |

**Jednostki:** typy i dobór — `procedura_zwiad.md`; kryptonimy zwiadu nadaje porucznik, szeregowych sierżant.

## 5. DOWODZENIE I ŁĄCZNOŚĆ

**Bramki:** zatwierdzenie rozkazu · odbiór każdego przejazdu · bramki nieodwracalności warstw wyższych bez zmian.
**Meldunek:** fakty i liczby, bez ozdób; sekcja „czego nie znalazłem" obowiązkowa.

## AAR — cztery pytania (treść i prowadzenie: `procedura_meldunek.md`)

1. **Co miało się wydarzyć:** [ ] · 2. **Co się wydarzyło:** [z `_dziennik.md:wiersz`, rozjazdy wypisane] · 3. **Dobrze / źle i dlaczego:** [ ] · 4. **Do standardu następnym razem:** [ ]

Pytanie do jednostek: [kryptonim → odpowiedź, albo „świeże okno — strata"]

| # | Wniosek | Dowód (`plik:wiersz`) | Zmiana doktryny / procedury | Test RED |
|---|---|---|---|---|
| | | | | |

## MELDUNEK KOŃCOWY

**Koszt jednostek** (komendy pomiaru: `procedura_meldunek.md`):

| Pozycja | Wartość |
|---|---|
| szczyt okna porucznika | [ ] tokenów |
| wyjście porucznika | [ ] tokenów |
| subagenci | [ jednostek / tokenów ] |
| przejazdy | [ ] |

**Zwycięstwa** (przed stratami) i **straty** — bez wniosku poległy ginie drugi raz:

| # | Zwycięstwo / strata | Liczba albo koszt | Wniosek (przy stracie obowiązkowy) |
|---|---|---|---|
| | | | |

**Odrzucone po drodze:** · **Wnioski:** tabela z AAR wyżej.

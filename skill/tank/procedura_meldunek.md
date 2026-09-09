---
typ: procedura_tanka
rola: etap MELDUNEK KOŃCOWY — zamknięcie misji z pomiarem
wersja: 3
data: 2026-09-09
---

# MELDUNEK KOŃCOWY

Po ostatnim przejeździe, przed rozwiązaniem sztabu. Każda misja dostarcza liczbę.

## Koszt jednostek — trzy pomiary, z komendami

| Pomiar | Komenda |
|---|---|
| szczyt okna porucznika | `max(input_tokens + cache_read + cache_creation)` z `~/.claude/projects/<projekt>/<sesja>.jsonl`; **kontrola krzyżowa** `/usage` w sesji — format `.jsonl` jest wewnętrzny i zmienia się między wersjami (sessions.md, U-77), rozjazd meldować |
| liczba przejazdów | licznik z nagłówka `_operacja.md` |
| zwiadowcy i ich koszt | liczba kryptonimów w `_dziennik.md`; sumy z transkryptów zadań |

**Termin:** transkrypty żyją 30 dni (`cleanupPeriodDays`, sessions.md — U-78). Po tym terminie
pomiar z `.jsonl` jest niemożliwy — meldunek musi zdążyć.

## AAR — po ostatnim przejeździe, przed raportem

Cztery pytania w tej kolejności (FM 7-0), każda odpowiedź z dowodem `plik:wiersz`; plan
konfrontowany z faktem, nie streszczany:

1. **Co miało się wydarzyć** — CEL, ZAMIAR, KULMINACJA, mapa etapów, FRAGO-n.
2. **Co się wydarzyło** — dziennik, log naruszeń, dowody pozycji. Rozjazd między dwoma zapisami
   (dziennik vs plik operacji, wpis vs wpis, status vs treść) jest faktem do wypisania, nie do
   wygładzenia.
3. **Co poszło dobrze, co źle i dlaczego** — stanowisko i reguła, nie osoba.
4. **Jak wykonać do standardu następnym razem.**

Każdej żywej jednostce jedno pytanie wznowieniem kryptonimu: „czego zabrakło w FRAGO, co
przeszkadzało"; w świeżym oknie jednostek nie ma — zapisz to jako stratę. Prowadzi porucznik;
wariant z prowadzącym świeżym to SĄD POLOWY z `arsenal.md`.

Wyjście: tabela **WNIOSKI** — wniosek · dowód `plik:wiersz` · zmiana doktryny albo procedury ·
test RED, który wykazałby ten tryb porażki na świeżej jednostce. Dowód, że meldunek sam tego nie
daje: T4 (2026-09-03) — AAR świeżej jednostki dał 5 wniosków, których meldunek z tych samych
plików nie miał.

## Treść raportu

Układ i tabele: `szablon_operacja.md`, sekcja MELDUNEK KOŃCOWY. Sześć punktów w kolejności:
koszt jednostek (liczby wyżej plus `sum(output_tokens)` i suma tokenów subagentów z powiadomień
zadań) · cel ze stanem pozycji pierwszej i dowodem · zwycięstwa, każde z liczbą, przed stratami ·
straty z wnioskiem przy każdej · odrzucone po drodze z powodem · wnioski, tabela z AAR wyżej.

Tryby porażki: pierwsze wystąpienie → obserwacja, drugie → kandydat do rejestru, każdy z testem RED.

BMS dostaje ostatnie odświeżenie: status „zakończona", komplet liczb, dziennik domknięty. Adres
zostaje — to jest archiwum misji czytelne bez repozytorium.

Kod na końcu misji: gałąź domyka się na jawną decyzję Generała — scalenie, pull request albo
porzucenie. Porucznik przedstawia stan i rekomendację, nie scala sam.

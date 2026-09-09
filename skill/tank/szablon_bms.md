---
typ: szablon_artefaktu
rola: BMS — Battlefield Management System, klikalny artefakt misji, obowiązkowy od think-tanku do meldunku
wersja: 3
data: 2026-09-09
---

# BMS — Battlefield Management System

Stół operacyjny Generała: jedna strona, jeden adres, żywa całą misję. Powstaje w THINK-TANKu,
**przed bramką zatwierdzenia** — rozkaz pokazany tylko w oknie czatu przewinie się po trzech
odpowiedziach.

## Źródło stanu

`_operacja.md` (stan) i `_dziennik.md` (dziennik) są źródłem. **BMS jest widokiem i kanałem
zwrotnym, nigdy drugą prawdą** — rozjazd rozstrzyga plik.

| Kierunek | Co niesie |
|---|---|
| `_operacja.md` → BMS | stan pozycji, jednostki, zasoby — przepisuje porucznik |
| `_dziennik.md` → BMS | dziennik działań, log naruszeń — przepisuje porucznik |
| BMS → porucznik | kliknięcia Generała: odbiór pozycji, rozstrzygnięcie, uwaga |

Kliknięcie Generała **nie zmienia stanu misji samo z siebie**. Porucznik odczytuje je (`read_db`),
przepisuje do `_operacja.md` i dopiero to jest stanem.

## Zdolności strony

`capabilities: {db: {}}` — kliknięcia muszą przeżyć zamknięcie okna i wrócić do porucznika.
Bez zapisu BMS jest obrazkiem, nie kanałem.

Skille od projektowania artefaktów wchodzą przed pisaniem strony, jeśli w sesji są włączone.
Gdy nie ma żadnego, kontraktem jest lista bloków niżej.

## Bloki obowiązkowe

Kontrakt, nie makieta. Wygląd należy do porucznika — te bloki muszą być:

1. **Nagłówek misji** — kryptonim, status, poligon, przejazd [n], czas operacyjny z komendy
   `date`, nie z pamięci.
2. **CEL i ZAMIAR** — dosłownie z rozkazu, na górze, bez skracania.
3. **Postęp** — zielone / wszystkie, jako liczba **i** jako pasek; osobno pozycje główne,
   osobno poboczne.
4. **Mapa etapów** — wiersz na pozycję: co ma być prawdą · czym sprawdzę · stan. Stan
   klikalny: `niezaliczone → w toku → zielone → odrzucone`.
5. **Zależności zewnętrzne** — rzecz, od kogo, co blokuje, ile trwa, czy uruchomiona.
   Nieuruchomiona zależność o długim czasie realizacji jest alarmem, nie wierszem tabeli.
6. **Czeka na Generała** — decyzje blokujące, po jednym zdaniu. Pusto → napisz „nic".
7. **Jednostki w terenie** — kryptonim, zadanie, od kiedy. Albo „wszystkie wróciły".
8. **Dziennik działań** — ostatnie wpisy z `_dziennik.md`, najnowszy u góry.
9. **Zasoby** — szczyt okna porucznika, wyjście, subagenci. Liczby z pomiaru albo puste;
   nigdy z pamięci.

Czego na BMS-ie **nie ma**: prognoz terminu bez przelicznika ze źródła, ocen zamiast pomiarów,
treści plików. BMS pokazuje stan, nie dorobek.

## Rytm i zasięg

Odświeżenie przy **zamknięciu każdego przejazdu**, razem z zapisem `_operacja.md`, wpisem do
`_dziennik.md` i commitem — ta sama czynność, nie osobna. Publikacja pod ten sam adres: `url`
artefaktu, nigdy nowy. Adres w `_operacja.md`, sekcja ZABEZPIECZENIE; zgubiony → `action: "list"`.

Artefakt jest **prywatny** z chwilą publikacji — zasięg skutków LOKALNY. Udostępnienie
komukolwiek to zasięg GLOBALNY i **bramka Generała**, bez wyjątku.

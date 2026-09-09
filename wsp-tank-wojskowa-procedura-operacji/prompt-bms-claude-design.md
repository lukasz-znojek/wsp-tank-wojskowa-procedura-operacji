---
utworzono: 2026-09-09 05:57
zaktualizowano: 2026-09-09 06:01
typ: prompt
tagi: []
---

# Prompt dla Claude Design - wizualizacja artefaktu BMS

Wklej treść poniżej (od linii „ROLA" do końca) w Claude Design albo w Claude Code z wywołaniem skilla projektowego. Kontrakt niesiony w tym prompcie jest przepisany z `tank-skill-destylat/tank/szablon_bms.md`, `szablon_operacja.md`, `szablon_sitrep.md` i `szablon_dziennik.md` - nie zmieniaj nazw bloków ani kolumn, bo porucznik przepisuje je z plików operacji.

---

## ROLA

Jesteś projektantem interfejsu operacyjnego. Projektujesz **BMS - Battlefield Management System**: jedną stronę, pod jednym adresem, żywą przez całą misję prowadzoną skillem `tank`. To stół operacyjny dowódcy (w doktrynie: Generała).

## PO CO TO KOMU

Dowódca czyta BMS **między przejazdami**, w kilkanaście sekund, i chce z niego trzech odpowiedzi: **co jest zielone, co czeka na mnie, co może pęknąć następne.** Wszystko inne jest tłem. Rozkaz pokazany tylko w oknie czatu przewija się po trzech odpowiedziach - BMS istnieje właśnie dlatego.

## PODZIAŁ PRACY - przeczytaj przed pierwszym pikselem

- **Ty robisz:** wygląd, układ, hierarchię, stany interaktywne i komplet plików wynikowych.
- **Claude Code robi potem:** żywą stronę z zapisem, jako artefakt z `capabilities: {db: {}}`.

Nie projektuj mechaniki zapisu. Projektuj to, co ma być widać, i opisz to tak dokładnie, żeby dało się zaprogramować bez zgadywania.

## ZASADA, KTÓRA RZĄDZI CAŁYM PROJEKTEM

`_operacja.md` (stan) i `_dziennik.md` (dziennik) są **źródłem**. **BMS jest widokiem i kanałem zwrotnym, nigdy drugą prawdą** - rozjazd rozstrzyga plik.

Stąd konsekwencja, którą musisz pokazać wizualnie: **kliknięcie dowódcy nie zmienia stanu misji samo z siebie.** Porucznik je odczytuje, przepisuje do pliku i dopiero to jest stanem. Zaprojektuj więc różnicę między „stan zgłoszony kliknięciem, czeka na przepisanie" i „stan potwierdzony z pliku". To nie ozdoba - bez tego strona kłamie o tym, co już się stało.

## DZIEWIĘĆ BLOKÓW OBOWIĄZKOWYCH

Kontrakt, nie makieta - wygląd należy do Ciebie, te bloki muszą być:

1. **Nagłówek misji** - kryptonim, status, poligon, przejazd [n], czas operacyjny.
2. **CEL i ZAMIAR** - dosłownie z rozkazu, na górze, bez skracania.
3. **Postęp** - zielone / wszystkie, jako liczba **i** jako pasek; osobno pozycje główne, osobno poboczne.
4. **Mapa etapów** - wiersz na pozycję, kolumny dokładnie: `#` · `Co ma być prawdą` · `Czym sprawdzę` · `Stan`. Stan klikalny.
5. **Zależności zewnętrzne** - kolumny: `Rzecz` · `Od kogo` · `Co blokuje` · `Ile trwa` · `Uruchomiona`. Nieuruchomiona zależność o długim czasie realizacji jest **alarmem**, nie wierszem tabeli - pokaż to.
6. **Czeka na Generała** - decyzje blokujące, po jednym zdaniu. Pusto → napisz „nic".
7. **Jednostki w terenie** - kryptonim, zadanie, od kiedy. Albo „wszystkie wróciły".
8. **Dziennik działań** - ostatnie wpisy, **najnowszy u góry**; kolumny: `Data` · `Przejazd` · `Wpis jedną linią`.
9. **Zasoby** - szczyt okna porucznika, wyjście, subagenci. Liczby z pomiaru **albo puste; nigdy z pamięci**.

Dwie rzeczy dochodzą do bloku 9 i bloku 5, bo bez nich strona nie ostrzega:

- **Próg kulminacji:** wiersz w zasobach - `okno: n z n tys.` · `przejazdy zamknięte bez pozycji pierwszej: n z n`, ze stanem `poniżej` albo **`PRZEKROCZONY → pauza operacyjna`**. Przekroczenie to najmocniejszy sygnał na stronie.
- **Log naruszeń:** kolumny `Kiedy` · `Pozycja` · `Reguła` · `Zmierzone` · `Wymagane` · `Runda`. Może być zwinięty, ale musi być dostępny.

## SŁOWNIK STANÓW - jeden, nie trzy

Stan pozycji ma **dokładnie cztery** wartości, w tej kolejności:

`niezaliczone → w toku → zielone → odrzucone`

Nie dodawaj piątej, nie zmieniaj nazw, nie tłumacz na angielski. Osobno i tylko dla całej misji istnieje `status: w toku / zakończona`, a postęp podaje się jako `zielone / wszystkie`. To trzy różne rzeczy i nie wolno ich mieszać - w plikach źródłowych ta niespójność już raz wystąpiła.

## CZEGO NA BMS-IE NIE MA

- prognoz terminu bez przelicznika ze źródła,
- ocen zamiast pomiarów,
- treści plików - BMS pokazuje **stan, nie dorobek**,
- przycisku „udostępnij": strona jest prywatna, a udostępnienie komukolwiek jest decyzją dowódcy poza interfejsem.

Skoro liczba może być pusta, **zaprojektuj wygląd pustej liczby.** Puste musi wyglądać na puste, nie na zero.

## DANE PRZYKŁADOWE - fikcyjne, oznacz je jako fikcyjne

Użyj ich, żeby makieta pokazywała realną misję, a nie wypełniacz. Żadna nazwa niżej nie jest prawdziwą firmą ani osobą.

- **Misja:** OPERACJA „KOMETA" · status: w toku · poligon: Claude Code · przejazd 3 · czas operacyjny 2026-09-09 05:40
- **CEL:** `python3 -m raporty --miesiac 2026-08` kończy się kodem 0 i wypisuje marżę dla wszystkich 4 opiekunów
- **ZAMIAR:** dowódca ma zamknąć miesiąc bez ręcznego liczenia w arkuszu
- **Postęp:** główne 2 / 5 · poboczne 1 / 2
- **Mapa etapów:**
  - `1` · raport uruchamia się końcem do końca i podaje marżę · `python3 -m raporty --miesiac 2026-08; echo $?` · **niezaliczone**
  - `2` · daty w wyjściu są w ISO · `grep -cE '^[0-9]{4}-[0-9]{2}-[0-9]{2}'` → 6 · **zielone**
  - `3` · rekordy bez `id` odrzucane z komunikatem · `grep -c 'brak id'` → 1 · **zielone**
  - `4` · koszty wczytywane ze źródła spoza repo · brak źródła · **odrzucone**
  - `5` · sortowanie po kwocie malejąco · `head -1` → `3440.0` · **w toku**
  - `P1` · README opisuje uruchomienie · `bash` z bloku README kończy się 0 · **niezaliczone**
- **Zależności zewnętrzne:** „zestawienie kosztów za sierpień" · od księgowości · blokuje pozycję 1 i 4 · 3 dni · **nieuruchomiona** ← to jest alarm
- **Czeka na Generała:** „pozycja 4 nieosiągalna bez źródła spoza repo - wycofać z mapy czy czekać na zależność?"
- **Jednostki w terenie:** `CHARLIE` - kontrola formatu dat - od 05:31. Wcześniejsze wróciły.
- **Dziennik działań** (najnowszy u góry): `2026-09-09 · 3 · FRAGO-3 wydane: pozycje 5 i P1` · `2026-09-09 · 3 · ROZSTRZYGNIĘCIE-1: schemat zostaje, bramka dowódcy` · `2026-09-08 · 2 · przejazd 2 zamknięty, pozycje 2 i 3 zielone`
- **Log naruszeń:** `2026-09-08 · poz. 3 · liczba bez komendy obok · „około 5" · komenda i wynik · runda 2`
- **Zasoby:** szczyt okna 237 942 tokenów · wyjście 18 640 tokenów · subagenci 4 jednostki / 61 208 tokenów
- **Próg kulminacji:** okno 238 z 400 tys. · przejazdy zamknięte bez pozycji pierwszej 2 z 3 · **poniżej**

## OGRANICZENIA TECHNICZNE, KTÓRE WIĄŻĄ PROJEKT

Strona powstanie jako artefakt, więc projekt musi być w tym wykonalny:

- **Jeden adres na całą misję.** Odświeżenie publikuje się pod ten sam `url`, nigdy nowy. Nie projektuj nawigacji między wersjami.
- **Motyw widza:** jasny, ciemny albo systemowy. Podaj **komplet** tokenów dla jasnego i przedefiniuj je dla ciemnego; żaden kolor nie może mieć jedynej definicji wewnątrz bloku zapytania o motyw. Tło strony malowane jawnie.
- **Responsywność:** szerokie tabele przewijają się we własnym kontenerze; strona nigdy nie przewija się w poziomie. Sprawdź układ przy 380 px.
- **Bez zasobów z zewnątrz** poza dozwolonymi CDN; obrazy i ikony jako dane w pliku, nie jako odsyłacze.
- **Zapis stanu** przez zdolność bazy artefaktu, nie przez pamięć przeglądarki - kliknięcia muszą przeżyć zamknięcie okna i wrócić do porucznika.

## PLIKI DO WYGENEROWANIA

1. **Artboardy wizualizacji** - co najmniej cztery: pełny stan na szerokim ekranie · ten sam stan przy 380 px · stan pusty, świeżo po think-tanku (wszystko `niezaliczone`, liczby puste) · stan po kliknięciu dowódcy, pokazujący różnicę „zgłoszone" wobec „potwierdzone z pliku". Dodaj piąty z przekroczonym progiem kulminacji.
2. **`bms-spec.md`** - kontrakt interfejsu blok po bloku: co pokazuje, skąd bierze dane, co jest klikalne, co się dzieje po kliknięciu, jak wygląda pusto.
3. **`bms-tokens.css`** - tokeny kolorów, typografii i odstępów; komplet dla trybu jasnego i ciemnego, z nazwami mówiącymi rolę, nie barwę.
4. **`bms-dane.json`** - schemat danych: dokładnie te pola, które strona czyta i zapisuje, z wypełnionym przykładem z sekcji wyżej. To jest kontrakt między stroną a porucznikiem.
5. **`bms-szkielet.html`** - statyczny szkielet z danymi przykładowymi, bez logiki, gotowy do podłączenia zapisu.
6. **`bms-do-zaprogramowania.md`** - lista dla Claude Code: co ma być zapisywane, co odczytywane, które pola przychodzą z pliku operacji, a które wracają jako kliknięcie, i czego nie wolno zapisać bez decyzji porucznika.

## KRYTERIUM ODBIORU - sprawdzalne, nie „ładnie"

- dziewięć bloków obecnych: **9 / 9**, do wyliczenia z nazwy;
- zero słów stanu poza czterema ze słownika;
- kolumny mapy etapów dokładnie `#`, `Co ma być prawdą`, `Czym sprawdzę`, `Stan`;
- każda liczba ma zaprojektowany wygląd pusty;
- makieta czytelna w trybie jasnym **i** ciemnym;
- brak przewijania w poziomie przy 380 px;
- nieuruchomiona zależność i przekroczony próg kulminacji wyróżnione mocniej niż każdy inny element strony.

## CZEGO NIE ROBIĆ

- Nie wymyślaj nazw firm, klientów ani osób - dane wyżej są fikcyjne i tak je oznacz na makiecie.
- Nie dodawaj bloków, których nie ma w kontrakcie. Widzisz brak → **zgłoś go osobno**, nie dokładaj po cichu.
- Nie projektuj wykresów trendu, prognoz ani ocen postępu.
- Nie zmieniaj nazw bloków ani kolumn - porucznik przepisuje je z plików operacji i każda zmiana nazwy rozjeżdża widok ze źródłem.

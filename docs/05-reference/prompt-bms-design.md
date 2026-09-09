# Referencja: prompt projektowy interfejsu BMS

> Materiał referencyjny, **nie specyfikacja wiążąca**. Wyłącznie dane syntetyczne.

## Pochodzenie

Materiał wywodzi się z dokumentu roboczego `prompt-bms-claude-design.md`, przygotowanego jako polecenie dla narzędzia projektowego. Dokument nie był specyfikacją interfejsu — był poleceniem, które miało specyfikację wytworzyć. Rejestr przeniesienia: [pochodzenie materiałów](sources.md).

## Rola tego materiału

Materiał niesie **kontrakt widoku**: listę bloków, które widok stanu scenariusza musi zawierać, oraz ograniczenia, w których taki widok da się zbudować. Wiążącym opisem architektury jest [architektura BMS](../02-architecture/architektura-bms.md), a wiążącym formatem wpisu — [szablon BMS](../04-templates/wpis-bms.md). Przy rozjeździe rozstrzyga dokument wiążący.

Kontrakt zachowano dlatego, że nazwy bloków i kolumn są przepisywane z artefaktów scenariusza. Zmiana nazwy rozjeżdża widok ze źródłem, więc nazwy traktuje się jako ustalone, a nie jako propozycję.

## Do czego widok służy

Koordynator czyta widok między przejazdami, w kilkanaście sekund, i oczekuje trzech odpowiedzi: **co jest zaliczone, co czeka na niego, co może się nie udać jako następne.** Wszystko inne jest tłem.

Powód istnienia widoku jest praktyczny: plan pokazany wyłącznie w rozmowie przestaje być widoczny po kilku wymianach.

## Zasada rozdziału źródła i widoku

Plan operacji i dziennik operacyjny są źródłem. Widok jest widokiem i kanałem zwrotnym, **nigdy drugą prawdą** — przy rozjeździe rozstrzyga plik.

Konsekwencja, którą widok musi pokazywać wizualnie: **zgłoszenie koordynatora nie zmienia stanu scenariusza samo z siebie.** Autor prowadzący je odczytuje, przepisuje do planu operacji i dopiero ten zapis jest stanem. Widok bez rozróżnienia „zgłoszone, czeka na przepisanie" wobec „potwierdzone z pliku" kłamie o tym, co już się stało.

## Kontrakt bloków widoku

Kontrakt, nie makieta: wygląd należy do wykonawcy, obecność bloków nie.

| # | Blok | Co zawiera |
| --- | --- | --- |
| 1 | Nagłówek scenariusza | oznaczenie, status, środowisko, numer przejazdu, czas z pomiaru |
| 2 | Cel i zamiar | dosłownie z planu operacji, na górze, bez skracania |
| 3 | Postęp | zaliczone wobec wszystkich, jako liczba **i** jako pasek; osobno pozycje główne, osobno poboczne |
| 4 | Mapa etapów | wiersz na pozycję, kolumny dokładnie: `#` · `Co ma być prawdą` · `Czym sprawdzę` · `Stan`; stan zgłaszalny |
| 5 | Zależności zewnętrzne | kolumny: `Rzecz` · `Od kogo` · `Co blokuje` · `Ile trwa` · `Uruchomiona` |
| 6 | Czeka na koordynatora | rozstrzygnięcia blokujące, po jednym zdaniu; pusto → słowo „nic" |
| 7 | Zadania w toku | oznaczenie, zadanie, od kiedy; albo „wszystkie wróciły" |
| 8 | Rejestr zdarzeń | ostatnie wpisy z dziennika, **najnowszy u góry**; kolumny: `Data` · `Przejazd` · `Wpis jedną linią` |
| 9 | Zasoby | wielkości zmierzone albo puste; nigdy z pamięci |

Do bloków 5 i 9 dochodzą dwa elementy, bez których widok nie ostrzega:

- **Progi przerwania** — wiersz w zasobach ze stanem `poniżej` albo `przekroczony → przerwa w pracy`. Przekroczenie jest najmocniejszym sygnałem na stronie.
- **Rejestr naruszeń** — kolumny `Kiedy` · `Pozycja` · `Reguła` · `Zmierzone` · `Wymagane` · `Runda`. Może być zwinięty, ale musi być dostępny.

Zależność nieuruchomiona o długim czasie realizacji jest **ostrzeżeniem**, nie wierszem tabeli, i ma być tak pokazana.

## Słownik stanów użyty w materiale źródłowym

Materiał źródłowy operuje **stanem pozycji mapy** o czterech wartościach, w tej kolejności:

`niezaliczone → w toku → zielone → odrzucone`

To pojęcie **odrębne** od cyklu życia artefaktu dokumentowego (`szkic → do-przegladu → zatwierdzony → opublikowany`, plus `odrzucony`), którym posługuje się ta dokumentacja i którego pilnują kontrakty w [`schemas/`](../../schemas/). Materiał źródłowy notuje też, że stan pozycji, status całego scenariusza i postęp podawany jako „zaliczone wobec wszystkich" są trzema różnymi rzeczami i mieszanie ich wystąpiło w plikach źródłowych co najmniej raz.

Rozstrzygnięcie tej rozbieżności: [model stanów](../02-architecture/model-stanow.md), wiersz 2 w [rejestrze pochodzenia](sources.md).

## Czego widok nie zawiera

- Prognoz terminu bez przelicznika wskazanego w źródle.
- Ocen postawionych w miejscu pomiaru.
- Treści dokumentów — widok pokazuje stan, nie dorobek.
- Przycisku udostępniania: widok jest prywatny, a udostępnienie komukolwiek jest rozstrzygnięciem koordynatora podejmowanym poza interfejsem.
- Wykresów trendu i ocen postępu.

Skoro wielkość może być pusta, **wygląd pustej wielkości też jest projektem.** Puste musi wyglądać na puste, nie na zero.

## Ograniczenia techniczne

- **Jeden adres na cały scenariusz.** Odświeżenie publikuje się pod ten sam adres, nigdy nowy. Nawigacji między wersjami się nie projektuje.
- **Motyw odbiorcy:** jasny, ciemny albo systemowy. Komplet definicji kolorów dla trybu jasnego i przedefiniowanie ich dla ciemnego; żaden kolor nie może mieć jedynej definicji wewnątrz bloku zapytania o motyw. Tło malowane jawnie.
- **Responsywność:** szerokie tabele przewijają się we własnym kontenerze; strona nigdy nie przewija się w poziomie. Układ sprawdzany przy szerokości 380 pikseli.
- **Bez zasobów pobieranych z zewnątrz** poza wyraźnie dozwolonymi; obrazy i ikony osadzone w dokumencie, nie jako odsyłacze.
- **Zapis stanu** trwały, przeżywający zamknięcie okna, a nie ulotny — zgłoszenia koordynatora muszą wrócić do autora prowadzącego.

## Kryteria odbioru projektu

Sprawdzalne, nie „ładnie":

- dziewięć bloków obecnych, do wyliczenia z nazwy;
- zero słów stanu poza wartościami ze słownika;
- kolumny mapy etapów dokładnie `#`, `Co ma być prawdą`, `Czym sprawdzę`, `Stan`;
- każda wielkość ma zaprojektowany wygląd pusty;
- widok czytelny w trybie jasnym **i** ciemnym;
- brak przewijania w poziomie przy 380 pikselach;
- zależność nieuruchomiona i przekroczony próg przerwania wyróżnione mocniej niż każdy inny element strony.

## Czego materiał nie obejmuje

- Mechaniki zapisu — materiał opisuje, co ma być widoczne, nie jak to zapisać.
- Modelu danych artefaktów — ten opisuje [model danych](../02-architecture/model-danych.md) i kontrakty w [`schemas/`](../../schemas/).
- Integracji z jakimkolwiek systemem zewnętrznym — patrz [integracje](../02-architecture/integracje.md).
- Danych przykładowych. Zestaw przykładowy z dokumentu roboczego **nie został przeniesiony**: zawierał liczby i nazwy powiązane z konkretnym środowiskiem pracy. Rolę przykładu pełnią syntetyczne artefakty w [`examples/`](../../examples/).

## Powiązane artefakty

- Architektura: [architektura BMS](../02-architecture/architektura-bms.md), [model danych](../02-architecture/model-danych.md), [model stanów](../02-architecture/model-stanow.md)
- Szablon: [BMS](../04-templates/wpis-bms.md)
- Procedura: [przejazd](../03-procedures/przejazd.md)
- Pochodzenie: [rejestr pochodzenia](sources.md)

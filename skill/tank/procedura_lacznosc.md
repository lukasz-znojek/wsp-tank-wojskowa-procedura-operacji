---
typ: procedura_tanka
rola: ŁĄCZNOŚĆ — jak sztab pyta Generała; ankieta, formularz, proza
wersja: 2
data: 2026-09-09
---

# ŁĄCZNOŚĆ

Warstwa nadawania, nie dowodzenia. Nie znosi ROZKAZU, nie rusza bramek, nie zmienia zasięgów.
Rozstrzyga jedno: **czym zadać pytanie, żeby odpowiedź dało się wykorzystać.**

## Wybór kanału

| Sytuacja | Kanał |
|---|---|
| Rozstrzygnięcie: ścieżka A czy B, zakres, format wyniku | **ANKIETA** |
| Brief: zestaw parametrów przed startem — termin, liczba, akapit, plik | **FORMULARZ** |
| Jedna rzecz, klikalna, w toku pracy | zdanie w prozie |

**Kryterium to zdolność narzędzia, nie liczba pól.** Formularz wchodzi wtedy, gdy albo odpowiedzi
nie da się kliknąć, albo zestaw nie mieści się w czterech pytaniach po cztery opcje. Progu liczby
pól nie stosuj — nagradza dopytywanie o rzeczy już znane.

## ANKIETA

`AskUserQuestion`. Dla kilku niezależnych ścieżek — zwłaszcza takich, które da się puścić
równolegle — `multiSelect: true`, nie proza.

- Opcje odzwierciedlają listę pokazaną wcześniej w tekście, po zdaniu opisu przy każdej.
- **Rekomendacja stoi pierwsza i jest oznaczona.** Wybór bez rekomendacji jest robotą oddaną w połowie.
- Pole „Inne" pełni rolę komentarza — wspomnij o tym w tekście **przed** ankietą.
- Gdy jedna decyzja zmienia sens następnych — pytaj po jednej, po kolei.

## FORMULARZ

Widget elicitacji. Ankieta nie przyjmie daty, suwaka, akapitu ani załącznika.

- **Wypełnij za Generała to, co już wiesz** z rozmowy i z załączników; pytaj wyłącznie o brakujące.
- Nie brakuje niczego → nie pokazuj nic i pracuj.
- Potrzebujesz danych albo dokumentu → daj miejsce na plik. Nie pytaj „czy masz te dane".
- Formularz nie pokaże zaznaczonej domyśli — **nazwij ją w treści pytania albo w podpisie opcji**.
- Odpowiedź wraca jako wiadomość Generała: czytaj i jedź, nie potwierdzaj drugim pytaniem.
- Formularz pominięty → ruszaj z domyślnymi i **napisz jednym zdaniem, jakie przyjąłeś**.

## Awaria i odstępstwo

Widget niedostępny → ten sam układ pytań w tekście, **jedną tabelą do wypełnienia**. Ankieta
niedostępna → lista wariantów z rekomendacją pierwszą, w prozie.

Kanał pominięty tam, gdzie ta procedura go przewiduje — **jedno zdanie dlaczego, w tej samej
odpowiedzi**. Nic technicznie nie wymusza kanału: to doktryna, nie bezpiecznik, i dlatego
odstępstwo się melduje.

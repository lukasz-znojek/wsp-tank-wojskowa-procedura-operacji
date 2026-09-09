# Procedura: łączność

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Rozstrzygnąć, czym zadać koordynatorowi pytanie, żeby odpowiedź dała się wykorzystać bez dopytywania. Procedura dotyczy sposobu nadawania pytania, nie tego, kto rozstrzyga.

## Zakres

Stosuje się do każdego pytania kierowanego od zespołu do koordynatora, w każdym etapie scenariusza. Jest warstwą nadawania: nie znosi polecenia wiążącego, nie rusza rozstrzygnięć wymaganych przy operacjach nieodwracalnych i nie zmienia zakresów odpowiedzialności.

**Kiedy się nie stosuje:** gdy nie brakuje niczego. Wtedy nie pokazuje się nic i pracuje dalej.

## Role

| Rola | Udział |
| --- | --- |
| Autor prowadzący | wybiera kanał, przygotowuje pytanie, wypełnia z góry to, co już wie |
| Koordynator | odpowiada; jego odpowiedź wraca jako zwykła wiadomość i nie wymaga drugiego potwierdzenia |
| Recenzent, analityk | zgłaszają potrzebę rozstrzygnięcia do autora prowadzącego, nie pytają koordynatora bezpośrednio |

## Dane wejściowe

- Lista rzeczy brakujących do rozpoczęcia albo kontynuacji pracy.
- Wszystko, co już wiadomo z rozmowy, z załączników i z planu operacji.
- Charakter brakującej odpowiedzi: wariant do wskazania, wartość do podania, dokument do dostarczenia.

## Kroki

1. **Ustal, czego brakuje, i odejmij to, co już wiesz.** Wypełnij za koordynatora wszystko, co wynika z rozmowy i z załączników. Jedno pytanie jest lepsze niż pięć, z których cztery już znasz.

2. **Wybierz kanał.**

   | Sytuacja | Kanał |
   | --- | --- |
   | Rozstrzygnięcie: ścieżka A czy B, zakres, format wyniku | **ankieta wyboru** |
   | Zestaw parametrów przed startem: termin, liczba, dłuższy opis, plik | **formularz** |
   | Jedna rzecz, dająca się wskazać kliknięciem, w toku pracy | **zdanie w prozie** |

   **Kryterium to zdolność narzędzia, nie liczba pól.** Formularz wchodzi wtedy, gdy albo odpowiedzi nie da się wskazać kliknięciem, albo zestaw nie mieści się w czterech pytaniach po cztery opcje. Progu liczby pól nie stosuj — nagradzałby dopytywanie o rzeczy już znane.

3. **Ankieta wyboru — zasady.**
   - Opcje odzwierciedlają listę pokazaną wcześniej w tekście, z jednym zdaniem opisu przy każdej.
   - **Rekomendacja stoi pierwsza i jest oznaczona.** Wybór bez rekomendacji jest pracą oddaną w połowie.
   - Uzasadnienie rekomendacji ma być na tyle konkretne, żeby dało się je obalić.
   - Pole na odpowiedź własną pełni rolę komentarza — wspomnij o tym w tekście **przed** ankietą.
   - Gdy jedna decyzja zmienia sens następnych, pytaj po jednej, po kolei.
   - Dla kilku niezależnych ścieżek, zwłaszcza dających się prowadzić równolegle, dopuść wybór wielokrotny.

4. **Formularz — zasady.**
   - Pytaj wyłącznie o brakujące; pola wynikające z rozmowy wypełnij z góry.
   - Gdy potrzebujesz danych albo dokumentu, daj miejsce na plik. Nie pytaj, czy koordynator te dane ma.
   - Formularz nie pokaże zaznaczonej domyśli — **nazwij domyśl w treści pytania albo w podpisie opcji**. Inaczej traci się to, co daje tabela z wpisanymi domyślami: możliwość poprawienia tylko tego, co się nie zgadza.
   - Odpowiedź wraca jako zwykła wiadomość koordynatora: czytaj ją i idź dalej, nie potwierdzaj drugim pytaniem.
   - Formularza nie używaj do rozstrzygnięć zależnych — zbiera wszystko naraz.

5. **Zapisz rozstrzygnięcie.** Odpowiedź, która zmienia zakres, format wyniku albo stan pozycji mapy, wchodzi wierszem do dziennika operacyjnego. Odpowiedź uzupełniająca brakujący parametr wchodzi do planu operacji.

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Ankieta czy formularz | czy odpowiedź da się wskazać kliknięciem i czy mieści się w czterech pytaniach po cztery opcje | tak i tak → ankieta; w przeciwnym razie → formularz | autor prowadzący |
| Formularz czy praca bez pytania | czy po odjęciu tego, co już wiadomo, cokolwiek zostaje | nic nie zostaje → nie pokazuj nic i pracuj | autor prowadzący |
| Jedna ankieta czy kilka po kolei | czy rozstrzygnięcie zmienia sens następnych | zmienia → pytaj po jednej; nie zmienia → jedna ankieta | autor prowadzący |
| Koordynator pominął formularz | brak odpowiedzi | rusz z domyślnymi i napisz jednym zdaniem, jakie przyjąłeś | autor prowadzący |
| Kanał pominięty tam, gdzie procedura go przewiduje | odstępstwo od kroku 2 | wykonaj pracę i podaj jedno zdanie uzasadnienia w tej samej odpowiedzi | autor prowadzący |

## Dane wyjściowe

- Pytanie zadane właściwym kanałem, z wypełnionymi polami znanymi i oznaczoną rekomendacją.
- Rozstrzygnięcie koordynatora zapisane w dzienniku operacyjnym albo w planie operacji.
- Jedno zdanie o przyjętych domyślach, gdy koordynator pytanie pominął.
- Jedno zdanie uzasadnienia, gdy przewidziany kanał został pominięty.

## Wyjątki

- **Formularz jest niedostępny.** Ten sam układ pytań w tekście, jedną tabelą do wypełnienia.
- **Ankieta jest niedostępna.** Lista wariantów w prozie, z rekomendacją pierwszą i oznaczoną.
- **Odpowiedź koordynatora jest sprzeczna z planem operacji.** Nazwij obie strony w jednym zdaniu i zapytaj o rozstrzygnięcie, zamiast wybierać po cichu.
- **Odpowiedź zawiera dane niedopuszczone.** Nie przenoś ich do dokumentacji. Zapisz sam parametr, a materiał zgłoś poza repozytorium — patrz [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md).
- **Ta procedura nie jest blokadą.** Nic technicznie nie wymusza wyboru kanału: to zapis, nie mechanizm. Dlatego odstępstwo się melduje.

## Powiązane artefakty

- Procedury: [think-tank](think-tank.md), [komenda](komenda.md), [przejazd](przejazd.md)
- Szablony: [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [plan operacji](../04-templates/plan-operacji.md)
- Overview: [ograniczenia i zasady](../00-overview/ograniczenia-i-zasady.md)

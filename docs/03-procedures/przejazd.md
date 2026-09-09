# Procedura: przejazd

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Przeprowadzić jeden zamknięty cykl pracy nad wybranym zakresem mapy etapów — od zlecenia cząstkowego do odbioru przez koordynatora — tak aby po jego zakończeniu stan scenariusza był zapisany, a co najmniej jedna pozycja mapy miała rozstrzygnięty stan.

## Zakres

Stosuje się po zatwierdzeniu planu operacji, powtarzalnie, aż pozycja pierwsza mapy etapów zostanie zaliczona. Jeden przejazd obejmuje kilka pozycji mapy, nie całą mapę.

**Kiedy się nie stosuje:** przed zatwierdzeniem planu oraz po zaliczeniu pozycji pierwszej — wtedy stosuje się [procedurę meldunku](meldunek.md).

## Role

| Rola | Udział |
| --- | --- |
| Koordynator | odbiera przejazd, rozstrzyga przy wyczerpaniu progu, zatwierdza operacje nieodwracalne |
| Autor prowadzący | wydaje zlecenie cząstkowe, zamyka przejazd, prowadzi dziennik i widok stanu |
| Autor prowadzący etap | prowadzi pętlę budowy wewnątrz przejazdu, bez przerw między zadaniami |
| Autor | wytwarza artefakt wobec kryterium ze zlecenia |
| Recenzent | ocenia artefakt wobec tego samego kryterium, przy pomocy wskazanej miary |
| Analityk | wykonuje zadania analityczne, gdy niewiadoma blokuje rozstrzygnięcie |

## Dane wejściowe

- Zatwierdzony plan operacji z mapą etapów i progami przerwania.
- Dziennik operacyjny z historią poprzednich przejazdów.
- Stan pozycji mapy po ostatnim odbiorze.
- Mechanizm walidacji dostępny od pierwszego przejazdu.

## Kroki

1. **Zlecenie cząstkowe.** Jedno zdanie: zakres z mapy etapów — kilka pozycji, nie cała mapa — plus kryterium zaliczenia. Zlecenie otrzymuje numer i wchodzi jednym wierszem do dziennika operacyjnego.

2. **Zadanie analityczne.** Wyłącznie wtedy, gdy niewiadoma blokuje rozstrzygnięcie albo gdy materiał źródłowy zająłby w głównym toku więcej miejsca niż wynik — patrz [procedura zwiadu](zwiad.md).

3. **Budowa.** Autor prowadzący etap prowadzi pętlę: autor wytwarza, recenzent ocenia wobec kryterium ze zlecenia, poprawka wraca do autora, bez przerwy między zadaniami. Zmiana o dużym zasięgu idzie w izolowanej kopii materiału — nietknięta znika sama, przyjęta jest scalana. Gdy coś nie działa: **najpierw odtworzenie awarii poleceniem, potem zmiana**. Poprawka bez odtworzonej awarii jest zgadywaniem i jest zakazana.

4. **Zaliczenie pozycji.** Pozycja przechodzi w stan zaliczony wyłącznie na podstawie dowodu uzyskanego **po ostatniej zmianie**. Obowiązują dwie zasady pomiaru:

   **Recenzent dostaje miarę, nie tylko regułę.** Do każdej reguły dołóż w zleceniu polecenie albo narzędzie, którym się ją mierzy. Recenzent bez narzędzia zwróci opinię — i nie będzie po czym poznać, że to opinia.

   **Reguły niemierzalnej się nie szacuje.** Autor pisze `niemierzalne` i wraca. Ocena podana jako pomiar jest gorsza niż brak pomiaru.

5. **Zamknięcie przejazdu.** Jedna czynność, nie cztery: zapis stanu do planu operacji, wiersz do dziennika operacyjnego, odświeżenie widoku stanu **pod ten sam adres** i utrwalenie zmian w kontroli wersji. Widok zaległy o jeden przejazd jest gorszy niż jego brak, bo koordynator czyta go jako aktualny.

6. **Rejestr naruszeń.** Każde naruszenie reguły wchodzi do dziennika operacyjnego wg [szablonu dziennika](../04-templates/dziennik-operacyjny.md): kiedy · pozycja · reguła · zmierzone · wymagane · runda.

7. **Odbiór.** Koordynator otrzymuje [SITREP](../04-templates/sitrep.md) i rozstrzyga, czy rezultat odpowiada zleceniu. Stany zgłoszone przez koordynatora w widoku stanu autor prowadzący odczytuje i przepisuje do planu operacji — dopiero zapis w planie jest stanem. Następnie: kolejny przejazd albo [procedura meldunku](meldunek.md).

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Zakres zlecenia cząstkowego | liczba pozycji mapy objętych zleceniem | kilka pozycji, nigdy cała mapa | autor prowadzący |
| Czy zlecać zadanie analityczne | niewiadoma blokuje rozstrzygnięcie albo materiał zalałby główny tok | tak → zadanie wg procedury zwiadu; nie → buduj | autor prowadzący |
| Pętla poprawek nie domyka się | próg pięciu rund poprawek na jednej pozycji | próg wyczerpany → rozstrzygnięcie przechodzi do koordynatora | autor prowadzący etap |
| Reguła nie ma miary | brak polecenia albo narzędzia przy regule | pozycja wraca; `niemierzalne` zamiast oceny | recenzent |
| Dowód zaliczenia jest starszy niż ostatnia zmiana | czas dowodu wobec czasu zmiany | pozycja nie jest zaliczona, dowód powtórzony | recenzent |
| Próg przerwania osiągnięty | progi z planu operacji | przerwa w pracy: zapis, SITREP, rozstrzygnięcie koordynatora | autor prowadzący |
| Pozycja już zaliczona, pojawia się pomysł jej pogłębienia | stan pozycji | pozycja zaliczona jest zamknięta; pogłębianie ponad cel jest gubieniem celu | autor prowadzący |
| Operacja nieodwracalna w zakresie przejazdu | brak wypełnionej kolumny „jak cofnąć" | brak tej kolumny stawia rozstrzygnięcie u koordynatora bezwarunkowo | koordynator |

## Dane wyjściowe

- Zaktualizowany plan operacji: stany pozycji mapy, licznik przejazdów, postęp.
- Wiersze w dzienniku operacyjnym: zlecenie cząstkowe, zlecenia i powroty zadań analitycznych, zamknięcie przejazdu.
- Wiersze w rejestrze naruszeń, jeśli naruszenia wystąpiły.
- Odświeżony widok stanu pod niezmienionym adresem.
- SITREP przekazany koordynatorowi do odbioru.

## Wyjątki

- **Awarii nie da się odtworzyć poleceniem.** Zmiana nie wchodzi. Zapisz to jako pozycję nieustaloną, nie jako poprawkę wykonaną.
- **Ta sama reguła złamana trzeci raz przez różnych wykonawców.** To defekt reguły albo sposobu jej przekazywania, nie defekt wykonawcy: przepisz regułę, zamiast poprawiać po raz trzeci.
- **Koordynator jest niedostępny w chwili odbioru.** Przejazd zostaje zamknięty i zapisany, praca nowa się nie zaczyna. SITREP czeka.
- **Zmiana zawierała materiał niedopuszczony.** Ogranicz ekspozycję, usuń materiał z gałęzi roboczej i zgłoś sprawę poza repozytorium — patrz [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md).
- **Widok stanu nie dał się odświeżyć.** Odnotuj w SITREP, że widok jest zaległy, i podaj, o ile przejazdów. Milczenie o zaległości jest gorsze niż zaległość.
- **Tryb pracy bez przerw na odbiór.** Odbiory nie zatrzymują pracy, a rozstrzygnięcia autora prowadzącego wchodzą numerowane do dziennika. Progi przerwania i rozstrzygnięcia koordynatora przy operacjach nieodwracalnych działają dalej — ten tryb ich nie znosi.

## Powiązane artefakty

- Szablony: [SITREP](../04-templates/sitrep.md), [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [plan operacji](../04-templates/plan-operacji.md), [BMS](../04-templates/wpis-bms.md)
- Procedury: [zwiad](zwiad.md), [komenda](komenda.md), [meldunek](meldunek.md), [think-tank](think-tank.md)
- Kontrakty danych: [`schemas/sitrep.schema.json`](../../schemas/sitrep.schema.json), [`schemas/bms-event.schema.json`](../../schemas/bms-event.schema.json)
- Model stanów: [model stanów](../02-architecture/model-stanow.md)

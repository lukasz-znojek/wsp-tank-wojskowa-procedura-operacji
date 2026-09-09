# Procedura: rozpoznanie

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Ustalić stan wyjściowy fikcyjnego scenariusza przed zbudowaniem mapy etapów, tak aby mapa nie stała na założeniu niesprawdzonym. Wynik zasila pole Położenie w planie operacji.

## Zakres

Stosuje się jednorazowo na wejściu scenariusza, w ramach [procedury think-tank](think-tank.md), w dwóch wariantach: scenariusz nowy (materiał pusty) i scenariusz zastany (materiał istniejący, niekompletny lub wzajemnie sprzeczny).

**Kiedy się nie stosuje:** gdy stan wyjściowy jest w całości opisany w poleceniu koordynatora i każde twierdzenie o nim ma wskazany sposób sprawdzenia. Rozpoznanie nie służy do potwierdzania tego, co już zmierzone.

## Role

| Rola | Udział |
| --- | --- |
| Autor prowadzący | wybiera wariant, zleca zadania analityczne, scala wynik do Położenia |
| Analityk | wykonuje zadania analityczne wg [procedury zwiadu](zwiad.md) |
| Koordynator | rozstrzyga, gdy rozpoznanie unieważni założenie polecenia |

## Dane wejściowe

- Cztery pola polecenia po redakcji: rola, położenie, zadanie, ograniczenia.
- Materiały wskazane przez koordynatora jako istniejące.
- Zakres wyłączony — co do materiału nie należy i nie ma być czytane.

## Kroki

### Wariant A — scenariusz nowy

1. Wypisz założenia, na których miałaby stanąć mapa etapów. Założenie to zdanie, które można obalić.
2. Dla każdego założenia zleć zadanie analityczne sprawdzające je **przed** zbudowaniem mapy.
3. Przyjmij wyłącznie te założenia, przy których analityk podał sposób sprawdzenia. Pozostałe oznacz jako niesprawdzone i nie opieraj na nich pozycji mapy.
4. Wynik zapisz do Położenia w planie operacji: co · czym sprawdzone · wynik.

### Wariant B — scenariusz zastany

Kolejność jest wiążąca.

1. **Inwentaryzacja tego, co działa.** Tabela: co · czym sprawdzone · wynik. Pozycja bez wypełnionej kolumny „czym sprawdzone" nie jest ustaleniem — przejdź z nią do kroku 3.
2. **Zabezpieczenie materiału niepowiązanego.** Informacje, dokumenty, wyniki analiz i rozstrzygnięcia leżące poza strukturą. Szczególnie: jedyne kopie treści otwartych, umieszczone w dokumentach wyglądających na zamknięte. Wynik: lista zabezpieczonych pozycji z miejscem docelowym każdej.
3. **Czego nie ustalono.** Trzy kategorie osobno: korzeń problemu, wzorzec jego występowania, wykluczenia — co zostało sprawdzone i odpadło.
4. **Rekomendacja z falsyfikatorem.** Rekomendacja bez zdania mówiącego, co by ją obaliło, wchodzi ze statusem niesprawdzone. Dołóż bilans objętości: ile materiału wchodzi do scenariusza, a ile zostaje poza nim.
5. Po zamknięciu wariantu B przejdź przez wariant A dla założeń, które z niego wynikły.

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Wybór wariantu | istnieje materiał zastany dotyczący scenariusza | materiał istnieje → wariant B, potem A; materiał pusty → wariant A | autor prowadzący |
| Twierdzenie bez sposobu sprawdzenia | brak kolumny „czym sprawdzone" | nie jest ustaleniem, wchodzi do „czego nie ustalono" | autor prowadzący |
| Brak trafień w materiale | wykonano kontrolę pozytywną | bez kontroli pozytywnej brak trafień nie jest wnioskiem o materiale | analityk |
| Rozpoznanie obaliło założenie polecenia | założenie należy do zamiaru albo poza niego wykracza | w granicach zamiaru — korekta bez pytania; poza zamiarem — rozstrzyga koordynator | autor prowadzący |
| Materiał zawiera dane niedopuszczone | pozycja z [klasyfikacji informacji](../06-governance/klasyfikacja-informacji.md) | pozycja nie wchodzi do dokumentacji; zgłoś ją poza repozytorium | autor prowadzący |

## Dane wyjściowe

- Wypełnione pole Położenie w planie operacji: tabela co · czym sprawdzone · wynik.
- Lista pozycji nieustalonych w trzech kategoriach: korzeń, wzorzec, wykluczenia.
- Lista założeń przyjętych, każde ze sposobem sprawdzenia.
- Dla wariantu B: lista materiału zabezpieczonego z miejscem docelowym oraz rekomendacja z falsyfikatorem.

## Wyjątki

- **Materiał jest większy, niż da się przejrzeć w ramach scenariusza.** Zbadaj pozycje blokujące pozycję pierwszą mapy, resztę wypisz jako nieustalone i podaj ich udział. Powyżej pięciu procent materiału nieklasyfikowalnego nie wyciągaj z tego pomiaru wniosku.
- **Dwa dokumenty źródłowe są sprzeczne.** Nazwij obie strony, rozstrzygnij i dopisz wiersz do [rejestru pochodzenia](../05-reference/sources.md). Nie wygładzaj rozbieżności.
- **Materiał leży w zakresie wyłączonym.** Nie czytaj go. Brak, który z tego wynika, jest ustaleniem do zameldowania, nie powodem, by zakres poszerzyć.
- **Analityk zwrócił wynik oznaczony jako częściowy.** Traktuj jak brak, nie jak ustalenie; przy potrzebie domknięcia zleć zadanie węższe.

## Powiązane artefakty

- Procedury: [think-tank](think-tank.md), [zwiad](zwiad.md), [przejazd](przejazd.md)
- Szablony: [plan operacji](../04-templates/plan-operacji.md), [SITREP](../04-templates/sitrep.md)
- Governance: [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md)
- Referencje: [rejestr pochodzenia](../05-reference/sources.md)

# Procedura: think-tank

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Doprowadzić surowe polecenie koordynatora do zatwierdzonego planu fikcyjnego scenariusza. Wyjściem jest wypełniony plan operacji, założony dziennik operacyjny i opublikowany widok stanu — wszystkie w stanie umożliwiającym rozpoczęcie pracy bez dopytywania.

## Zakres

Stosuje się na wejściu każdego scenariusza obejmującego co najmniej dwa etapy wykonawcze.

**Kiedy się nie stosuje:** scenariusz jednoetapowy, dotyczący jednego artefaktu, którego cel da się zapisać jednym zdaniem i sprawdzić jednym poleceniem. Dla takiego scenariusza koszt redakcji planu przewyższa korzyść — pracę prowadzi się bez planu formalnego.

## Role

| Rola | Udział |
| --- | --- |
| Koordynator | dostarcza surowe polecenie, ustala progi przerwania, zatwierdza plan |
| Autor prowadzący | redaguje polecenie, buduje mapę etapów, wypełnia plan operacji i zakłada dziennik |
| Analityk | wykonuje rozpoznanie wstępne oraz audyt braków |
| Administrator projektu | potwierdza dostępność środowiska scenariusza i mechanizmu walidacji |

## Dane wejściowe

- Surowe polecenie koordynatora — dowolna forma, także niepełna.
- Materiały załączone przez koordynatora.
- Wynik rozpoznania wstępnego, jeśli scenariusz dotyczy materiału zastanego.
- Lista narzędzi i mechanizmów dostępnych w danym środowisku scenariusza.

## Kroki

1. **Zebranie czterech pól polecenia.** Autor prowadzący zbiera je formularzem, nie prozą i nie ankietą wyboru — patrz [procedura łączności](lacznosc.md). Kolejność pól jest wiążąca, bo każde następne czyta się przez poprzednie.

   | Pole | Co zawiera | Czym grozi puste |
   | --- | --- | --- |
   | Rola | kim ma być wykonawca i czego się po nim spodziewać | wykonawca przyjmuje rolę domyślną i doradza, zamiast wykonywać |
   | Położenie | co już istnieje, czego próbowano, co zawiodło | odbudowa wiedzy, którą koordynator ma i tak — najdroższa pozycja scenariusza |
   | Zadanie | jeden mierzalny stan końcowy i dowód, który go rozstrzyga | kryterium jakościowe zamiast sprawdzalnego, odbiór nierozstrzygalny |
   | Ograniczenia | czego nie wolno zmieniać, z uzasadnieniem przy każdym | ograniczenie bez powodu zostanie przy okazji „poprawione" |

   Przed pokazaniem formularza autor prowadzący wypełnia za koordynatora wszystko, co wynika z rozmowy i z załączników, i pyta wyłącznie o brakujące.

2. **Redakcja w rundach.** Koordynator oddaje surowiec; autor prowadzący **przepisuje** cztery pola na wersję ostrzejszą i pokazuje ją obok surowej, wskazując co doprecyzował, co uznał za domysł i czego wciąż brakuje; koordynator poprawia albo przyjmuje. Redakcja obowiązuje także wtedy, gdy polecenie brzmi jednoznacznie.

3. **Kwalifikacja.** Rozmowa, nie formularz: pytanie po pytaniu, aż wyjdzie cel, zamiar i zakres wyłączony. Jeśli jedna runda wystarcza, scenariusz nie kwalifikuje się do tej procedury — patrz Zakres.

4. **Rozpoznanie wstępne.** Wykonaj [procedurę rozpoznania](rozpoznanie.md). Wynik wchodzi do pola Położenie.

5. **Potwierdzenie trwałości zapisu.** Administrator projektu potwierdza, że scenariusz jest prowadzony w miejscu z kontrolą wersji i że dostępny jest mechanizm walidacji. Wynik i jego skutek dla trybu pracy wpisz do planu operacji.

6. **Mapa etapów.** Pozycje w kolejności zależności, każda z kryterium zaliczenia sprawdzalnym poleceniem. Pozycja pierwsza opisuje rezultat kompletny, nie fragment. Pozycje poboczne oznaczaj osobno.

7. **Utworzenie artefaktów.** Wypełnij [szablon planu operacji](../04-templates/plan-operacji.md) i załóż [dziennik operacyjny](../04-templates/dziennik-operacyjny.md). Oba leżą poza katalogiem realizacji scenariusza.

8. **Zależności zewnętrzne.** Wypisz, co przyjdzie spoza scenariusza: materiały, zgody, dostępy, rozstrzygnięcia osób trzecich. Uruchom je **od razu**, nie w chwili zablokowania.

9. **Audyt braków.** Zadanie analityczne z pytaniem odwrotnym do rozpoznania: nie „co tam jest", ale *jakie pytania musiałby zadać wykonawca, żeby ruszyć bez dopytywania*. Jedno zadanie na pozycję mapy, równolegle, bez wykonywania samej pozycji. Zwrot: pytanie w jednej linii, wskazanie miejsca w dokumentacji albo słowo `brak`, oraz pozycja, od której brak blokuje. **Zero pytań na pozycji oznacza gotowość tej pozycji**; braki na pozycjach dalszych nie wstrzymują startu. Pytania idą do koordynatora **jedną rundą**.

10. **Publikacja widoku stanu.** Zbuduj widok wg [szablonu BMS](../04-templates/bms.md) i wpisz jego adres do planu operacji. Widok powstaje **przed** zatwierdzeniem, bo plan pokazany tylko w rozmowie przestaje być widoczny po kilku wymianach.

11. **Zatwierdzenie.** Koordynator zatwierdza plan. Bez zatwierdzenia praca nad etapami się nie zaczyna.

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Runda redakcji nie zmieniła żadnego z czterech pól | brak zmiany w polach | runda jest ostatnia, przejdź do kwalifikacji | autor prowadzący |
| Trzy rundy bez domknięcia | licznik rund | to brak rozstrzygnięcia po stronie koordynatora: nazwij je i zapytaj wprost ankietą z rekomendacją | autor prowadzący |
| Kwalifikacja domknięta w jednej rundzie | liczba rund kwalifikacji | procedura się nie stosuje, pracuj bez planu formalnego | autor prowadzący |
| Rozpoznanie unieważniło założenie planu | założenie wskazane w Położeniu okazało się nieprawdziwe | korekta w granicach zamiaru — kontynuuj; poza zamiarem — wracaj do koordynatora | autor prowadzący |
| Audyt braków zwrócił pytania blokujące pozycję pierwszą | co najmniej jedno pytanie przy pozycji pierwszej | start wstrzymany do odpowiedzi koordynatora | koordynator |
| Kryterium zaliczenia pozycji nie jest sprawdzalne | brak polecenia albo sprawdzianu przy pozycji | pozycja wraca do redakcji, nie wchodzi do mapy | autor prowadzący |

## Dane wyjściowe

- Plan operacji w stanie `zatwierdzony`, z celem, dowodem, zamiarem, mapą etapów, progami przerwania i tabelą zależności zewnętrznych.
- Dziennik operacyjny w stanie `szkic`, z pierwszym wpisem o zatwierdzeniu planu.
- Widok stanu w stanie `opublikowany`, z adresem zapisanym w planie.
- Lista pytań otwartych skierowana do koordynatora, jeśli audyt braków je zwrócił.

## Wyjątki

- **Koordynator pomija formularz.** Rusz z założeniami domyślnymi i napisz jednym zdaniem, jakie zostały przyjęte.
- **Formularz jest niedostępny.** Ten sam układ pytań w tekście, jedną tabelą do wypełnienia — patrz [procedura łączności](lacznosc.md).
- **Materiał zastany jest w stanie uniemożliwiającym mapę.** Wykonaj najpierw ścieżkę scenariusza zastanego z [procedury rozpoznania](rozpoznanie.md), potem wróć do kroku 6.
- **Brak kontroli wersji w miejscu pracy.** Dziennik prowadź wyłącznie w trybie dopisywania i odnotuj w planie, że odzysk stanu wymaga działania człowieka, nie procedury.
- **Nazwa scenariusza, podmiotu lub ramy nie wynika z polecenia.** Wpisz `[do potwierdzenia]`. Nazwy nie zgaduj — patrz [ograniczenia i zasady](../00-overview/ograniczenia-i-zasady.md).

## Powiązane artefakty

- Szablony: [plan operacji](../04-templates/plan-operacji.md), [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [BMS](../04-templates/bms.md)
- Procedury: [rozpoznanie](rozpoznanie.md), [zwiad](zwiad.md), [łączność](lacznosc.md), [przejazd](przejazd.md)
- Kontrakt danych: [`schemas/operation.schema.json`](../../schemas/operation.schema.json)
- Przykład: [`examples/operation-example-alpha.md`](../../examples/operation-example-alpha.md)
- Decyzje: [ADR-004](../02-architecture/decyzje/ADR-004.md)

# Referencja: katalog zdolności rezerwowych

> Materiał referencyjny, **nie specyfikacja wiążąca**. Wyłącznie dane syntetyczne.

## Pochodzenie

Materiał wywodzi się z dokumentu roboczego `arsenal.md`, prowadzonego jako katalog mechanizmów dostępnych w środowisku pracy, ale **celowo nieopisanych w żadnej procedurze**. Dokument źródłowy oznaczał swoją rolę wprost: katalog rezerwowy, oczekujący na wyzwalacz, nienależący do przebiegu działania. Rejestr przeniesienia: [pochodzenie materiałów](sources.md).

Nazwy metaforyczne z dokumentu źródłowego zachowano w nawiasach jako ślad pochodzenia. Wiążącą nazwą jest nazwa mechanizmu.

## Rola tego materiału

Katalog odpowiada na jedno pytanie: **co jest technicznie możliwe, czego jeszcze nie ma w procedurze.** Nie jest listą rzeczy do wdrożenia ani rekomendacją. Zdolność wpisana tutaj nie obowiązuje w żadnej procedurze i nie wolno się na nią powoływać jak na ustalenie.

Katalog istnieje dlatego, że brak takiej listy prowadzi do dwóch strat naraz: mechanizm użyteczny jest wynajdywany od nowa przy każdym scenariuszu, a mechanizm nieużyteczny wchodzi do procedury bez pomiaru.

## Zasada wejścia zdolności do procedury

Zdolność wchodzi do procedury **wyłącznie na wyzwalacz**, w tej kolejności:

1. Scenariusz żąda zdolności — pojawia się konkretna potrzeba, nie przewidywanie potrzeby.
2. Zdolność zostaje użyta w tym scenariuszu.
3. Skutek użycia zostaje **zmierzony**: działa albo nie działa, z liczbą albo z poleceniem odtwarzającym.
4. Dopiero wtedy powstaje wiersz w procedurze właściwego etapu.

Pominięcie kroku 3 jest najczęstszym błędem: zdolność wchodzi do procedury na podstawie tego, że wygląda użytecznie. Zapis, który tego zakazuje, jest kontekstem, nie blokadą — nic technicznie nie wymusza pomiaru przed zmianą procedury.

## Katalog

| Nazwa mechanizmu | Zastosowanie | Uwagi |
| --- | --- | --- |
| **Zadanie cykliczne** (*czujka*) | raport o stałej porze, pilnowanie warunku bez udziału koordynatora | zdolność zapisana w katalogu, nieopisana w żadnej procedurze |
| **Oczekiwanie na stan zewnętrzny** (*nasłuch*) | czekanie na wynik walidacji albo na zmianę dokumentu poza scenariuszem, bez odpytywania w pętli | alternatywą jest odpytywanie, które zużywa tok główny bez rezultatu |
| **Powiadomienie wypychane** (*rakieta sygnałowa*) | sygnał do koordynatora przy domknięciu scenariusza albo przy rozstrzygnięciu wymaganym od niego | |
| **Deterministyczne rozdzielenie zadań** (*tyraliera*) | szeroki front zadań analitycznych zamiast kilku pojedynczych | **wyłącznie na jawne polecenie koordynatora**; koszt rośnie z liczbą zadań |
| **Wzorzec adwersaryjny** (*sąd polowy*) | weryfikacja twierdzenia przed wejściem do dokumentacji: kilku recenzentów niezależnie próbuje je obalić, większość obalająca je odrzuca | stosowany ręcznie; jest wariantem przeglądu poobserwacyjnego prowadzonego przez osobę z zewnątrz |
| **Izolowana kopia materiału** (*przyczółek*) | zmiana o dużym zasięgu: kopia nietknięta znika sama, przyjęta jest scalana | jedyna pozycja katalogu przywołana w [procedurze przejazdu](../03-procedures/przejazd.md), krok 3 |
| **Kontrola kontraktu zwrotu** (*wartownik*) | sprawdzenie, czy zwrot zadania analitycznego spełnia kontrakt, **przed** jego przyjęciem; oraz ponowne wstrzyknięcie stanu scenariusza po skróceniu kontekstu | jedyna pozycja katalogu o charakterze blokady technicznej, nie zapisu |
| **Zewnętrzna ocena warunku końcowego** (*obserwator*) | orzekanie o ukończeniu przez osobę albo mechanizm nieuczestniczący w pracy | zasada, która za tym stoi, jest merytoryczna: o ukończeniu nie orzeka ten, kto pracował. Widzi wyłącznie zapis rozmowy, nie plan operacji |
| **Raport jako prywatna strona** (*depesza*) | raport jednorazowy, na wyzwalacz | **nie mylić z widokiem stanu**: widok jest opisany w [szablonie BMS](../04-templates/wpis-bms.md) i żyje przez cały scenariusz |
| **Konektory do systemów zewnętrznych** (*agentura*) | odczyt materiału z systemów poza repozytorium | **poza zakresem tego projektu** — patrz [integracje](../02-architecture/integracje.md); wpisana wyłącznie dla kompletności katalogu |

## Ograniczenia

1. **Żadna pozycja katalogu nie obowiązuje.** Powołanie się na nią w procedurze bez przejścia czterech kroków zasady wejścia jest błędem procesu.
2. **Katalog nie jest planem.** Kolejność wierszy nie oznacza priorytetu ani kolejności wdrożenia.
3. **Ostatnia pozycja jest poza zakresem projektu.** Integracje z systemami zewnętrznymi, dane rzeczywiste i przechowywanie poświadczeń są wyłączone z zakresu — patrz [cel i zakres](../00-overview/cel-i-zakres.md).
4. **Katalog nie opisuje konfiguracji.** Nie zawiera nazw narzędzi, ścieżek, parametrów ani poświadczeń i nie ma ich przyjmować.
5. **Pozycje bez zmierzonego użycia są niesprawdzone.** Żadna pozycja tego katalogu nie ma dziś pomiaru wykonanego w ramach tego projektu; opisy zastosowań pochodzą z dokumentu źródłowego i są danymi do sprawdzenia, nie ustaleniami.

## Powiązane artefakty

- Procedury: [przejazd](../03-procedures/przejazd.md), [zwiad](../03-procedures/zwiad.md), [meldunek](../03-procedures/meldunek.md)
- Architektura: [integracje](../02-architecture/integracje.md)
- Governance: [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md)
- Pochodzenie: [rejestr pochodzenia](sources.md)

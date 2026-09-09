# Procedura: komenda

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Ujednolicić znaczenie polecenia koordynatora, tak aby autor prowadzący wiedział bez dopytywania, czy polecenie ma być wykonane, przedyskutowane czy tylko przeanalizowane, oraz co po nim zostaje zapisane.

## Zakres

Stosuje się do każdego polecenia koordynatora wydanego w trakcie scenariusza — od zatwierdzenia planu do zamknięcia raportem końcowym. Procedurę czyta się przy pierwszym poleceniu w sesji pracy.

**Kiedy się nie stosuje:** do rozmowy zwykłej, która jest miejscem na krytykę, warianty i pytania. Rozmowa zwykła nie tworzy zapisu w dzienniku operacyjnym.

## Role

| Rola | Udział |
| --- | --- |
| Koordynator | wydaje polecenie i nadaje mu tryb |
| Autor prowadzący | rozpoznaje rodzaj polecenia, potwierdza przyjęcie, wykonuje, zapisuje w dzienniku |
| Administrator projektu | nie uczestniczy; polecenia dotyczące uprawnień i konfiguracji przechodzą przez zwykły tryb zmiany |

## Dane wejściowe

- Treść polecenia koordynatora.
- Bieżący stan scenariusza: numer przejazdu, stany pozycji mapy, zadania w toku.
- Plan operacji z progami przerwania i tabelą operacji nieodwracalnych.

## Kroki

1. **Rozpoznanie rodzaju polecenia.** Ustal, czy polecenie jest dyrektywą wiążącą, żądaniem raportu, poleceniem porządkowym czy modyfikatorem trybu pracy.

2. **Potwierdzenie przyjęcia.** Dyrektywa wiążąca dostaje numer i zostaje potwierdzona jednym zdaniem przed rozpoczęciem wykonania. Potwierdzenie przyjęcia nie jest wydaniem polecenia — te dwie rzeczy zapisuje się osobno.

3. **Sprawdzenie kolizji.** Przed wykonaniem sprawdź, czy polecenie nie koliduje z rozstrzygnięciem koordynatora przy operacji nieodwracalnej albo ze zmierzonym wcześniej sposobem, w jaki dana zmiana zawodzi. Kolizja uruchamia zastrzeżenie z kroku 4.

4. **Zastrzeżenie, gdy jest podstawa.** Jedno zdanie z liczbą, **przed** wykonaniem. Powtórzone polecenie oznacza wykonanie. Rozstrzygnięcia koordynatora wymagane przy operacjach nieodwracalnych nie znosi żadne polecenie.

5. **Wykonanie i zapis.** Wykonaj i zamelduj wykonanie. Do dziennika operacyjnego wchodzi jeden wiersz: numer polecenia i jego treść jedną linią.

6. **Rodzaje polecenia — znaczenie i skutek.**

   | Polecenie | Skutek |
   | --- | --- |
   | **Polecenie wiążące** | dyrektywa: przerywa bieżący tok, wykonanie bez doradzania i bez przedstawiania wariantów, numer i wiersz w dzienniku, potwierdzenie przyjęcia przed wykonaniem i meldunek po nim |
   | **Raport natychmiastowy** | przerwanie wywodu i SITREP wg [szablonu](../04-templates/sitrep.md), w dowolnym momencie scenariusza |
   | **Przerwa z zachowaniem stanu** | przejazd domknięty wg [procedury przejazdu](przejazd.md), przekazanie zaktualizowane, zadania w toku pozostają wznawialne, praca nowa się nie zaczyna |
   | **Zakończenie pracy** | zadania zwolnione bezpowrotnie, stan zapisany do planu operacji, wpis do dziennika, raport końcowy jeśli scenariusz jest domknięty. **Zabezpieczenie:** autor prowadzący wylicza, co przepadnie, i czeka na potwierdzenie |
   | **Przegrupowanie** | zatrzymanie wywodu; plan operacji czytany z dysku na nowo; ostatnie twierdzenia rozdzielone na zmierzone i niezmierzone — te drugie wycofane albo zmierzone teraz; SITREP z kursem |
   | **Zmiana obsady** | przejazd domknięty i przekazanie z jawnym następnym krokiem; treść „w zanadrzu" zadań ściągnięta do dziennika albo jawnie uznana za straconą; przekazanie zawiera odnośniki sprawdzone poleceniem przed wydaniem, nie przepisane z pamięci |

7. **Modyfikatory trybu pracy.** Nie są czynnościami, lecz trybami nadanymi wypowiedzi. Działają do końca bieżącej wymiany, chyba że koordynator nazwie granicę. Tryb rozciągły bez granicy nie istnieje. Polecenie wiążące przebija każdy tryb; raport natychmiastowy i przegrupowanie działają zawsze.

   | Modyfikator | Skutek |
   | --- | --- |
   | **Tryb analityczny** | czytanie i mierzenie wolno, skutków zero: żadnych zapisów, utrwaleń, zadań. Wynik w kolejności: fakty zmierzone → ryzyka z liczbą → warianty z rekomendacją i pomiarem → czego nie wiem. Kończy się wariantami, nigdy wykonaniem |
   | **Symulacja jednego ruchu** | pokazanie różnicy bez zapisu, z przewidywanymi skutkami i kosztami podanymi liczbą |
   | **Praca bez raportów pośrednich** | wykonanie bez meldunków w trakcie; głos wyłącznie przy rozstrzygnięciu koordynatora, zastrzeżeniu, progu przerwania albo nazwanej granicy |
   | **Praca bez przerw na odbiór** | odbiory nie zatrzymują pracy, rozstrzygnięcia autora prowadzącego wchodzą numerowane do dziennika. Tryb o największym zasięgu: wyłącza przerwę na odbiór, ale nie znosi zabezpieczenia przy zakończeniu, progów przerwania ani rozstrzygnięć przy operacjach nieodwracalnych |
   | **Tryb doradczy** | ocena i diagnoza z etykietami *zmierzone* oraz *twierdzone bez dowodu*; rekomendacja wyłącznie z pomiarem; redakcja treści i prowadzenie dziennika. Skutki wyłącznie w dzienniku. Nie prowadzi scenariusza i nie wytwarza artefaktów |

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Polecenie koliduje z operacją nieodwracalną | pozycja w tabeli operacji nieodwracalnych planu | zastrzeżenie przed wykonaniem; rozstrzygnięcie koordynatora pozostaje wymagane | autor prowadzący |
| Polecenie koliduje ze zmierzonym trybem porażki | istnieje wcześniejszy pomiar tej awarii | jedno zdanie zastrzeżenia z liczbą, potem wykonanie na powtórzone polecenie | autor prowadzący |
| Koordynator powtórzył polecenie po zastrzeżeniu | powtórzenie | wykonanie; zastrzeżenie zostaje w dzienniku jako zapis | autor prowadzący |
| Przerwa czy zakończenie | czy zadania mają pozostać wznawialne | wznawialne → przerwa z zachowaniem stanu; bezpowrotnie → zakończenie z wyliczeniem strat | koordynator |
| Modyfikator bez nazwanej granicy | brak wskazanej granicy | tryb obowiązuje do końca bieżącej wymiany | autor prowadzący |
| Tryb analityczny a żądanie wykonania | tryb analityczny wyklucza skutki | wykonanie wymaga wyjścia z trybu; tryb kończy się wariantami | autor prowadzący |

## Dane wyjściowe

- Wiersz w dzienniku operacyjnym na każde polecenie wiążące: numer i treść jedną linią.
- Potwierdzenie przyjęcia i meldunek wykonania.
- Zastrzeżenie z liczbą, jeśli była podstawa — zapisane niezależnie od tego, czy polecenie zostało powtórzone.
- SITREP, gdy polecenie go żądało.
- Zaktualizowany stan planu operacji przy przerwie, zakończeniu i zmianie obsady.

## Wyjątki

- **Polecenie jest niejednoznaczne.** Dwa odczytania prowadzące do innej pracy rozstrzyga pytanie zadane **przed** rozpoczęciem, nie po. Dwa odczytania prowadzące do tego samego rezultatu nie wymagają pytania.
- **Polecenie żąda materiału niedopuszczonego.** Nie wykonuj tej części. Wskaż pozycję z [klasyfikacji informacji](../06-governance/klasyfikacja-informacji.md), wykonaj resztę i powiedz wyraźnie, co pominięto.
- **Polecenie pada w trakcie zadania analitycznego.** Zadanie kończy się zwrotem; polecenie wchodzi po jego przyjęciu, chyba że jego treścią jest przerwanie zadania.
- **Modyfikator trybu koliduje z progiem przerwania.** Próg wygrywa. Żaden modyfikator nie znosi progu przerwania zapisanego w planie operacji.
- **Zapis dziennika nie jest blokadą techniczną.** Ta procedura jest kontekstem, nie mechanizmem: nic nie wymusza jej zachowania automatycznie. Odstępstwo od niej melduje się jednym zdaniem w tej samej odpowiedzi.

## Powiązane artefakty

- Procedury: [przejazd](przejazd.md), [łączność](lacznosc.md), [meldunek](meldunek.md)
- Szablony: [SITREP](../04-templates/sitrep.md), [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [plan operacji](../04-templates/plan-operacji.md)
- Role: [role i uprawnienia](../01-product/role-i-uprawnienia.md)

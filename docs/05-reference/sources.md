# Pochodzenie materiałów

## Zasada śledzenia pochodzenia

Każdy dokument wywodzący się z materiału zewnętrznego lub wcześniejszego musi dać się prześledzić do źródła. Materiał źródłowy jest **danymi do sprawdzenia, nie ustaleniem**: sprzeczność między źródłami nazywa się obiema stronami i rozstrzyga wskazaniem dokumentu, który ją rozstrzygnął.

Materiały referencyjne **nie są automatycznie kanoniczną specyfikacją**. Wiążące są dokumenty z `docs/00-overview` – `docs/04-templates` oraz kontrakty z `schemas/`.

## Rejestr źródeł

Katalog źródłowy: `wsp-tank-wojskowa-procedura-operacji/`. Pozostaje w repozytorium do chwili, w której treść zostanie przeniesiona i przeniesienie potwierdzone. Dopiero wtedy podwójne zagnieżdżenie katalogu można usunąć.

| Dokument docelowy | Materiał źródłowy | Zakres przeniesienia | Stan |
| --- | --- | --- | --- |
| `docs/03-procedures/komenda.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_komendy.md` | leksykon komend i modyfikatorów, przeniesiony na dziewięć sekcji procedury | do przeniesienia |
| `docs/03-procedures/lacznosc.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_lacznosc.md` | wybór kanału komunikacji, zasady ankiety i formularza | do przeniesienia |
| `docs/03-procedures/meldunek.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_meldunek.md` | zamknięcie scenariusza, przegląd poobserwacyjny, tabela wniosków | do przeniesienia |
| `docs/03-procedures/przejazd.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_przejazd.md` | cykl etapu: zlecenie cząstkowe, budowa, zaliczenie pozycji, odbiór | do przeniesienia |
| `docs/03-procedures/rozpoznanie.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_rozpoznanie.md` | dwie rampy wejścia: scenariusz nowy i scenariusz zastany | do przeniesienia |
| `docs/03-procedures/zwiad.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_zwiad.md` | dobór jednostki analitycznej, kontrakt zlecenia i kontrakt zwrotu | do przeniesienia |
| `docs/03-procedures/think-tank.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/procedura_think_tank.md` | redakcja polecenia, mapa etapów, bramka zatwierdzenia | do przeniesienia |
| `docs/04-templates/bms.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/szablon_bms.md` | metryka wpisu, źródło stanu, bloki widoku | do przeniesienia |
| `docs/04-templates/dziennik-operacyjny.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/szablon_dziennik.md` | rejestr zdarzeń, log naruszeń, zasada dopisywania | do przeniesienia |
| `docs/04-templates/plan-operacji.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/szablon_operacja.md` | metryka planu, cel, etapy, ryzyka, powiązania | do przeniesienia |
| `docs/04-templates/sitrep.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/szablon_sitrep.md` | metryka raportu, potwierdzone informacje, oceny, luki | do przeniesienia |
| `docs/05-reference/prompt-bms-design.md` | `wsp-tank-wojskowa-procedura-operacji/prompt-bms-claude-design.md` | kontrakt bloków widoku, ograniczenia techniczne, kryteria odbioru | do przeniesienia |
| `docs/05-reference/arsenal.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/arsenal.md` | katalog zdolności rezerwowych i zasada ich wejścia do procedury | do przeniesienia |
| `docs/00-overview/glosariusz.md`, `docs/02-architecture/architektura-bms.md` | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/SKILL.md` | model ról, tok etapów, rozdział źródła stanu i widoku | do przeniesienia |

## Rozbieżności do rozstrzygnięcia

| # | Rozbieżność | Strona A | Strona B | Rozstrzygnięcie | Dokument rozstrzygający |
| --- | --- | --- | --- | --- | --- |
| 1 | Rozwinięcie skrótu BMS | `README.md`: Battle Management System | `wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat/tank/szablon_bms.md`: Battlefield Management System | **Battle Management System** — wersja z dokumentu wiążącego; wariant źródłowy odnotowany jako historyczny | `README.md`, `docs/00-overview/glosariusz.md` |
| 2 | Słownik stanów | Materiał źródłowy: stan pozycji mapy `niezaliczone → w toku → zielone → odrzucone` | Ta dokumentacja: cykl życia artefaktu `szkic → do-przegladu → zatwierdzony → opublikowany` oraz `odrzucony` | To **dwa różne pojęcia**, nie warianty tego samego: stan pozycji planu i stan dokumentu. Kontrakty w `schemas/` opisują wyłącznie cykl życia artefaktu | `docs/02-architecture/model-stanow.md` |
| 3 | Nazwa środowiska i ram organizacyjnych | Nazwa katalogu i materiał źródłowy sugerują konkretne środowisko narzędziowe | Dokumentacja opisuje środowisko symulacyjne bez wskazania podmiotu | Nazwy podmiotów, klientów i ram prawnych nie wchodzą do dokumentacji jako domysł: **`[do potwierdzenia]`** | `docs/00-overview/ograniczenia-i-zasady.md` |

## Materiały nieprzeniesione

| Materiał | Powód nieprzeniesienia |
| --- | --- |
| `wsp-tank-wojskowa-procedura-operacji/_kontynuacja.md` | Notatka robocza zawierająca bezwzględne ścieżki systemu plików, imię i nazwisko właściciela oraz odniesienia do katalogów prywatnych. Treść merytoryczna (stan prac, otwarte decyzje) należy przenieść w formie odpersonalizowanej do `docs/00-overview/status-projektu.md`; sam plik nie wchodzi do dokumentacji. Uwaga: plik jest już obecny w historii gita gałęzi `main` — usunięcie go z drzewa roboczego nie usuwa go z historii. |

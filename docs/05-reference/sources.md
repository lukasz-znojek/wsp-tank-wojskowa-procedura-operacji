# Pochodzenie materiałów

## Zasada śledzenia pochodzenia

Każdy dokument wywodzący się z materiału zewnętrznego lub wcześniejszego musi dać się prześledzić do źródła. Materiał źródłowy jest **danymi do sprawdzenia, nie ustaleniem**: sprzeczność między źródłami nazywa się obiema stronami i rozstrzyga wskazaniem dokumentu, który ją rozstrzygnął.

Materiały referencyjne **nie są automatycznie kanoniczną specyfikacją**. Wiążące są dokumenty z `docs/00-overview` – `docs/04-templates` oraz kontrakty z [`schemas/`](../../schemas/).

## Stan katalogu źródłowego

Materiały wejściowe leżały w zagnieżdżonym katalogu `wsp-tank-wojskowa-procedura-operacji/` — 15 plików. Treść merytoryczna każdego z nich została przeniesiona do dokumentów docelowych wskazanych w tabeli niżej, a katalog został **usunięty**, ponieważ podwójne zagnieżdżenie nazwy repozytorium nie było strukturą, lecz pozostałością po sposobie dostarczenia materiału.

Katalog pozostaje odtwarzalny z historii repozytorium: pliki źródłowe są obecne w commitach poprzedzających reorganizację.

## Rejestr źródeł

Ścieżki źródłowe podane względem usuniętego katalogu `wsp-tank-wojskowa-procedura-operacji/`.

| Dokument docelowy | Materiał źródłowy | Zakres przeniesienia | Stan |
| --- | --- | --- | --- |
| [`docs/03-procedures/komenda.md`](../03-procedures/komenda.md) | `tank-skill-destylat/tank/procedura_komendy.md` | rodzaje polecenia i ich skutki, tryb zastrzeżenia, pięć modyfikatorów trybu pracy, granica między przerwą a zakończeniem | przeniesione |
| [`docs/03-procedures/lacznosc.md`](../03-procedures/lacznosc.md) | `tank-skill-destylat/tank/procedura_lacznosc.md` | wybór kanału, zasady ankiety i formularza, kryterium zdolności narzędzia, tryb awaryjny | przeniesione |
| [`docs/03-procedures/meldunek.md`](../03-procedures/meldunek.md) | `tank-skill-destylat/tank/procedura_meldunek.md` | trzy pomiary kosztu, termin przechowywania danych, cztery pytania przeglądu poobserwacyjnego, tabela wniosków, sześciopunktowy układ raportu | przeniesione |
| [`docs/03-procedures/przejazd.md`](../03-procedures/przejazd.md) | `tank-skill-destylat/tank/procedura_przejazd.md` | siedem kroków cyklu, dwie zasady pomiaru, zasada odtworzenia awarii przed poprawką, zamknięcie jako jedna czynność, próg rund poprawek | przeniesione |
| [`docs/03-procedures/rozpoznanie.md`](../03-procedures/rozpoznanie.md) | `tank-skill-destylat/tank/procedura_rozpoznanie.md` | dwa warianty wejścia, czterostopniowa kolejność dla materiału zastanego, trzy kategorie nieustalonego, rekomendacja z falsyfikatorem | przeniesione |
| [`docs/03-procedures/zwiad.md`](../03-procedures/zwiad.md) | `tank-skill-destylat/tank/procedura_zwiad.md` | dobór i oznaczanie zadań, pięciopolowe zlecenie, kontrakt zwrotu z limitem 2 000 znaków, zasada zapisu produktu przed zwrotem, zakaz wnioskowania z braku trafień | przeniesione |
| [`docs/03-procedures/think-tank.md`](../03-procedures/think-tank.md) | `tank-skill-destylat/tank/procedura_think_tank.md` | cztery pola polecenia z kosztem pustego pola, próg trzech rund redakcji, mapa etapów, audyt braków, zależności zewnętrzne, bramka zatwierdzenia | przeniesione |
| [`docs/04-templates/wpis-bms.md`](../04-templates/wpis-bms.md) | `tank-skill-destylat/tank/szablon_bms.md` | metryka wpisu, rozdział źródła i widoku, kierunki przepływu, wyłączenia treści | przeniesione |
| [`docs/04-templates/dziennik-operacyjny.md`](../04-templates/dziennik-operacyjny.md) | `tank-skill-destylat/tank/szablon_dziennik.md` | rejestr zdarzeń, rejestr naruszeń, zasada dopisywania, reguła trzeciego naruszenia przez różnych wykonawców | przeniesione |
| [`docs/04-templates/plan-operacji.md`](../04-templates/plan-operacji.md) | `tank-skill-destylat/tank/szablon_operacja.md` | metryka, cel z dowodem i zamiarem, progi przerwania, mapa etapów, tabele operacji nieodwracalnych i zależności, układ raportu końcowego | przeniesione |
| [`docs/04-templates/sitrep.md`](../04-templates/sitrep.md) | `tank-skill-destylat/tank/szablon_sitrep.md` | metryka, położenie i kurs, informacje potwierdzone wobec hipotez, zasoby, zasada przyrostu | przeniesione |
| [`docs/05-reference/prompt-bms-design.md`](prompt-bms-design.md) | `prompt-bms-claude-design.md` | kontrakt dziewięciu bloków widoku z nazwami kolumn, ograniczenia techniczne, kryteria odbioru, wyłączenia | przeniesione bez danych przykładowych — patrz „Materiały nieprzeniesione" |
| [`docs/05-reference/arsenal.md`](arsenal.md) | `tank-skill-destylat/tank/arsenal.md` | czterostopniowa zasada wejścia zdolności do procedury, katalog dziesięciu mechanizmów | przeniesione; nazwy metaforyczne zachowane w nawiasach jako ślad pochodzenia |
| [`docs/00-overview/glosariusz.md`](../00-overview/glosariusz.md) | `tank-skill-destylat/tank/SKILL.md` | model ról przełożony na cztery role projektowe, terminy etapów, definicja źródła prawdy | przeniesione |
| [`docs/02-architecture/architektura-bms.md`](../02-architecture/architektura-bms.md) | `tank-skill-destylat/tank/SKILL.md` | tok etapów, rozdział źródła stanu i widoku, granica odpowiedzialności między prowadzeniem scenariusza a prowadzeniem etapu | przeniesione |
| [`docs/00-overview/status-projektu.md`](../00-overview/status-projektu.md) | `_kontynuacja.md` | osie oceny materiału (samodzielność, wykonywalność, pomiary), brak kontroli wersji jako ryzyko, metoda zmiany po obserwowanym niepowodzeniu, kolizja konwencji nazw dokumentów stanu | przeniesione **w formie odpersonalizowanej** — patrz „Materiały nieprzeniesione" |

## Rozbieżności do rozstrzygnięcia

| # | Rozbieżność | Strona A | Strona B | Rozstrzygnięcie | Dokument rozstrzygający |
| --- | --- | --- | --- | --- | --- |
| 1 | Rozwinięcie skrótu BMS | `README.md`: Battle Management System | `szablon_bms.md`: Battlefield Management System | **Battle Management System** — wersja z dokumentu wiążącego; wariant źródłowy odnotowany jako historyczny i nieużywany w nowych dokumentach | [`README.md`](../../README.md), [glosariusz](../00-overview/glosariusz.md) |
| 2 | Słownik stanów | Materiał źródłowy: stan pozycji mapy `niezaliczone → w toku → zielone → odrzucone` | Ta dokumentacja: cykl życia artefaktu `szkic → do-przegladu → zatwierdzony → opublikowany` oraz `odrzucony` | To **dwa różne pojęcia**, nie warianty tego samego. Oba pozostają; kontrakty w `schemas/` opisują wyłącznie cykl życia artefaktu. Trzecią, odrębną rzeczą jest postęp jako liczba wyliczona ze stanów pozycji | [model stanów](../02-architecture/model-stanow.md) |
| 3 | Nazwa środowiska i ram organizacyjnych | Nazwa katalogu i materiał źródłowy sugerują konkretne środowisko narzędziowe | Dokumentacja opisuje środowisko symulacyjne bez wskazania podmiotu | Nazwy podmiotów, klientów i ram prawnych nie wchodzą do dokumentacji jako domysł: **`[do potwierdzenia]`** | [ograniczenia i zasady](../00-overview/ograniczenia-i-zasady.md), [glosariusz](../00-overview/glosariusz.md) |
| 4 | Status stanu pozycji wobec kontraktów danych | Materiał źródłowy traktuje stan pozycji jako pierwszorzędny słownik interfejsu | Kontrakty danych nie mają pola na stan pozycji jako artefakt samodzielny | Stan pozycji jest **polem wewnątrz planu operacji**, nie osobnym artefaktem, i nie ma własnego kontraktu | [model stanów](../02-architecture/model-stanow.md), [`schemas/operation.schema.json`](../../schemas/operation.schema.json) |

## Materiały nieprzeniesione

| Materiał | Powód nieprzeniesienia |
| --- | --- |
| `_kontynuacja.md` — plik jako całość | Notatka robocza zawierająca bezwzględne ścieżki systemu plików, imię i nazwisko właściciela oraz odniesienia do katalogów prywatnych i archiwalnych. Treść merytoryczna została przeniesiona odpersonalizowana do [statusu projektu](../00-overview/status-projektu.md); sam plik nie wchodzi do dokumentacji. **Uwaga:** plik jest obecny w historii gita gałęzi domyślnej, więc jego usunięcie z drzewa roboczego nie usuwa go z historii — to wymaga odrębnego rozstrzygnięcia właściciela repozytorium. |
| `prompt-bms-claude-design.md` — sekcja danych przykładowych | Zestaw przykładowy zawierał liczby i nazwy powiązane z konkretnym środowiskiem pracy oraz wielkości zużycia zasobów. Rolę przykładu pełnią syntetyczne artefakty w [`examples/`](../../examples/), spójne identyfikatorami i rolami. |
| `tank-skill-destylat/tank/SKILL.md` — nagłówek konfiguracyjny i warunki wywołania | Elementy konfiguracji narzędzia, nie treść dokumentacji. Nie opisują ani przebiegu działania, ani formatu artefaktu, a ich przeniesienie wprowadziłoby do dokumentacji nazwy i parametry środowiska narzędziowego. |
| Wszystkie pliki źródłowe — nagłówki metadanych | Nagłówki `typ`, `rola`, `wersja`, `data` z materiału źródłowego. Wersjonowanie tej dokumentacji opisuje [polityka wersjonowania](../06-governance/polityka-wersjonowania.md); przeniesienie dwóch równoległych systemów metadanych dałoby dwa źródła prawdy o wersji. |
| Katalogi wskazane w materiale źródłowym jako wyłączone | Wcześniejsze wersje i archiwa, wymienione w `_kontynuacja.md` jako niedostępne z założenia. Nie były częścią materiału wejściowego i nie zostały odczytane. |

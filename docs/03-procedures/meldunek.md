# Procedura: meldunek

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Zamknąć fikcyjny scenariusz raportem, który konfrontuje plan z tym, co się faktycznie wydarzyło, i zostawia wnioski nadające się do zmiany procedury. Każdy scenariusz kończy się co najmniej jedną wielkością zmierzoną, nie oceną.

## Zakres

Stosuje się raz, po ostatnim przejeździe i przed rozwiązaniem zespołu scenariusza. Obejmuje przegląd poobserwacyjny, pomiar kosztu oraz raport końcowy.

**Kiedy się nie stosuje:** w trakcie scenariusza — tam stosuje się [SITREP](../04-templates/sitrep.md), który raportuje przyrostowo. Sumy całego scenariusza niesie wyłącznie raport końcowy.

## Role

| Rola | Udział |
| --- | --- |
| Autor prowadzący | prowadzi przegląd poobserwacyjny, wykonuje pomiary, redaguje raport |
| Koordynator | odbiera raport, rozstrzyga o losie gałęzi roboczej |
| Recenzent, analityk | odpowiadają na jedno pytanie przeglądu, jeśli ich zadania są jeszcze dostępne |
| Administrator projektu | potwierdza dostępność danych do pomiaru przed upływem terminu ich przechowywania |

## Dane wejściowe

- Plan operacji z mapą etapów, celem, dowodem, progami przerwania i zleceniami cząstkowymi.
- Dziennik operacyjny wraz z rejestrem naruszeń.
- Dowody zaliczenia pozycji mapy.
- Dane o zużyciu zasobów, dostępne wyłącznie w okresie ich przechowywania.

## Kroki

1. **Pomiar kosztu.** Trzy wielkości, każda z podanym sposobem odtworzenia. Wielkość bez sposobu odtworzenia nie wchodzi do raportu.

   | Pomiar | Skąd |
   | --- | --- |
   | szczyt zużycia w toku głównym | zapis sesji pracy, z kontrolą krzyżową wobec licznika bieżącego; format zapisu jest wewnętrzny i zmienia się między wersjami, więc rozjazd między dwoma odczytami należy zameldować, nie uśrednić |
   | liczba przejazdów | licznik z nagłówka planu operacji |
   | zadania analityczne i ich koszt | liczba oznaczeń w dzienniku operacyjnym; sumy z zapisów tych zadań |

   **Termin jest wiążący:** zapisy sesji pracy podlegają okresowi przechowywania. Po jego upływie pomiar z tego źródła jest niemożliwy — raport musi zdążyć.

2. **Przegląd poobserwacyjny.** Cztery pytania w tej kolejności, każda odpowiedź z dowodem wskazującym dokument i wiersz. Plan konfrontuje się z faktem, nie streszcza.

   1. **Co miało się wydarzyć** — cel, zamiar, progi przerwania, mapa etapów, zlecenia cząstkowe.
   2. **Co się wydarzyło** — dziennik, rejestr naruszeń, dowody pozycji. Rozjazd między dwoma zapisami — dziennik wobec planu, wpis wobec wpisu, status wobec treści — jest faktem do wypisania, nie do wygładzenia.
   3. **Co poszło dobrze, co źle i dlaczego** — o stanowisku i regule, nie o osobie.
   4. **Jak wykonać do standardu następnym razem.**

3. **Pytanie do wykonawców.** Każdemu zadaniu, do którego da się jeszcze wrócić, zadaj jedno pytanie: czego zabrakło w zleceniu i co przeszkadzało. Gdy zadania są już niedostępne, zapisz to jako stratę, nie pomiń.

4. **Tabela wniosków.** Wyjściem przeglądu jest tabela: wniosek · dowód wskazujący dokument i wiersz · zmiana procedury albo dokumentu · sprawdzian, który wykazałby ten tryb porażki na świeżym wykonawcy. Wniosek bez sprawdzianu wchodzi ze statusem niesprawdzone.

5. **Redakcja raportu.** Sześć punktów w kolejności, układ wg [szablonu planu operacji](../04-templates/plan-operacji.md):

   1. koszt zespołu — wielkości z kroku 1;
   2. cel ze stanem pozycji pierwszej i dowodem;
   3. rezultaty osiągnięte, każdy z wielkością — **przed** stratami;
   4. straty, każda z wnioskiem;
   5. pozycje odrzucone po drodze, każda z powodem;
   6. wnioski — tabela z kroku 4.

6. **Ostatnie odświeżenie widoku stanu.** Status scenariusza `opublikowany`, komplet wielkości, dziennik domknięty. Adres pozostaje niezmieniony — jest archiwum scenariusza czytelnym bez sięgania do repozytorium.

7. **Domknięcie gałęzi roboczej.** Autor prowadzący przedstawia stan i rekomendację. Scalenie, pull request albo porzucenie jest rozstrzygnięciem koordynatora; autor prowadzący nie scala sam.

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Dwa odczyty tej samej wielkości się rozjeżdżają | różnica między odczytem bezpośrednim a kontrolą krzyżową | zamelduj rozjazd z obiema liczbami; nie uśredniaj | autor prowadzący |
| Wielkość nie ma sposobu odtworzenia | brak polecenia albo źródła obok liczby | wielkość nie wchodzi do raportu | autor prowadzący |
| Okres przechowywania danych upłynął | data zapisu wobec terminu | pomiar oznaczony jako niemożliwy, z podaniem powodu | autor prowadzący |
| Tryb porażki wystąpił pierwszy raz | licznik wystąpień | pierwsze → obserwacja; drugie → kandydat do zmiany procedury, ze sprawdzianem | autor prowadzący |
| Wniosek bez sprawdzianu | brak sprawdzianu w tabeli wniosków | wniosek wchodzi ze statusem niesprawdzone, nie jako ustalenie | autor prowadzący |
| Los gałęzi roboczej | rozstrzygnięcie koordynatora | scalenie, pull request albo porzucenie; autor prowadzący przedstawia rekomendację | koordynator |
| Cel nieosiągnięty | stan pozycji pierwszej mapy | raport powstaje tak samo; wycofanie jest rozstrzygnięciem, nie stratą | koordynator |

## Dane wyjściowe

- Raport końcowy w sześciu punktach, wpisany do planu operacji.
- Tabela wniosków z dowodami i sprawdzianami.
- Zamknięty dziennik operacyjny z ostatnim wpisem o zakończeniu scenariusza.
- Widok stanu w stanie `opublikowany`, z kompletem wielkości.
- Rekomendacja co do gałęzi roboczej, skierowana do koordynatora.

## Wyjątki

- **Scenariusz zamknięty bez osiągnięcia celu.** Raport powstaje w pełnym układzie. Powód niedomknięcia wchodzi do punktu o stratach, z wnioskiem.
- **Zadania analityczne są już niedostępne.** Pytanie z kroku 3 zapisuje się jako stratę wraz z informacją, czego nie udało się ustalić.
- **Przegląd prowadzi ta sama osoba, która prowadziła scenariusz.** To wariant domyślny, ale obciążony: przegląd prowadzony przez osobę nieuczestniczącą wykrywa wnioski, których uczestnik z tych samych dokumentów nie wyciąga. Gdy to możliwe, przydziel przegląd komuś z zewnątrz scenariusza.
- **Dziennik i plan operacji są sprzeczne.** Sprzeczność jest wynikiem przeglądu: wypisz obie strony w punkcie drugim i wskaż, który zapis rozstrzyga.
- **Pomiar zawierałby dane niedopuszczone.** Podaj wielkość, pomiń jej kontekst i zaznacz, co pominięto — patrz [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md).

## Powiązane artefakty

- Szablony: [plan operacji](../04-templates/plan-operacji.md), [SITREP](../04-templates/sitrep.md), [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [BMS](../04-templates/bms.md)
- Procedury: [przejazd](przejazd.md), [zwiad](zwiad.md), [komenda](komenda.md)
- Governance: [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md)
- Referencje: [katalog zdolności rezerwowych](../05-reference/arsenal.md)

# Polityka zmian procedur

## Tryb zmiany

1. **Ustal rodzaj zmiany.** Czy dotyczy przebiegu pracy, formatu zapisu, danych przykładowych czy kontraktu danych. Rodzaj rozstrzyga, które pliki muszą się zmienić razem — patrz [ADR-004](../02-architecture/decyzje/adr-004-rozdzielenie-artefaktow.md).
2. **Sprawdź, czy istnieje ADR obejmujący tę decyzję.** Zmiana architektury, zakresu albo kontraktu danych wymaga ADR: istniejącego, do którego się odnosisz, albo nowego.
3. **Wykaż tryb porażki przed zmianą reguły.** Reguła nie zmienia się dlatego, że wygląda na możliwą do poprawienia: zmienia się po zaobserwowaniu, że zawiodła. Zapisz, co konkretnie zawiodło i czym to zmierzono.
4. **Wprowadź zmianę w minimalnym zakresie.** Zmiana obejmuje to, czego wymaga zaobserwowana porażka, i nic więcej.
5. **Wypełnij ocenę wpływu** — tabela niżej, wszystkie cztery obszary.
6. **Uruchom walidatory** i podaj wyniki wraz z kodami wyjścia.
7. **Sprawdź odnośniki** względne w zmienionych plikach.
8. **Przekaż do przeglądu** wg [macierzy uprawnień](../01-product/role-i-uprawnienia.md).

## Obowiązkowa ocena wpływu

Zmiana procedury wymaga jawnej oceny wpływu na cztery obszary. **Wiersz pozostawiony pusty oznacza ocenę niewykonaną, nie brak wpływu.**

Jak wypełnić: w kolumnie „Czy oceniono" wpisz `tak` albo `nie`. W kolumnie „Wynik oceny" napisz, czy wpływ istnieje i jaki — samo „brak wpływu" wymaga zdania uzasadnienia. W kolumnie „Działanie" wpisz, co z tego wynika: nazwę zmienionego pliku albo słowo `brak`.

| Obszar wpływu | Czy oceniono | Wynik oceny | Działanie |
| --- | --- | --- | --- |
| Szablony |  |  |  |
| Przykłady |  |  |  |
| Schematy |  |  |  |
| ADR-y |  |  |  |

Zakres każdego obszaru:

| Obszar | Co sprawdzić |
| --- | --- |
| Szablony | czy zmiana procedury zmienia format artefaktu, który procedura wytwarza; czy procedura nadal wskazuje właściwy szablon albo jawne „nie dotyczy" |
| Przykłady | czy przykład odzwierciedla aktualny format i nadal jest spójny z pozostałymi przykładami identyfikatorami oraz rolami |
| Schematy | czy zmiana dotyka pól opisanych kontraktem; jeśli tak — ocena zgodności wstecz wg [polityki wersjonowania](polityka-wersjonowania.md) |
| ADR-y | czy zmiana nie stoi w sprzeczności z zatwierdzoną decyzją; czy wymaga nowego ADR |

## Zatwierdzanie i publikacja

Zmiana przechodzi przez cykl życia artefaktu z [modelu stanów](../02-architecture/model-stanow.md): `szkic` → `do-przegladu` → `zatwierdzony` → `opublikowany`.

| Etap | Kto | Warunek przejścia |
| --- | --- | --- |
| Przekazanie do przeglądu | autor | wypełnione pola obowiązkowe, wypełniona ocena wpływu, walidatory kod 0 |
| Przegląd | recenzent | zmiana spełnia [kryteria akceptacji](../01-product/kryteria-akceptacji.md); przy zwrocie wskazane sprawdzalne poprawki |
| Zatwierdzenie | koordynator | przegląd zamknięty bez zastrzeżeń |
| Publikacja | koordynator | walidacja przechodzi, powiązane artefakty spójne |

Autor nie zatwierdza i nie publikuje własnej zmiany. Administrator projektu wspiera publikację technicznie i **nie podejmuje rozstrzygnięć merytorycznych za koordynatora**.

## Zmiana awaryjna

Zmiana awaryjna to zmiana usuwająca materiał niedopuszczony albo naprawiająca dokument, który wprowadza w błąd co do zakresu symulacyjnego. Tylko te dwa przypadki.

| Krok | Postępowanie |
| --- | --- |
| 1 | Ogranicz zakres do usunięcia naruszenia; nie łącz z żadną inną zmianą |
| 2 | Postępuj wg [klasyfikacji informacji](klasyfikacja-informacji.md), gdy chodzi o materiał niedopuszczony |
| 3 | Uruchom walidatory; kod 0 obowiązuje także przy zmianie awaryjnej |
| 4 | Przegląd może nastąpić po wprowadzeniu, ale **musi nastąpić** |
| 5 | Wypełnij ocenę wpływu po fakcie, w tej samej zmianie albo bezpośrednio po niej |

Zmiana awaryjna nie znosi wymogu przeglądu — przesuwa go w czasie. Zmiana awaryjna, która nie została przejrzana, jest zmianą niedomkniętą.

## Granica egzekwowania

**Zapis w pliku jest kontekstem, nie blokadą.** Nic technicznie nie wymusza wypełnienia oceny wpływu, wykazania trybu porażki przed zmianą reguły ani przejścia przez przegląd. Jedyną blokadą techniczną są walidatory i automatyczna walidacja: [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py), [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh), [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml).

Reguła tej polityki, która ma naprawdę obowiązywać, musi trafić do walidatora, do kontraktu danych albo do reguł ochrony gałęzi. Do tego czasu jej przestrzeganie zależy od wykonawcy i recenzenta.

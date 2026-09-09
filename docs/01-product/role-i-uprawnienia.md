# Role i uprawnienia

Projekt ma dokładnie cztery role. Wcielenia występujące w procedurach — autor prowadzący, autor prowadzący etap, analityk — są wykonaniami roli autora i są opisane w [glosariuszu](../00-overview/glosariusz.md).

## Autor

**Odpowiada za:** utworzenie artefaktu wg szablonu, wypełnienie pól obowiązkowych, wskazanie źródła przy każdym twierdzeniu podanym jako potwierdzone, dopisanie wiersza historii zmian przy każdej zmianie stanu, którą wykonuje.

**Czego nie robi:** nie zatwierdza i nie publikuje własnego artefaktu, nie ocenia go w przeglądzie, nie zmienia kryteriów akceptacji, nie rozstrzyga o zakresie scenariusza.

## Recenzent

**Odpowiada za:** ocenę artefaktu wobec [kryteriów akceptacji](kryteria-akceptacji.md) przy pomocy wskazanej miary, wskazanie sprawdzalnych poprawek przy zwrocie do szkicu, odrzucenie z uzasadnieniem wskazującym niespełnione kryterium, wypełnienie oceny wpływu przy przeglądzie zgodności.

**Czego nie robi:** nie zatwierdza artefaktu — to rozstrzygnięcie koordynatora, nie publikuje, nie poprawia artefaktu za autora, nie ocenia bez miary; przy regule niemierzalnej wpisuje `niemierzalne` i zwraca.

## Koordynator

**Odpowiada za:** polecenie utworzenia scenariusza, ustalenie progów przerwania przy zatwierdzaniu planu, zatwierdzenie artefaktu po przeglądzie, publikację, rozstrzygnięcia przy operacjach nieodwracalnych, odrzucenie z uzasadnieniem na każdym etapie przed publikacją.

**Czego nie robi:** nie wykonuje przeglądu w miejsce recenzenta jako jedynej kontroli treści, nie zmienia treści artefaktu bez wiedzy autora, nie obchodzi walidacji przy publikacji.

## Administrator projektu

**Odpowiada za:** techniczną konfigurację repozytorium, walidatorów i automatycznej walidacji, dostępność mechanizmu walidacji od pierwszego etapu scenariusza, uprawnienia w repozytorium, przyjęcie zgłoszenia o materiale niedopuszczonym.

**Czego nie robi:** **nie podejmuje rozstrzygnięć merytorycznych za koordynatora.** Nie zatwierdza, nie publikuje treści, nie ocenia artefaktów w przeglądzie i nie rozstrzyga o zakresie scenariusza.

## Macierz uprawnień

Czynności odnoszą się do cyklu życia artefaktu z [modelu stanów](../02-architecture/model-stanow.md).

| Czynność | Autor | Recenzent | Koordynator | Administrator projektu |
| --- | --- | --- | --- | --- |
| Utworzenie szkicu | tak | nie | tak | nie |
| Edycja szkicu | tak | nie | tak | nie |
| Przekazanie do przeglądu | tak | nie | tak | nie |
| Przegląd | nie | tak | tak | nie |
| Zatwierdzenie | nie | nie | tak | nie |
| Publikacja | nie | nie | tak | technicznie wspiera |
| Odrzucenie przed publikacją | nie | tak, z uzasadnieniem | tak | nie |

## Zasada nadrzędna

**O przejściu artefaktu do stanu końcowego nie orzeka ten, kto go wytworzył.** Autor nie zatwierdza i nie publikuje własnego artefaktu.

Jedyny wyjątek dotyczy przejścia `szkic` → `odrzucony`: autor może wycofać własny szkic, ponieważ nie przeszedł on jeszcze żadnego przeglądu.

## Granica egzekwowania

Macierz jest **zapisem, nie blokadą techniczną**. Kontrakty danych sprawdzają wartość pola statusu, ale nie sprawdzają, kto ją zmienił ani czy przejście było dozwolone. Egzekwowanie macierzy wymagałoby rozszerzenia walidatora albo reguł ochrony gałęzi — patrz [status projektu](../00-overview/status-projektu.md), ryzyko związane z rozjazdem dokumentacji i mechanizmu.

## Powiązane dokumenty

- [model stanów](../02-architecture/model-stanow.md) — przejścia i ich warunki
- [kryteria akceptacji](kryteria-akceptacji.md) — wobec czego recenzent ocenia
- [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md) — tryb zmiany i ocena wpływu
- [procedury](../03-procedures/README.md) — wcielenia roli autora w przebiegu pracy

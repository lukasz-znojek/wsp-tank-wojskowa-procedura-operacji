# ADR-005: Stan pozycji mapy etapów w kontrakcie planu operacji

## Status

Zaakceptowana.

## Kontekst

[Model stanów](../model-stanow.md) rozróżnia dwa słowniki: cykl życia artefaktu (`szkic`, `do-przegladu`, `zatwierdzony`, `opublikowany`, `odrzucony`) i stan pozycji mapy etapów (`niezaliczone`, `w toku`, `zielone`, `odrzucone`). Do tej decyzji kontrakt [`operation.schema.json`](../../../schemas/operation.schema.json) wymagał jednak w polu `stages[].status` słownika cyklu życia artefaktu, a dokumentacja twierdziła, że stan pozycji jest „nieobjęty kontraktami danych”.

Skutek był mierzalny: przykład [`operation-example-alpha.md`](../../../examples/operation-example-alpha.md) zapisywał etapy ze stanem `zielone`, a jego maszynowy odpowiednik nie mógł tej wartości użyć, bo kontrakt by ją odrzucił. Szablon, przykład i kontrakt opisywały to samo pole trzema różnymi słownikami. To jest rozjazd, który [ADR-003](adr-003-json-schema.md) nazywa defektem.

Rozważane były dwa warianty. Pierwszy: zmienić przykład i szablon tak, by etapy używały cyklu życia artefaktu. Odrzucony, bo etap planu nie jest artefaktem: nie przechodzi przeglądu ani publikacji, a jego stan mówi o zaliczeniu rezultatu, nie o dojrzałości dokumentu. Drugi: wpisać do kontraktu słownik stanu pozycji. Przyjęty.

## Decyzja

**Pole `stages[].status` w kontrakcie planu operacji przyjmuje wyłącznie stan pozycji mapy:** `niezaliczone`, `w-toku`, `zielone`, `odrzucone`. Wartość `w-toku` jest zapisem maszynowym stanu „w toku”, na tej samej zasadzie, na jakiej `do-przegladu` jest zapisem stanu „do przeglądu”.

Pole `status` planu jako całości nadal używa cyklu życia artefaktu. Oba słowniki występują w jednym kontrakcie i nie mieszają się: jeden opisuje dokument, drugi wiersz jego mapy.

Ocena zgodności wstecz wg [polityki wersjonowania](../../06-governance/polityka-wersjonowania.md): **niezgodna wstecz**. Dane planu, które w `stages[].status` miały wartość z cyklu życia artefaktu, przestają być zgodne. W chwili decyzji jedynym takim zbiorem danych był przykład `operation-example-alpha.json`, zmieniony w tej samej zmianie.

## Konsekwencje

### Skutki pozytywne

- Szablon, przykład i kontrakt opisują stan etapu jednym słownikiem. Rozjazd, który dało się wykryć tylko przeglądem, przestaje istnieć.
- Rozróżnienie dwóch słowników z modelu stanów przechodzi z zapisu do mechanizmu: kontrakt odrzuci `zatwierdzony` w stanie etapu i `zielone` w statusie planu.
- Postęp planu, liczony jako pozycje `zielone` wobec wszystkich, ma od teraz maszynowo sprawdzalne dane wejściowe.

### Koszty

- Zmiana jest niezgodna wstecz dla każdego planu zapisanego wg poprzedniej wersji kontraktu. W repozytorium nie było takich danych poza przykładem.
- Kontrakt zna cztery wartości stanu pozycji, ale nie zna przejść między nimi. Legalność przejścia `niezaliczone` → `w toku` → `zielone` pozostaje zapisem w modelu stanów, tak samo jak przejścia cyklu życia artefaktu.
- Zapis maszynowy `w-toku` różni się od zapisu dokumentacyjnego „w toku”. Odwzorowanie jest jawne w modelu stanów i w szablonie planu, ale trzeba je znać.
- Dokumenty, które twierdziły, że stan pozycji jest poza kontraktami, wymagały korekty w tej samej zmianie: model stanów, glosariusz, rejestr pochodzenia, ADR-003.

# ADR-004: Rozdzielenie procedury, szablonu i przykładu

## Status

Zaakceptowana.

## Kontekst

Materiały wejściowe mieszały trzy rzeczy w jednym pliku: opis przebiegu pracy, format zapisu artefaktu oraz wypełnione dane. Plik zatytułowany jako szablon zawierał kroki postępowania; plik z procedurą zawierał układ tabel; dane przykładowe stały obok reguł formatu.

Skutki tego pomieszania są trzy i wszystkie były widoczne w materiale źródłowym. Pierwszy: zmiana formatu wymagała edycji plików opisujących przebieg, więc łatwo było zmienić jedno, a zapomnieć o drugim. Drugi: wypełnione dane w pliku szablonu były kopiowane jako wzór, razem z wartościami, które miały być przykładem, a stawały się domyślną treścią. Trzeci: nie dało się maszynowo sprawdzić kompletności czegokolwiek, bo nie było wiadomo, czego dany plik ma być kompletnym opisem.

## Decyzja

**Procedura, szablon i przykład są trzema odrębnymi artefaktami i nie mieszają się w jednym pliku.**

| Artefakt | Zawiera | Nie zawiera | Miejsce |
| --- | --- | --- | --- |
| **Procedura** | przebieg działania: kroki, punkty decyzyjne, wyjątki | formatu zapisu, wypełnionych danych | [`docs/03-procedures/`](../../03-procedures/README.md) |
| **Szablon** | format zapisu: pola, tabele, wartości dopuszczone, instrukcje wypełniania | przebiegu działania, wypełnionych danych | [`docs/04-templates/`](../../04-templates/README.md) |
| **Przykład** | jedno fikcyjne wypełnienie szablonu | przebiegu działania, reguł formatu | [`examples/`](../../../examples/) |

Reguły pomocnicze:

1. Każda procedura ma dokładnie dziewięć wymaganych sekcji i żadnych dodatkowych nagłówków tego poziomu. Kompletność sprawdza [`validate_markdown.sh`](../../../scripts/validate_markdown.sh).
2. Szablon pozostaje pusty. Wypełniony szablon przestaje być szablonem i staje się przykładem albo artefaktem scenariusza.
3. Przykład zaczyna się oznaczeniem danych syntetycznych i nie ustanawia reguł: pokazuje jedno użycie.
4. Każda procedura wskazuje powiązany szablon albo jawnie stwierdza „nie dotyczy" wraz z powodem.

## Konsekwencje

### Skutki pozytywne

- Kompletność procedury da się sprawdzić maszynowo, bo wiadomo, czego procedura ma być kompletnym opisem. To bezpośrednio umożliwiło [`validate_markdown.sh`](../../../scripts/validate_markdown.sh).
- Zmiana formatu dotyka szablonu, kontraktu i przykładu, ale nie procedury — i odwrotnie. Zakres zmiany jest przewidywalny, co pozwoliło zapisać ocenę wpływu jako tabelę czterech obszarów.
- Puste szablony nie propagują przypadkowych wartości domyślnych.
- Czytelnik wie, gdzie szukać: pytanie „jak to zrobić" prowadzi do procedury, „co wpisać" do szablonu, „jak to wygląda wypełnione" do przykładu.

### Koszty

- Jeden temat wymaga teraz trzech plików zamiast jednego. Liczba plików w repozytorium rośnie i rośnie liczba odnośników między nimi.
- Czytanie wymaga przechodzenia między katalogami: procedura, jej szablon i jej przykład leżą w trzech różnych miejscach. Rekompensują to tabele w plikach `README.md` każdego katalogu, ale koszt zostaje.
- Zmiana kompletna wymaga sprawdzenia trzech plików naraz. Zmiana niekompletna daje rozjazd, który jest wykrywalny dopiero w przeglądzie — kontrola jest zapisem, nie mechanizmem.
- Reguła 2 bywa uciążliwa: szablon z jednym wypełnionym wierszem byłby czytelniejszy, ale otwierałby drogę do wartości domyślnych, których nikt nie zamierzał ustanawiać.
- Trzy procedury nie mają własnego szablonu i muszą to jawnie stwierdzać, co wygląda jak brak, a jest rozstrzygnięciem.

# Polityka wersjonowania

## Wersjonowanie dokumentów

Dokumenty nie noszą numeru wersji w treści. Wersją dokumentu jest jego stan w kontroli wersji, a historią — historia commitów. Wynika to z [ADR-002](../02-architecture/decyzje/adr-002-markdown-zrodlo-prawdy.md): pliki w repozytorium są źródłem prawdy, więc drugi, ręcznie prowadzony licznik wersji dałby drugie źródło prawdy o wersji.

Wyjątkiem są **artefakty scenariusza**. Plan operacji ma pole wersji w formacie `MAJOR.MINOR.PATCH`, ponieważ jest artefaktem wewnątrz scenariusza, a nie dokumentem repozytorium.

| Rodzaj zmiany artefaktu | Składowa | Przykład |
| --- | --- | --- |
| zmiana celu, mapy etapów albo kryteriów ukończenia | `MAJOR` | usunięcie pozycji z mapy etapów |
| dodanie pozycji pobocznej, ryzyka albo zależności | `MINOR` | dopisanie zależności zewnętrznej |
| poprawka redakcyjna bez zmiany znaczenia | `PATCH` | poprawa literówki w opisie etapu |

## Wersjonowanie schematów

Kontrakty danych są wersjonowane przez historię commitów oraz przez ocenę zgodności wstecz przy każdej zmianie. Ocena jest obowiązkowa i ma jeden z trzech wyników.

| Zmiana | Zgodność wstecz | Uzasadnienie |
| --- | --- | --- |
| Dodanie pola **opcjonalnego** | **zgodna wstecz**, jeśli nie zmienia semantyki istniejących pól | dane spełniające poprzedni kontrakt spełniają nowy |
| Dodanie pola do `required` przy `additionalProperties: false` | **niezgodna wstecz** | dane bez tego pola przestają być zgodne |
| Zmiana typu, wzorca, `enum` albo znaczenia istniejącego pola | **wymaga oceny**; gdy łamie istniejące dane — **nowa wersja główna** | skutek zależy od tego, czy nowy zbiór wartości zawiera stary |
| Usunięcie pola z `properties` przy `additionalProperties: false` | **niezgodna wstecz** | dane zawierające to pole zostaną odrzucone |
| Zwężenie wzorca identyfikatora | **niezgodna wstecz** | istniejące identyfikatory mogą przestać pasować |
| Rozszerzenie `enum` o nową wartość | zgodna wstecz dla danych, **niezgodna dla odczytu**, który zakłada zamknięty zbiór | dane stare przechodzą, kod czytający może nie znać nowej wartości |

Dodanie pola opcjonalnego jest zgodne wstecz **tylko wtedy**, gdy nie zmienia znaczenia pól już istniejących. Pole opcjonalne, którego obecność zmienia interpretację innego pola, jest zmianą niezgodną, choć formalnie nie zmienia `required`.

## Zmiana niezgodna wstecz

Zmiana niezgodna wstecz wymaga wszystkich trzech kroków:

1. Jawnego nazwania niezgodności w opisie zmiany, wraz ze wskazaniem, które dane przestaną być zgodne.
2. Aktualizacji szablonu i wszystkich przykładów w tej samej zmianie — inaczej przykłady przestają przechodzić kontrolę.
3. Odniesienia do istniejącego ADR albo utworzenia nowego, gdy zmiana dotyczy zakresu albo kontraktu danych — patrz [ADR-003](../02-architecture/decyzje/adr-003-json-schema.md).

## Historia zmian

Historia zmian artefaktu scenariusza jest prowadzona w tabeli „Historia zmian” samego artefaktu i zawiera przy każdej zmianie stanu: poprzedni stan, nowy stan, rolę decyzyjną i uzasadnienie. Wynika to z wymagania `WF-6`. [Dziennik operacyjny](../04-templates/dziennik-operacyjny.md) rejestruje tę samą zmianę jednym wierszem z czasem, identyfikatorem artefaktu, zdarzeniem, nowym statusem i autorem - patrz [model stanów](../02-architecture/model-stanow.md).

Dziennik jest wyłącznie dopisywany. Wpis raz zapisany nie jest poprawiany — błąd prostuje wpis następny. Rozjazd między statusem artefaktu a ostatnim wpisem dziennika jest faktem do wypisania przy przeglądzie, nie rozbieżnością do wygładzenia.

## Tryb wycofania

| Sytuacja | Postępowanie |
| --- | --- |
| Zmiana dokumentu wprowadziła błąd | wycofanie przez odwrócenie commitu; historia obu operacji zostaje |
| Zmiana schematu okazała się niezgodna niezamierzenie | odwrócenie zmiany schematu **wraz z** szablonem i przykładami w jednej operacji |
| Artefakt scenariusza został opublikowany błędnie | stan `opublikowany` jest końcowy: powstaje **nowa wersja** artefaktu od stanu `szkic`, ze wskazaniem wersji wycofanej |
| Materiał niedopuszczony wszedł do repozytorium | tryb z [klasyfikacji informacji](klasyfikacja-informacji.md); usunięcie z historii wymaga rozstrzygnięcia właściciela |

Wycofania nie przeprowadza się przez nadpisanie historii, z wyjątkiem ostatniego wiersza tabeli. Zmiana opublikowanego artefaktu tworzy nową wersję, a nie modyfikuje wersji opublikowanej — patrz [model stanów](../02-architecture/model-stanow.md).

## Granica egzekwowania

Zgodność wstecz **nie jest sprawdzana maszynowo**. [`validate_schemas.py`](../../scripts/validate_schemas.py) kontroluje strukturę kontraktu i zgodność przykładów JSON z bieżącą wersją kontraktu, nie relację między jego wersjami. Ocena zgodności jest kryterium przeglądu wykonywanym przez człowieka — pozycja 7 w [kryteriach dla zmiany schematu](../01-product/kryteria-akceptacji.md).

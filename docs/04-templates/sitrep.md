# Szablon: SITREP

> Wyłącznie dane syntetyczne. Kontrakt danych: [`schemas/sitrep.schema.json`](../../schemas/sitrep.schema.json).

SITREP raportuje stan scenariusza **w trakcie**, przyrostowo od poprzedniego SITREP. Sumy całego scenariusza niesie wyłącznie raport końcowy w [planie operacji](plan-operacji.md). Przebieg, który SITREP wytwarza, opisuje [procedura przejazdu](../03-procedures/przejazd.md).

## Metryka raportu

| Pole | Wartość | Uwagi do wypełnienia |
| --- | --- | --- |
| ID | `[ ]` | wzorzec `^[A-Z0-9-]+$` |
| Status | szkic / do-przegladu / zatwierdzony / opublikowany / odrzucony | patrz [model stanów](../02-architecture/model-stanow.md) |
| Identyfikator scenariusza | `[ ]` | zgodny z planem operacji |
| Okres raportowania | [ ] | etykieta okresu, do 120 znaków; od poprzedniego SITREP |
| Autor | [ ] | oznaczenie syntetyczne roli, np. `Analityk-01` |
| Dane syntetyczne | tak | pole obowiązkowe |

**Położenie:** etap [ ] · przejazd [ ] · zlecenie cząstkowe [ ]: [jedno zdanie]

**Kurs:** [w granicach zamiaru / korekta: jaka i czemu mieści się w zamiarze / poza zamiarem → czeka rozstrzygnięcie koordynatora]

## Podsumowanie

[ ]

Trzy odpowiedzi w kilku zdaniach: co jest zaliczone, co czeka na koordynatora, co może się nie udać jako następne. Wszystko inne jest tłem.

## Potwierdzone informacje

| # | Twierdzenie | Źródło | Czym sprawdzone |
| --- | --- | --- | --- |
|  |  |  |  |

Do tej sekcji wchodzi wyłącznie to, co ma wskazane źródło i sposób sprawdzenia. Reszta idzie do sekcji niżej.

## Oceny i hipotezy

| # | Hipoteza | Poziom pewności | Co ją obali |
| --- | --- | --- | --- |
|  |  | potwierdzone / prawdopodobne / niepotwierdzone |  |

Hipoteza bez zdania mówiącego, co by ją obaliło, wchodzi ze statusem niesprawdzone.

## Luki i rozbieżności

**Nieustalone** (korzeń · wzorzec · wykluczenia): [ ]

**Rozbieżności** — obie strony nazwane, bez wygładzania:

| # | Rozbieżność | Strona A | Strona B | Co rozstrzyga |
| --- | --- | --- | --- | --- |
|  |  |  |  |  |

**Postęp:** mapa [ ] / [ ] · pozycja pierwsza: [stan] · zaliczone od poprzedniego SITREP: [ ]

**Zasoby** — wielkości z pomiaru albo puste; nigdy z pamięci. Puste ma wyglądać na puste, nie na zero:

| Pozycja | Wartość | Czym odtworzyć |
| --- | --- | --- |
| zużycie w toku głównym |  |  |
| zadania analityczne |  |  |
| progi przerwania | [poniżej / **przekroczony → przerwa w pracy**] | plan operacji |

## Działania następcze

**Czeka na koordynatora:** [rozstrzygnięcia blokujące, po jednym zdaniu — albo „nic"]

**Zależności:** [nieuruchomione, z czasem realizacji — albo „wszystkie uruchomione"]

**Zagrożenia:** [co może się nie udać jako następne, z wyzwalaczem]

**Następny krok:** [jedno zdanie]

## Źródła

| Rodzaj | Identyfikator albo odnośnik |
| --- | --- |
| plan operacji | [ ] |
| dziennik operacyjny | [ ] |
| widok stanu | [adres · odświeżony / zaległy o [ ] przejazdów] |

## Czego SITREP nie zawiera

- Prognoz terminu bez przelicznika wskazanego w źródle.
- Sum całego scenariusza — te należą do raportu końcowego.
- Ocen postawionych w miejscu pomiaru.
- Danych osobowych, rzeczywistych lokalizacji, harmonogramów i danych operacyjnych.

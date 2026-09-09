# Szablon: dziennik operacyjny

> Wyłącznie dane syntetyczne. Kontrakt danych dla wpisów komunikatów: [`schemas/message.schema.json`](../../schemas/message.schema.json).

Dziennik jest **dopisywany, nigdy nadpisywany**. Plan operacji niesie stan; dziennik niesie to, co się wydarzyło, w kolejności, w jakiej się wydarzyło. Wpis raz zapisany nie jest poprawiany — błąd prostuje wpis następny.

Jedyną rolą piszącą do dziennika jest autor prowadzący.

## Metryka dziennika

| Pole | Wartość | Uwagi do wypełnienia |
| --- | --- | --- |
| Identyfikator scenariusza | `[ ]` | wzorzec `^[A-Z0-9-]+$`, zgodny z planem operacji |
| Okres | [ ] | etykieta okresu scenariusza, nie daty rzeczywiste |
| Prowadzący | [ ] | oznaczenie syntetyczne roli, np. `Koordynator-01` |
| Dane syntetyczne | tak | pole obowiązkowe |

## Rejestr zdarzeń

Jedna linia na zdarzenie. Do rejestru wchodzą: zlecenia cząstkowe, polecenia koordynatora, rozstrzygnięcia autora prowadzącego, zlecenie i powrót zadania analitycznego wraz z oznaczeniem, zamknięcie przejazdu.

| Czas | ID artefaktu | Zdarzenie | Status | Autor | Uwagi |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

Kolejność wpisów odpowiada kolejności zdarzeń. W widoku stanu ten sam rejestr pokazuje się od najnowszego wpisu.

## Rejestr naruszeń

Każde naruszenie reguły dostaje wiersz. Zapisuj **wzorzec, nie miejsce**: wskazanie dokumentu i wiersza zostaje przy poprawce i traci znaczenie razem z nią.

| Kiedy | Pozycja | Reguła | Zmierzone | Wymagane | Runda |
| --- | --- | --- | --- | --- | --- |
|  |  |  |  |  |  |

Ta sama reguła złamana trzeci raz przez **różnych** wykonawców jest defektem reguły albo sposobu jej przekazywania, nie defektem wykonawcy. Wtedy przepisuje się regułę, zamiast poprawiać po raz trzeci.

## Zasady prowadzenia

1. Do dziennika wchodzi wyłącznie to, co ma przetrwać poza bieżącą sesję pracy. Szczegół pozostaje w zadaniu, do którego można wrócić po oznaczeniu.
2. Wpis jest jednolinijkowy. Rozwlekłość w rejestrze zdarzeń niszczy jego jedyną zaletę — możliwość przeczytania całości.
3. Wielkość zapisana w dzienniku ma obok sposób jej odtworzenia. Liczba bez tego sposobu nie wchodzi.
4. Zamknięcie przejazdu, zapis stanu do planu operacji, odświeżenie widoku i utrwalenie zmian są jedną czynnością, nie czterema.
5. Dziennik nie przyjmuje danych osobowych, rzeczywistych lokalizacji, harmonogramów ani danych operacyjnych — patrz [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md).

## Powiązane artefakty

- Procedury: [przejazd](../03-procedures/przejazd.md), [zwiad](../03-procedures/zwiad.md), [komenda](../03-procedures/komenda.md)
- Szablony: [plan operacji](plan-operacji.md), [BMS](wpis-bms.md)
- Kontrakt danych: [`schemas/message.schema.json`](../../schemas/message.schema.json)
- Przykład: [`examples/communication-log-example.md`](../../examples/communication-log-example.md)

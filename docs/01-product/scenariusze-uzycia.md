# Scenariusze użycia

Wszystkie scenariusze dotyczą pracy nad fikcyjnymi artefaktami dokumentowymi. Żaden nie opisuje działań poza dokumentacją.

## Scenariusz 1 — utworzenie fikcyjnego planu

**Aktor:** koordynator, z udziałem autora.

**Warunek wstępny:** istnieje polecenie utworzenia scenariusza szkoleniowego; oznaczenie scenariusza i identyfikator planu są ustalone i syntetyczne.

**Przebieg krokowy:**

1. Autor otwiera [szablon planu operacji](../04-templates/plan-operacji.md) i wypełnia metrykę: identyfikator, nazwę syntetyczną, właściciela, wersję, oznaczenie danych syntetycznych.
2. Autor wpisuje cel scenariusza wraz z dowodem, który go rozstrzyga, oraz zamiar.
3. Autor buduje mapę etapów: pozycje w kolejności zależności, każda z rezultatem i sposobem sprawdzenia. Pozycja bez sposobu sprawdzenia nie wchodzi do mapy.
4. Autor wypełnia kryteria ukończenia, ryzyka i tabelę zależności zewnętrznych.
5. Autor ustawia stan artefaktu na `szkic` i przekazuje plan do przeglądu, zmieniając stan na `do-przegladu`.
6. Recenzent sprawdza plan wobec [kryteriów akceptacji](kryteria-akceptacji.md) i albo zwraca go do stanu `szkic` ze sprawdzalnymi poprawkami, albo przekazuje do zatwierdzenia.
7. Koordynator zatwierdza plan, zmieniając stan na `zatwierdzony`, a po pomyślnej walidacji publikuje go stanem `opublikowany`.
8. Każda zmiana stanu zostaje zapisana w historii zmian: poprzedni stan, nowy stan, rola, uzasadnienie, identyfikator artefaktu.

**Rezultat:** plan scenariusza w stanie `opublikowany`, z mapą etapów, w której każda pozycja ma sposób sprawdzenia.

**Powiązane artefakty:** [szablon planu operacji](../04-templates/plan-operacji.md), [`schemas/operation.schema.json`](../../schemas/operation.schema.json), [przykład ALFA](../../examples/operation-example-alpha.md), [procedura think-tank](../03-procedures/think-tank.md).

## Scenariusz 2 — rejestracja komunikatu

**Aktor:** autor.

**Warunek wstępny:** istnieje opublikowany plan scenariusza; dziennik operacyjny jest założony.

**Przebieg krokowy:**

1. Autor otwiera [szablon komunikatu](../04-templates/komunikat.md) i nadaje identyfikator zgodny ze wzorcem, np. `MSG-ALFA-001`.
2. Autor wpisuje czas jako etykietę względną w formacie `T+HH:MM` — nie czas rzeczywisty.
3. Autor wskazuje nadawcę i odbiorcę jako role z numerem oraz punkt odniesienia jako punkt abstrakcyjny, np. `Punkt-A`.
4. Autor wpisuje treść komunikatu i identyfikator powiązanego artefaktu.
5. Autor ustawia oznaczenie danych syntetycznych oraz stan artefaktu.
6. Autor dopisuje wiersz do [dziennika operacyjnego](../04-templates/dziennik-operacyjny.md): czas, identyfikator, zdarzenie, status, autor, uwagi.

**Rezultat:** komunikat zapisany z czasem względnym i powiązaniem, odnotowany w dzienniku.

**Powiązane artefakty:** [szablon komunikatu](../04-templates/komunikat.md), [szablon dziennika](../04-templates/dziennik-operacyjny.md), [`schemas/message.schema.json`](../../schemas/message.schema.json), [dziennik przykładowy](../../examples/communication-log-example.md), [procedura łączności](../03-procedures/lacznosc.md).

## Scenariusz 3 — opracowanie SITREP

**Aktor:** analityk w roli autora, z przeglądem recenzenta.

**Warunek wstępny:** istnieje plan scenariusza oraz co najmniej jeden komunikat albo wpis BMS, do którego raport może się odwołać.

**Przebieg krokowy:**

1. Analityk otwiera [szablon SITREP](../04-templates/sitrep.md) i wypełnia metrykę wraz z identyfikatorem planu i okresem raportowania.
2. Analityk wpisuje podsumowanie: co jest zaliczone, co czeka na koordynatora, co może się nie udać jako następne.
3. Analityk wpisuje informacje potwierdzone — wyłącznie takie, które mają wskazane źródło i sposób sprawdzenia.
4. Analityk wpisuje hipotezy, każdą z poziomem pewności i falsyfikatorem. Hipoteza bez falsyfikatora wchodzi ze statusem `niesprawdzone`.
5. Analityk wypisuje luki w trzech kategoriach: korzeń, wzorzec, wykluczenia — oraz rozbieżności z nazwaniem obu stron.
6. Analityk wpisuje działania następcze i rozstrzygnięcia oczekiwane od koordynatora.
7. Autor przekazuje raport do przeglądu; recenzent sprawdza, czy każde twierdzenie w sekcji informacji potwierdzonych wskazuje artefakt źródłowy.

**Rezultat:** raport z rozdzielonymi faktami i hipotezami, gdzie każdy fakt ma źródło, a każda hipoteza ma falsyfikator.

**Powiązane artefakty:** [szablon SITREP](../04-templates/sitrep.md), [`schemas/sitrep.schema.json`](../../schemas/sitrep.schema.json), [przykład SITREP](../../examples/sitrep-example.md), [procedura meldunku](../03-procedures/meldunek.md).

## Scenariusz 4 — przegląd zgodności po zmianie

**Aktor:** recenzent, z udziałem administratora projektu.

**Warunek wstępny:** zaproponowano zmianę w procedurze, szablonie, przykładzie albo schemacie.

**Przebieg krokowy:**

1. Recenzent ustala, czego dotyczy zmiana: przebiegu pracy, formatu zapisu, danych przykładowych czy kontraktu danych.
2. Recenzent wypełnia tabelę oceny wpływu na cztery obszary: szablony, przykłady, schematy, ADR-y — wg [polityki zmian procedur](../06-governance/polityka-zmian-procedur.md).
3. Recenzent sprawdza, czy zmiana nie wprowadza materiału niedopuszczonego wg [klasyfikacji informacji](../06-governance/klasyfikacja-informacji.md).
4. Administrator projektu uruchamia walidatory i sprawdza kod wyjścia obu.
5. Recenzent sprawdza odnośniki względne: każdy musi wskazywać istniejący plik.
6. Recenzent sprawdza zgodność wersjonowania wobec [polityki wersjonowania](../06-governance/polityka-wersjonowania.md), gdy zmiana dotyczy schematu.
7. Recenzent rozstrzyga wobec [kryteriów akceptacji](kryteria-akceptacji.md): zmiana kompletna, zmiana do poprawy, albo odrzucenie z uzasadnieniem.

**Rezultat:** wypełniona ocena wpływu, wynik walidacji z kodami wyjścia i rozstrzygnięcie recenzenta.

**Powiązane artefakty:** [kryteria akceptacji](kryteria-akceptacji.md), [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md), [polityka wersjonowania](../06-governance/polityka-wersjonowania.md), [`.github/pull_request_template.md`](../../.github/pull_request_template.md).

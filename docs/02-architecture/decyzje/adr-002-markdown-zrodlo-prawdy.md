# ADR-002: Markdown jako źródło prawdy dla procedur i szablonów

## Status

Zaakceptowana.

## Kontekst

Procedury i szablony muszą być czytane przez ludzi, przeglądane w zmianach, wersjonowane i porównywane między wersjami. Rozważane były trzy możliwości: dokumenty w narzędziu zewnętrznym z widokiem edycyjnym, dane strukturalne z generowaniem dokumentu, oraz pliki Markdown w repozytorium.

Materiał źródłowy niósł przy tym mocną obserwację praktyczną: dokument prowadzony w narzędziu bez kontroli wersji zapisuje się natychmiast i nieodwracalnie, a odzysk poprzedniej treści wymaga działania człowieka w interfejsie tego narzędzia. Przy pracy, w której zmiana dokumentu jest głównym rezultatem, brak historii jest brakiem samego rezultatu.

Druga obserwacja dotyczyła widoku stanu: gdy istnieje jednocześnie dokument i jego widok przyjmujący zmiany, powstaje pytanie, który z nich jest prawdą. Bez rozstrzygnięcia oba stają się prawdą częściową.

## Decyzja

**Pliki Markdown w repozytorium są źródłem prawdy dla procedur i szablonów.** Wynikają z tego trzy reguły:

1. **Widok jest wyłącznie widokiem i kanałem zwrotnym, nigdy drugą prawdą — przy rozjeździe rozstrzyga plik.** Zgłoszenie przyjęte przez widok nie zmienia stanu samo z siebie: autor prowadzący je odczytuje, przepisuje do pliku i dopiero ten zapis jest stanem.
2. Stan scenariusza niesie plan operacji i jest nadpisywany; historię zdarzeń niesie dziennik operacyjny i jest wyłącznie dopisywany. Wpis raz zapisany nie jest poprawiany — błąd prostuje wpis następny.
3. Dokumentacja jest prowadzona w miejscu z kontrolą wersji. Historia zmian jest częścią artefaktu, nie dodatkiem do niego.

## Konsekwencje

### Skutki pozytywne

- Każda zmiana ma autora, czas, uzasadnienie w opisie zmiany i możliwość porównania z wersją poprzednią, bez żadnego mechanizmu ponad kontrolę wersji.
- Zmiana podlega przeglądowi w tym samym trybie co zmiana kodu, więc [kryteria akceptacji](../../01-product/kryteria-akceptacji.md) da się sprawdzać na różnicy.
- Reguła 1 usuwa całą klasę pytań o to, który zapis jest właściwy: odpowiedź jest z góry i nie zależy od sytuacji.
- Markdown jest czytelny bez narzędzia, więc dokumentacja nie traci wartości, gdy narzędzie przestaje być dostępne.
- Treść da się kontrolować maszynowo — [`scripts/validate_markdown.sh`](../../../scripts/validate_markdown.sh) sprawdza kompletność sekcji procedur, brak tekstów zastępczych i brak ścieżek bezwzględnych.

### Koszty

- Markdown nie wymusza struktury. Kompletność sekcji trzeba sprawdzać osobnym skryptem, a poprawność treści w sekcji nie jest sprawdzana wcale.
- Reguła 1 nakłada pracę ręczną: zgłoszenie z widoku musi ktoś odczytać i przepisać. Dopóki tego nie zrobi, widok pokazuje coś, czego w pliku nie ma.
- Tabele Markdown są kłopotliwe w utrzymaniu przy wielu kolumnach i nie mają walidacji spójności między wierszami.
- Dane w tabelach Markdown nie są danymi strukturalnymi: nie da się ich zapytać ani zwalidować bez odrębnego kontraktu, co było powodem powstania [ADR-003](adr-003-json-schema.md).
- Wersjonowanie dokumentu i wersjonowanie schematu biegną osobno, więc rozjazd między nimi jest możliwy i wymaga kontroli — patrz [polityka wersjonowania](../../06-governance/polityka-wersjonowania.md).

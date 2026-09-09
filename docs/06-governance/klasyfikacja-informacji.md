# Klasyfikacja informacji

Dwie listy poniżej są **rozłączne**. Materiał, który nie należy do pierwszej, nie wchodzi do repozytorium — brak na drugiej liście nie jest zezwoleniem.

## Materiały dopuszczone

- Dane syntetyczne z zamkniętego zestawu oznaczeń: `ALFA`, `BRAVO`, `Punkt-A`, `Punkt-B`, `Koordynator-01`, `Analityk-01`, `Recenzent-01`, `OP-ALFA-001`, `SITREP-ALFA-001`, `MSG-ALFA-001` … `MSG-ALFA-005`.
- Dokumentacja procesu: procedury, opisy architektury pojęciowej, modele danych i stanów, zapisy decyzji.
- Abstrakcyjne identyfikatory zgodne z wzorcem `^[A-Z0-9-]+$` oraz oznaczenia ról wg wzorca `^[A-Za-z0-9-]+$`.
- Puste szablony wraz z instrukcjami wypełniania.
- Przykłady syntetyczne, oznaczone nagłówkiem `DANE SYNTETYCZNE`.
- Czas jako etykieta względna w formacie `T+HH:MM`.
- Kontrakty danych, skrypty walidacyjne i konfiguracja automatycznej walidacji, o ile nie wymagają żadnego sekretu.

## Materiały niedopuszczone

- Dane osobowe: imiona, nazwiska, adresy, adresy e-mail, numery telefonów, identyfikatory osób.
- Dane lokalizacyjne: rzeczywiste miejsca, adresy, współrzędne geograficzne, nazwy obiektów.
- Rzeczywiste dane operacyjne dowolnego rodzaju.
- Dane zasobowe: stany, ilości, harmonogramy, terminy bezwzględne odnoszące się do rzeczywistości.
- Sekrety: klucze, tokeny, hasła, certyfikaty, pliki konfiguracyjne z poświadczeniami — także w treści przykładowej i w kodzie zakomentowanym.
- Informacje identyfikujące podmioty: nazwy firm, klientów, organizacji, jednostek, ram prawnych.
- Dane pochodzące z systemów produkcyjnych, w tym zrzuty ekranu i fragmenty logów.
- Bezwzględne ścieżki systemu plików.

Nazwa podmiotu, klienta, projektu ani ramy prawnej **nie wchodzi jako domysł**. Gdy nazwa jest potrzebna, a nie wynika ze źródeł, wpisz `[do potwierdzenia]`.

## Oznaczanie danych syntetycznych

| Miejsce | Sposób oznaczenia |
| --- | --- |
| Przykład w [`examples/`](../../examples/) | pierwszy nagłówek pliku brzmi `DANE SYNTETYCZNE` |
| Artefakt zawierający dane przykładowe | jawne oznaczenie w pierwszym akapicie oraz pole oznaczające dane syntetyczne w metryce |
| Kontrakt danych | pole `synthetic` wymagane, wartość `true`; artefakt bez niego nie przechodzi kontroli |
| Fragment przykładowy wewnątrz dokumentu wiążącego | zdanie wskazujące, że wartości są syntetyczne, bezpośrednio przy fragmencie |

Oznaczenie w kontrakcie danych jest jedynym z powyższych, które działa jako blokada techniczna. Pozostałe są zapisem.

## Postępowanie po wykryciu materiału niedopuszczonego

1. **Ogranicz ekspozycję.** Przerwij pracę nad zmianą, nie publikuj jej i nie rozszerzaj zakresu, w którym materiał się znajduje.
2. **Usuń materiał z gałęzi roboczej** zgodnie z zasadami repozytorium. Usunięcie z drzewa roboczego nie usuwa materiału z historii — gdy materiał znalazł się w commicie już scalonym, wymaga to przepisania historii i jest rozstrzygnięciem właściciela repozytorium.
3. **Zgłoś zdarzenie prywatnie** administratorowi projektu albo właścicielowi repozytorium, wskazując rodzaj materiału i miejsce jego wystąpienia.
4. **Nie publikuj danych w issue ani w pull requeście.** Zgłoszenie opisuje rodzaj naruszenia, nie jego treść. Cytowanie materiału niedopuszczonego w zgłoszeniu powiększa naruszenie.

Kontakt i zakres zgłoszenia: [`SECURITY.md`](../../SECURITY.md).

## Czego ta klasyfikacja nie wykrywa

Walidator wykrywa bezwzględne ścieżki systemu plików i teksty zastępcze. **Nie rozpoznaje** danych rzeczywistych wpisanych w prawidłowe pole: nazwisko w polu roli, rzeczywiste miejsce w polu tytułu, prawdziwa nazwa firmy w opisie scenariusza przejdą kontrolę bez sygnału.

Ta luka jest powodem, dla którego kontrola ludzka wobec obu list pozostaje obowiązkowym kryterium akceptacji — patrz [kryteria akceptacji](../01-product/kryteria-akceptacji.md), pozycje 2 i 3.

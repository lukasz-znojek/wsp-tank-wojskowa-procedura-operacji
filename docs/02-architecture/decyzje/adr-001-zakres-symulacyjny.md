# ADR-001: Zakres wyłącznie symulacyjny i szkoleniowy

## Status

Zaakceptowana.

## Kontekst

Materiały wejściowe projektu opisywały metodę prowadzenia wieloetapowej pracy przy użyciu metaforyki wojskowej: dowodzenia, rozpoznania, meldunków. Metaforyka była formą opisu pracy nad projektem, nie jej treścią, ale dokumentacja zbudowana na takim materiale może zostać odczytana jako doktryna albo instrukcja postępowania.

Dochodzi do tego drugie ryzyko: dokumentacja opisująca „system zarządzania" naturalnie przyciąga dane rzeczywiste. Wystarczy jedno pole przyjmujące lokalizację albo identyfikator jednostki, żeby repozytorium projektowe zaczęło gromadzić materiał, dla którego nie było przeznaczone i którego nie chroni.

Trzeba było rozstrzygnąć, czy projekt dopuszcza jakiekolwiek zastosowanie poza szkoleniem — i rozstrzygnąć to raz, na poziomie zakresu, a nie przy każdym kolejnym dokumencie.

## Decyzja

Projekt obejmuje **wyłącznie symulacyjne i szkoleniowe** środowisko BMS oraz metodę porządkowania informacji w fikcyjnych scenariuszach. Z decyzji wynikają cztery reguły wiążące:

1. Żaden dokument nie jest instrukcją do rzeczywistych działań. Procedury opisują pracę nad artefaktami dokumentowymi: porządkowanie informacji, rejestrowanie zdarzeń, ocenę pewności, zatwierdzanie, publikację i audyt.
2. Wszystkie dane są syntetyczne, z zamkniętego zestawu oznaczeń opisanego w [ograniczeniach i zasadach](../../00-overview/ograniczenia-i-zasady.md).
3. Kontrakty danych **nie zawierają** pól przyjmujących współrzędne geograficzne, dane osobowe ani dane operacyjne. Czas zdarzenia jest etykietą względną, miejsce jest punktem abstrakcyjnym.
4. Brak integracji produkcyjnych jest stanem docelowym tej fazy, nie zaległością — szczegóły w [integracjach](../integracje.md).

Metaforyka źródłowa zostaje przełożona na neutralny język procesowy. Nazwy procedur przejęte ze źródeł mają znaczenie ściśle procesowe, zdefiniowane w [glosariuszu](../../00-overview/glosariusz.md).

## Konsekwencje

### Skutki pozytywne

- Zakres jest rozstrzygnięty raz; przy każdym kolejnym dokumencie odpowiedź jest gotowa i nie wymaga negocjacji.
- Reguła 3 działa jako **blokada techniczna**, nie zapis: pole, którego w kontrakcie nie ma, nie przyjmie danych. To jedyny mechanizm w tym projekcie, który egzekwuje zakres bez udziału człowieka.
- Repozytorium nie gromadzi materiału wymagającego ochrony, więc nie potrzebuje mechanizmów tej ochrony: kontroli dostępu do treści, klasyfikacji, retencji.
- Przykłady można publikować i przeglądać bez oceny wrażliwości każdego z nich osobno.

### Koszty

- Dokumentacja nie da się użyć do żadnego rzeczywistego zastosowania bez przepisania jej od podstaw wraz z kontraktami danych. To nie jest wada do obejścia — to cel — ale trzeba go nazwać wprost.
- Przykłady są mniej sugestywne niż przykłady realistyczne, bo `Punkt-A` nie mówi nic ponad to, że jest punktem.
- Czas względny utrudnia opisanie zależności kalendarzowych; scenariusz wymagający terminów bezwzględnych nie da się w tym modelu zapisać.
- Przekład metaforyki na język procesowy kosztował część zwięzłości materiału źródłowego: pojęcie oddane jednym słowem metafory wymaga zdania w języku neutralnym.
- Reguły 1 i 2 pozostają **zapisem, nie mechanizmem**. Walidator nie rozpozna danych rzeczywistych wpisanych w prawidłowe pole ani treści instruktażowej w sekcji procedury.

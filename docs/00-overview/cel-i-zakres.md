# Cel i zakres

## Cel projektu

Projekt opisuje **symulacyjne środowisko BMS** (Battle Management System) oraz metodę porządkowania informacji w fikcyjnych scenariuszach szkoleniowych. Wynikiem jest spójny, audytowalny zbiór procedur, szablonów, przykładów i kontraktów danych, który może stanowić podstawę demonstratora albo materiału szkoleniowego.

Środowisko jest symulacyjne w sensie ścisłym: nie odwzorowuje żadnego istniejącego systemu, nie przyjmuje danych z żadnego systemu i nie wytwarza wyników nadających się do użycia poza szkoleniem.

## Zakres włączony

| Obszar | Co obejmuje |
| --- | --- |
| Procedury | przebieg pracy nad fikcyjnymi artefaktami dokumentowymi: porządkowanie informacji, rejestrowanie zdarzeń, ocena pewności, zatwierdzanie, publikacja |
| Szablony | formaty zapisu czterech typów artefaktów: plan operacji, wpis BMS, komunikat, SITREP |
| Przykłady | pojedyncze wypełnienia szablonów, w całości syntetyczne i tak oznaczone |
| Kontrakty danych | schematy JSON Schema opisujące artefakty, z kontrolowanymi słownikami i wąskimi wzorcami identyfikatorów |
| Walidacja | maszynowa kontrola zgodności schematów oraz kompletności sekcji procedur |
| Audyt zmian | rejestr zdarzeń i rejestr naruszeń, wyłącznie dopisywane |
| Decyzje | zapisy ADR dla decyzji dotyczących zakresu, formatu źródła prawdy i kontraktów danych |

## Zakres wyłączony

| Obszar | Dlaczego poza zakresem |
| --- | --- |
| Integracje z rzeczywistymi systemami | Projekt nie ma i nie planuje połączeń produkcyjnych. Jest to decyzja, nie zaległość — patrz [ADR-001](../02-architecture/decyzje/adr-001-zakres-symulacyjny.md) i [integracje](../02-architecture/integracje.md). |
| Dane operacyjne | Repozytorium nie jest miejscem przechowywania danych rzeczywistych żadnego rodzaju. |
| Dane osobowe, lokalizacje, współrzędne, identyfikatory podmiotów | Kontrakty danych celowo nie mają pól, które by je przyjęły. |
| Stany zasobów i harmonogramy | Wielkości tego rodzaju należą do rzeczywistych działań, nie do dokumentacji procesu. |
| Sekrety: klucze, tokeny, hasła, certyfikaty | Zakaz bezwarunkowy — patrz [`SECURITY.md`](../../SECURITY.md). |
| Instrukcje rzeczywistych działań | Procedury opisują pracę nad dokumentami. Treść nadająca się do zastosowania poza dokumentacją nie wchodzi do repozytorium. |
| Automatyczne decyzje o skutkach poza dokumentacją | Rozstrzygnięcia w tym projekcie dotyczą stanu dokumentów i podejmuje je człowiek. |

## Granice interpretacyjne

**Czym ta dokumentacja jest:** opisem procesu projektowego i szkoleniowego. Mówi, jak porządkować informacje, jak oznaczać ich pewność, kto zatwierdza dokument i jak zapisać, że coś się zmieniło.

**Czym nie jest:** doktryną, regulaminem ani instrukcją postępowania w rzeczywistych działaniach. Metaforyka wojskowa obecna w materiałach źródłowych była formą opisu pracy nad wieloetapowym projektem, nie jego treścią; dokumentacja wynikowa posługuje się neutralnym językiem procesowym.

**Jak czytać terminy przejęte z materiału źródłowego.** Terminy `przejazd`, `zwiad`, `think-tank`, `meldunek` i `komenda` są nazwami procedur i mają w tym projekcie znaczenie ściśle procesowe, zdefiniowane w [glosariuszu](glosariusz.md). Poza tym znaczeniem nie należy ich interpretować.

**Rozstrzyganie rozbieżności.** Materiał referencyjny w [`docs/05-reference/`](../05-reference/README.md) jest danymi do sprawdzenia, nie normą. Przy rozjeździe rozstrzyga dokument wiążący: procedura, szablon, model architektoniczny albo zatwierdzony ADR. Rozbieżność należy odnotować w [rejestrze pochodzenia](../05-reference/sources.md).

## Powiązane dokumenty

- [ograniczenia i zasady](ograniczenia-i-zasady.md)
- [glosariusz](glosariusz.md)
- [ADR-001: zakres wyłącznie symulacyjny i szkoleniowy](../02-architecture/decyzje/adr-001-zakres-symulacyjny.md)
- [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md)

# Glosariusz

Definicje obowiązujące w całym repozytorium. Termin użyty inaczej niż tutaj jest błędem dokumentu, nie wariantem stylu.

## Pojęcia podstawowe

**BMS** — Battle Management System. W tym projekcie: **symulacyjne środowisko zarządzania stanem fikcyjnego scenariusza szkoleniowego**, złożone z katalogu procedur, katalogu szablonów, rejestru artefaktów, walidatora i warstwy audytu. Nie jest systemem operacyjnym żadnego rodzaju i nie ma zastosowania poza szkoleniem i projektowaniem. Rozwinięcie skrótu — patrz „Terminy sporne".

**Procedura** — opis **przebiegu działania**: kto, w jakiej kolejności, na podstawie czego i z jakim rozstrzygnięciem. Nie zawiera formatu zapisu ani wypełnionych danych. Każda procedura ma dziewięć wymaganych sekcji.

**Szablon** — opis **formatu zapisu** artefaktu: jakie pola, jakie tabele, jakie wartości dopuszczone. Pozostaje pusty; wypełniony przestaje być szablonem.

**Przykład** — jedno **fikcyjne wypełnienie** szablonu. Pokazuje użycie, nie ustanawia reguły.

**Artefakt** — pojedynczy dokument wytworzony albo aktualizowany w scenariuszu, mający identyfikator, status i autora. Cztery typy artefaktów danych: plan operacji, wpis BMS, komunikat, SITREP.

**SITREP** — meldunek sytuacyjny: raport stanu scenariusza **w trakcie**, przyrostowy od poprzedniego SITREP. Sumy całego scenariusza niesie wyłącznie raport końcowy.

**ADR** — Architecture Decision Record, zapis decyzji architektonicznej w układzie Status · Kontekst · Decyzja · Konsekwencje. Indeks: [`DECISIONS.md`](../../DECISIONS.md).

**Źródło prawdy** — dokument, który rozstrzyga przy rozbieżności. W tym projekcie źródłem prawdy dla stanu scenariusza jest plan operacji, a dla historii zdarzeń — dziennik operacyjny. Widok stanu jest widokiem i kanałem zwrotnym, **nigdy drugą prawdą**.

## Artefakty i dokumenty scenariusza

**Plan operacji** — artefakt niosący **stan** scenariusza: cel, dowód, zamiar, mapę etapów, progi przerwania, zależności zewnętrzne. Jest nadpisywany.

**Dziennik operacyjny** — artefakt niosący **historię zdarzeń** i rejestr naruszeń. Jest wyłącznie dopisywany; wpis raz zapisany nie jest poprawiany, a błąd prostuje wpis następny.

**Widok stanu** — strona pokazująca stan scenariusza odczytany z planu i dziennika, przyjmująca zgłoszenia koordynatora. Zgłoszenie nie zmienia stanu samo z siebie: stanem jest dopiero zapis w planie.

**Mapa etapów** — lista pozycji scenariusza w kolejności zależności, każda z kryterium zaliczenia sprawdzalnym poleceniem. Pozycja pierwsza opisuje rezultat kompletny, nie fragment.

**Pozycja mapy** — jeden wiersz mapy etapów. Ma własny stan, odrębny od cyklu życia dokumentu — patrz [model stanów](../02-architecture/model-stanow.md).

**Przejazd** — jeden zamknięty cykl pracy nad wybranym zakresem mapy etapów, od zlecenia cząstkowego do odbioru. Scenariusz obejmuje co najmniej dwa przejazdy; scenariusz jednoprzejazdowy nie kwalifikuje się do tych procedur.

**Zlecenie cząstkowe** — jednozdaniowe polecenie otwierające przejazd: zakres z mapy plus kryterium zaliczenia.

**Zadanie analityczne** — odrębne zadanie o ograniczonym zakresie, odpowiadające na jedno pytanie i zwracające wynik wg kontraktu zwrotu poniżej 2 000 znaków. Ma odjęte możliwości zapisu: czyta i mierzy, nie zmienia dokumentów.

**Kontrakt zwrotu** — obowiązkowy układ odpowiedzi zadania analitycznego: co ustalił, czym zmierzone, czego nie ustalił, co ma w zanadrzu, oznaczenie.

**Próg przerwania** — odwrotność celu: warunek, którego osiągnięcie zatrzymuje pracę i przenosi rozstrzygnięcie do koordynatora. Progi ustala koordynator przy zatwierdzaniu planu, nie autor prowadzący w toku pracy.

## Role

Cztery role projektowe i ich zakresy opisuje [role i uprawnienia](../01-product/role-i-uprawnienia.md). W procedurach występują w następujących wcieleniach:

| Termin w procedurach | Rola projektowa | Zakres |
| --- | --- | --- |
| **koordynator** | koordynator | zamawia scenariusz, ustala progi, zatwierdza plan, odbiera przejazdy, rozstrzyga operacje nieodwracalne |
| **autor prowadzący** | autor | prowadzi scenariusz, wydaje zlecenia cząstkowe, zapisuje stan i dziennik, odświeża widok |
| **autor prowadzący etap** | autor | prowadzi pętlę budowy wewnątrz jednego przejazdu |
| **autor** | autor | wytwarza artefakt wobec kryterium ze zlecenia |
| **analityk** | autor | wykonuje zadanie analityczne; oznaczenie syntetyczne `Analityk-01` |
| **recenzent** | recenzent | ocenia artefakt wobec kryterium, przy pomocy wskazanej miary |
| **administrator projektu** | administrator | konfiguracja, uprawnienia, dostępność walidacji |

## Pojęcia jakości informacji

**Poziom pewności** — trójstopniowa ocena informacji: `potwierdzone`, `prawdopodobne`, `niepotwierdzone`. `potwierdzone` wymaga wskazanego źródła i sposobu sprawdzenia.

**Falsyfikator** — zdanie mówiące, co obaliłoby dany wniosek. Wniosek bez falsyfikatora wchodzi ze statusem **niesprawdzone**, nie jako ustalenie.

**Niemierzalne** — jawna odpowiedź wykonawcy, gdy reguły nie da się zmierzyć dostępnym narzędziem. Ocena podana w miejscu pomiaru jest gorsza niż brak pomiaru: brak widać, ocena udaje liczbę.

**Dane syntetyczne** — dane w całości wymyślone dla celów szkoleniowych, nieodnoszące się do żadnych rzeczywistych podmiotów, osób, miejsc ani zdarzeń. Wszystkie dane w tym repozytorium są syntetyczne — patrz [ograniczenia i zasady](ograniczenia-i-zasady.md).

**Walidacja** — maszynowa kontrola spójności: [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py) dla kontraktów danych i [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh) dla kompletności sekcji procedur. Walidacja jest jedyną blokadą techniczną w tym repozytorium; pozostałe reguły są zapisem.

## Terminy sporne

| Termin | Strona A | Strona B | Wersja obowiązująca |
| --- | --- | --- | --- |
| Rozwinięcie skrótu BMS | „Battle Management System" — [`README.md`](../../README.md) | „Battlefield Management System" — materiał źródłowy | **Battle Management System**. Wariant źródłowy jest historyczny i nie należy go wprowadzać do nowych dokumentów. |
| Słownik stanów | stan pozycji mapy: `niezaliczone → w toku → zielone → odrzucone` | cykl życia artefaktu: `szkic → do-przegladu → zatwierdzony → opublikowany`, plus `odrzucony` | **Oba, jako dwa odrębne pojęcia.** Kontrakty w `schemas/` opisują wyłącznie cykl życia artefaktu — patrz [model stanów](../02-architecture/model-stanow.md). |
| Nazwa środowiska i ramy organizacyjnej | sugerowana przez nazwę katalogu i materiał źródłowy | nieustalona w dokumentacji | **`[do potwierdzenia]`.** Nazw podmiotów, klientów i ram nie wprowadza się jako domysłu. |

Rejestr rozbieżności wraz z dokumentami rozstrzygającymi: [pochodzenie materiałów](../05-reference/sources.md).

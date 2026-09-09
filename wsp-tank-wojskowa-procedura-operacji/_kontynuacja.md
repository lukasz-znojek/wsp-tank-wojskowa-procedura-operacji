# Kontynuacja — dopracowanie skilla `tank` (destylat)

**Stan na:** 2026-09-09 06:35 · **Katalog roboczy nowego okna:**
`/Users/lukaszznojek/Mój dysk/10-projekty/wsp-tank-wojskowa-procedura-operacji/tank-skill-destylat`

Uruchomienie: otwórz nowe okno w tym katalogu i wklej prompt poniżej w całości.

---

## Prompt

Model: Opus 5, effort high — zadanie jest audytem i redakcją tekstu regulaminowego
z żelaznym prawem testu przed zmianą; nie ma tu kodu do uruchomienia, jest za to
długie rozumowanie o spójności kilkunastu plików naraz.

---

Pracujesz nad skillem `tank` — samodzielną, wojskową procedurą prowadzenia operacji
wieloetapowych. Twoim zadaniem jest **dopracować go do stanu instalowalnego**.

### Zakres materiału — twardy

Jedyne pliki, które wolno Ci czytać jako treść skilla, leżą w `tank/` w katalogu
roboczym. Jest ich 13:

`SKILL.md` · `arsenal.md` · `procedura_komendy.md` · `procedura_lacznosc.md` ·
`procedura_meldunek.md` · `procedura_przejazd.md` · `procedura_rozpoznanie.md` ·
`procedura_think_tank.md` · `procedura_zwiad.md` · `szablon_bms.md` ·
`szablon_dziennik.md` · `szablon_operacja.md` · `szablon_sitrep.md`

**Czego nie wolno otworzyć ani przywołać — pod żadnym pozorem:**

- `~/.claude/skills-odinstalowane/tank-2026-09-09` — poprzednia, odinstalowana wersja
- `~/dev/tank` — dawne repozytorium źródłowe wraz z `WYTYCZNE.md`, `_manewry`, `_wartownik`
- `Mój dysk/90-archiwum/2026/wsp-sztab-generalny/01.12_zbrojownia/tank` — archiwum

Powód jest celem projektu, nie kaprysem: destylat ma być **samodzielny**. Skill, który
da się ocenić dopiero po zajrzeniu do poprzedniej wersji, tego warunku nie spełnia.
Jeżeli w destylacie czegoś brakuje, to jest ustalenie do zameldowania — nie powód, żeby
sięgnąć po stary tekst. Gdyby któryś z tych plików wszedł Ci do kontekstu przypadkiem,
zamelduj to i zacznij zadanie od nowa w świeżym oknie.

### Metoda — obowiązkowa

Prowadź pracę skillem `superpowers:writing-skills`. Wywołaj go zanim otworzysz
pierwszy plik `tank/`. Jego żelazne prawo obowiązuje bez wyjątku i dotyczy **także
edycji istniejącego skilla**: żadnej zmiany w tekście bez wcześniejszego, obserwowanego
niepowodzenia. Kolejność RED → GREEN → REFACTOR, scenariusze na świeżych podagentach,
racjonalizacje spisywane dosłownie.

Zanim zaczniesz mierzyć, przeczytaj wszystkie 13 plików. Ocena wyrywkowa jednego pliku
jest w tym skillu bezwartościowa: doktryna rozkłada się na etapy i szablony, które
odwołują się do siebie nawzajem.

### Co ma powstać

1. **Diagnoza** — lista ustaleń o destylacie, każde z dowodem `plik:wiersz` albo
   z komendą, którą je odtworzysz. Ustalenie bez jednego z tych dwóch nie wchodzi.
2. **Scenariusze RED** — dla każdego ustalenia, które chcesz naprawić, scenariusz
   pokazujący tryb porażki na świeżej jednostce, uruchomiony **przed** poprawką.
3. **Poprawki** — wyłącznie tam, gdzie RED faktycznie padł. Forma poprawki dobrana
   do rodzaju porażki (`superpowers:writing-skills`, sekcja „Match the Form to the Failure").
4. **Weryfikacja** — te same scenariusze po zmianie.

### Osie, które trzeba rozstrzygnąć

- **Instalowalność.** Czy `tank/SKILL.md` spełnia specyfikację skilla Claude Code —
  pola frontmattera, dozwolone znaki w `name`, zgodność `name` z nazwą katalogu, limit
  1024 znaków. To sprawdzasz pierwsze: jeżeli skill się nie ładuje, jakość treści
  jest bezprzedmiotowa. Sprawdzian ma być empiryczny — instalacja kopii i próba
  wywołania — nie odczytanie specyfikacji.
- **Samodzielność.** Czy procedury niosą postępowanie same, bez odwołania do
  jakiegokolwiek zewnętrznego skilla. Miejsce, gdzie porucznik musiałby wiedzieć coś,
  czego destylat nie mówi, jest defektem.
- **Wykonywalność.** Czy każda czynność ma adres: nazwę narzędzia, komendę, plik.
  „Widget elicitacji" bez nazwy narzędzia albo formuła `max(...)` bez komendy, którą
  się ją policzy, to instrukcja, której nie da się wykonać.
- **Pomiary.** Czy każda liczba, której skill żąda, ma obok komendę odtwarzającą.
- **Testy.** Czy skill niesie własny mechanizm wykrywania trybów porażki i czy
  ma to, czego `superpowers:writing-skills` wymaga od skilla dyscyplinującego —
  tank jest dyscyplinujący, bo stawia bramki i zakazy.
- **Kolizja z warstwą osobistą.** `Mój dysk/CLAUDE.md` § „Metoda pracy nad projektem"
  wymaga od projektu pliku `<projekt>/PLAN.md` i wpisu w `PROJEKT.md`. Destylat
  produkuje `_operacja.md` i `_dziennik.md`. Nazwij obie strony i **nie rozstrzygaj
  sam** — to decyzja właściciela.

### Czego nie wolno ruszać

- `Mój dysk/CLAUDE.md` i `_KONWENCJE.md` — edycja wyłącznie decyzją właściciela.
- Katalogów wymienionych wyżej jako zakazane.
- `~/.claude/skills/` — nie instaluj tam niczego na stałe bez zgody; kopię testową
  zakładaj świadomie i sprzątaj po teście.

### Stan zmierzony 2026-09-09 (zapis, nie prawda — sprawdź sam)

- `~/.claude/skills/` zawiera wyłącznie `przeglad-tygodniowy`. Skill `tank` został
  odinstalowany, kopia leży w `~/.claude/skills-odinstalowane/tank-2026-09-09`
  (nie otwierać — patrz zakazy).
- `30-zasoby/35-standardy/skille-projektowe.md` odnotowuje odinstalowanie.
- `Mój dysk/CLAUDE.md:156` nadal wymienia `tank` jako obecny w katalogu własnym —
  wpis nieaktualny, poprawka czeka na decyzję właściciela.
- Folder projektu `wsp-tank-wojskowa-procedura-operacji` **nie ma `PROJEKT.md`**,
  wbrew konstytucji warstwy. Zgłoś to właścicielowi jednym zdaniem na starcie.
- Destylat nie jest pod kontrolą wersji: `10-projekty` leży w mirrorze Dysku Google,
  gdzie repozytoriów git się nie zakłada. Każdy zapis jest natychmiastowy i widoczny
  na wszystkich urządzeniach — przed nadpisaniem pliku pokaż, co zniknie.

### Meldunek

Zacznij od jednego akapitu: co przeczytałeś, ile plików, i jaki jest Twój pierwszy
pomiar. Nie streszczaj tego promptu.

---
typ: procedura_tanka
rola: etap THINK-TANK — od polecenia Generała do zatwierdzonego rozkazu
wersja: 4
data: 2026-09-09
---

# THINK-TANK

Wejście: Generał wywołał tank. Wyjście: zatwierdzony rozkaz, wypełniony `_operacja.md`,
założony `_dziennik.md`, opublikowana BMS.

## Sztabowa redakcja rozkazu

Generał podaje surowiec, sztab podaje wersję lepszą, Generał poprawia albo przyjmuje.
Cztery pola — kolejność wiążąca, bo każde następne czyta się przez poprzednie:

| Pole | Co w nim | Czym grozi puste |
|---|---|---|
| **ROLA** | kim ma być wykonawca i czego się po nim spodziewać | model bierze rolę domyślną, zwykle asystenta, i doradza zamiast robić |
| **POŁOŻENIE** | co już jest, czego próbowano, co zawiodło | odbudowa wiedzy, którą Generał ma w głowie — najdroższa pozycja każdej misji |
| **ZADANIE** | jeden mierzalny stan końcowy i dowód, który go rozstrzyga | „ładnie" zamiast liczby, odbiór nierozstrzygalny |
| **OGRANICZENIA** | czego nie wolno ruszyć, z uzasadnieniem przy każdym | ograniczenie bez powodu zostanie „poprawione" |

Zbierasz je **formularzem**, nie prozą i nie ankietą (`procedura_lacznosc.md`). Przed pokazaniem
wypełnij za Generała wszystko, co wynika z rozmowy i z załączników; pytaj wyłącznie o brakujące.

### Rundy

1. Generał oddaje surowiec.
2. Porucznik **przepisuje** cztery pola na wersję ostrzejszą i pokazuje ją obok surowej:
   co doprecyzował, co uznał za domysł, czego wciąż brakuje. Nie streszcza — redaguje.
3. Generał poprawia albo przyjmuje.

**Próg trzech rund.** Runda, która nie zmienia żadnego z czterech pól, jest ostatnia. Trzy rundy
bez domknięcia → to brak rozstrzygnięcia po stronie Generała: nazwij je i pytaj wprost, ankietą
z rekomendacją. Redakcja obowiązuje także wtedy, gdy polecenie brzmi jednoznacznie.

## Dalsza kolejność

1. **Kwalifikacja** (OBOWIĄZKOWA) — rozmowa, nie formularz: pytanie po pytaniu, aż wyjdzie cel,
   zamiar, zakres wykluczony. Jedna runda wystarcza → tank się wycofuje.
2. **Rozpoznanie** — wg `procedura_rozpoznanie.md`. Wynik wchodzi do POŁOŻENIA.
3. **Podłoże trwałości** — `git rev-parse --is-inside-work-tree`; wynik i skutek wpisz do
   ZABEZPIECZENIA (`szablon_operacja.md` §4).
4. **Mapa etapów** (OBOWIĄZKOWA) — pozycje w kolejności zależności, każda z kryterium zaliczenia
   mierzalnym komendą. Pozycja pierwsza zawsze końcem do końca.
5. **Pliki operacji** — wypełnij `szablon_operacja.md` → `_operacja.md` i załóż `_dziennik.md`
   ze `szablon_dziennik.md`; oba w korzeniu projektu, poza katalogiem realizacji. Potem
   `/rename <KRYPTONIM>` — `claude --resume <KRYPTONIM>` wraca do sesji (best-practices.md, U-76).
6. **Zależności zewnętrzne** — co przyjdzie spoza operacji: materiały, zgody, dostępy, decyzje
   osób trzecich. Do tabeli w ZABEZPIECZENIU i **uruchom pierwszego dnia**, nie w chwili
   zablokowania.
7. **Audyt braków** — jednostka `Explore` z pytaniem **odwrotnym do zwiadu**: nie „co tam jest",
   tylko *jakie pytania musiałby zadać wykonawca, żeby ruszyć bez dopytywania*. Jedna na pozycję,
   równolegle, zakaz wykonywania zadania. Zwrot: pytanie w jednej linii, `plik:linia` albo słowo
   `brak`, oraz pozycja, od której brak blokuje. **Zero pytań na pozycji = zielone światło dla
   niej**; pozycje dalsze mogą mieć braki i to nie wstrzymuje startu. Pytania idą do Generała
   **jedną rundą**, nie po kolei w trakcie przejazdów.
8. **BMS** — publikacja wg `szablon_bms.md`, URL do ZABEZPIECZENIA.

## Rozkaz — cztery punkty, wszystkie obowiązkowe

1. **CEL** — pozycja pierwsza mapy etapów, koniec do końca — i jego odwrotność, **KULMINACJA**.
   Progi ustala Generał tu, nie porucznik w polu; treść pola: `szablon_operacja.md` §2.
2. **ZAMIAR** — po co. Zwiad zabił założenie? Korekta w ramach zamiaru → jedź, melduj przy
   odbiorze. Poza zamiarem → wracaj do Generała. Nie improwizuj.
3. **ZASADY UŻYCIA SIŁY** — bramki nieodwracalności warstw wyższych, bez zmian.
   „Po trupach" = bez zatrzymywania na wątpliwości mierzalne. Nie: bez bramek.
4. **SZTAB** — narzędzia i skille włączone w tej sesji, wypisane teraz. Brak ujawniony
   w przejeździe → zwiad szuka. Korekta kursu, nie nowy rozkaz.

Cztery pola surowca wchodzą tu wprost: ROLA i OGRANICZENIA do SZTABU i ZASAD UŻYCIA SIŁY,
POŁOŻENIE do punktu 1 pliku operacji, ZADANIE do CELU i DOWODU.

## Bramka

Generał zatwierdza rozkaz **na BMS-ie albo słowem**. Bez zatwierdzenia tank nie rusza.
Po zatwierdzeniu — NATARCIE, budowa startuje w świeżym oknie: kontekst think-tanku nie jest
kontekstem budowy.

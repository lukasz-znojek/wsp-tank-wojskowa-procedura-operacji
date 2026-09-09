---
typ: procedura_tanka
rola: etap NATARCIE — przejazd po poligonie od FRAGO do odbioru
wersja: 3
data: 2026-09-09
---

# PRZEJAZD

Po jednym poligonie kilka przejazdów, aż pozycja pierwsza mapy zielona.

## Kolejność

1. **FRAGO-n** — rozkaz cząstkowy, jedno zdanie: zakres z mapy (kilka pozycji, nie cała)
   + kryterium zaliczenia.
2. **Zwiad** — tylko gdy niewiadoma blokuje decyzję albo wynik zalałby okno; `procedura_zwiad.md`.
3. **Budowa** — sierżant prowadzi pętlę: jednostka buduje, druga recenzuje wobec kryterium
   z FRAGO, poprawka wraca do budującej, bez pauzy między zadaniami. Ryzykowna zmiana idzie
   w izolowanej kopii terenu (worktree) — nietknięta znika sama, zdobyta jest scalana. Nie
   działa → **najpierw odtworzenie awarii komendą, potem zmiana**; poprawka bez odtworzonej
   awarii to zgadywanie i jest zakazana.
4. **Zazielenienie** — pozycja zielona wyłącznie ze świeżym dowodem, uruchomionym po ostatniej
   zmianie. Dwie zasady pomiaru, obie twarde:

   **Recenzent dostaje miarę, nie tylko regułę.** Do każdej reguły dołóż w zleceniu komendę albo
   narzędzie, którym się ją mierzy. Recenzent bez narzędzia zwróci opinię — i nie będzie po czym
   poznać, że to opinia.

   **Reguły niemierzalnej nie szacuje się.** Jednostka pisze `niemierzalne` i wraca. Opinia podana
   jako pomiar jest gorsza niż brak pomiaru: brak widać, opinia udaje liczbę.
5. **Zamknięcie przejazdu** — zapis stanu do `_operacja.md`, wiersz do `_dziennik.md`,
   **odświeżenie BMS-u pod ten sam adres** i commit. Jedna czynność, nie cztery: BMS zaległa
   o przejazd jest gorsza niż jej brak, bo Generał czyta ją jako aktualną.
6. **Log naruszeń** — każde naruszenie do `_dziennik.md` wg `szablon_dziennik.md`.
7. **Odbiór** — Generał dostaje SITREP wg `szablon_sitrep.md` i mówi, czy to jest to; stany
   klikane na BMS-ie porucznik odczytuje i przepisuje do `_operacja.md`. Następny przejazd albo
   meldunek końcowy. SITREP także na każde żądanie Generała w trakcie.

## Wewnątrz przejazdu rządzi sierżant

Zakaz pauz między zadaniami, próg pięciu rund poprawek z eskalacją. Gdy w sesji jest włączony
skill prowadzący przejazd jednostkami, sierżant oddaje mu pętlę — te dwie reguły obowiązują tak
samo i tank ich nie znosi.

„Do skutku" nie znaczy „bez końca": próg wyczerpany → decyzja do Generała; między przejazdami tę
samą rolę pełni KULMINACJA (`szablon_operacja.md` §2) — próg przekroczony → pauza operacyjna, nie
FRAGO. Nie znaczy „w głąb": pozycja zielona jest zamknięta — drążenie ponad cel to gubienie celu.

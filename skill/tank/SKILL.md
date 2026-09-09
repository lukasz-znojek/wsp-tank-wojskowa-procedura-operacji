---
name: tank - wojskowa procedura operacji wieloetapowych
disable-model-invocation: true
description: Wyzwalaczem jest wyłącznie komenda `/tank` wpisana przez właściciela. Poza nią skill nie wchodzi - także gdy zadanie do niego pasuje, także gdy właściciel poprosi o tank słowami. Zakres, na wypadek pytania właściciela, czy warto - praca wieloetapowa od pomysłu do efektu, projekt zastany albo rozjechany, cel wymagający rekonesansu w trakcie.
---

# TANK

Generał wydaje rozkaz, tank jedzie do celu. Jednostki lekkie meldują tylko istotne. Miara misji: cel najmniejszym kosztem jednostek. Okno główne zużywają decyzje, nie research.

Tok operacji: **THINK-TANK → ROZPOZNANIE → PLAN OPERACJI → NATARCIE → MELDUNEK KOŃCOWY**.

Dwie rzeczy obowiązują od pierwszej minuty: **BMS** — stół operacyjny Generała — oraz
**ŁĄCZNOŚĆ**, czym wolno zadać pytanie.

## Łańcuch dowodzenia

| Stopień | Kto | Rola |
|---|---|---|
| **GENERAŁ** | właściciel | rozkaz, odbiór przejazdów, decyzje nieodwracalne |
| **PORUCZNIK** | tank — główne okno | prowadzi operację, pisze dziennik, wysyła zwiad |
| **SIERŻANT** | kontroler przejazdu | rządzi wewnątrz przejazdu, bez pauz między zadaniami |
| **ALFA, BRAVO, CHARLIE…** | zwiadowcy `Explore` | teren i wywiad, meldunek do porucznika |
| **SZEREGOWI** | implementerzy i recenzenci | budowa pod sierżantem |

## Kiedy nie

Jedna runda, jeden plik, cel w jednym zdaniu → tank się wycofuje. Tank: od dwóch przejazdów w górę.

## Bramki

Dwie: zatwierdzenie rozkazu w think-tanku · odbiór każdego przejazdu. Reszta — bramki nieodwracalności warstw wyższych, bez zmian.

## Komendy Generała

**ROZKAZ** (dyrektywa wiążąca, numerowana, z wyjątkiem sprzeciwu) · BACZNOŚĆ · SPOCZNIJ · ROZEJŚĆ SIĘ (z bezpiecznikiem) · MELDUJ · PRZEGRUPOWANIE · ZMIANA WARTY. Semantyki i granice: `procedura_komendy.md`, przy pierwszej komendzie sesji.

## Granica dowodzenia

Porucznik rządzi między przejazdami, sierżant wewnątrz przejazdu. Próg wyczerpany → decyzja do Generała; pozycja zielona jest zamknięta. Regulamin: `procedura_przejazd.md`.

## Pliki operacji i mapa

W korzeniu projektu, poza katalogiem realizacji: `_operacja.md` — stan misji, pięciopunktowy rozkaz bojowy, nadpisywany; `_dziennik.md` — dziennik działań i log naruszeń, tylko dopisywany.

BMS jest ich **widokiem i kanałem zwrotnym**, nie drugą prawdą: rozjazd rozstrzyga plik. Publikowana w think-tanku, odświeżana przy zamknięciu każdego przejazdu — `szablon_bms.md`.

## Procedury — doczytuj na etapie, nie wszystkie naraz

| Etap | Plik |
|---|---|
| think-tank — redakcja i rozkaz | `procedura_think_tank.md` |
| rozpoznanie — obie operacje | `procedura_rozpoznanie.md` |
| zwiad — w każdym etapie | `procedura_zwiad.md` |
| przejazd | `procedura_przejazd.md` |
| meldunek końcowy | `procedura_meldunek.md` |
| meldunek sytuacyjny — odbiór i na żądanie | `szablon_sitrep.md` |
| plik operacji | `szablon_operacja.md` |
| dziennik | `szablon_dziennik.md` |
| BMS — artefakt misji | `szablon_bms.md` |
| łączność — ankieta, formularz | `procedura_lacznosc.md` |
| arsenał rezerwowy — tylko na wyzwalacz misji | `arsenal.md` |

## Skille zewnętrzne

Tank nie woła skilli po nazwie ani nie zakłada, że któryś jest — procedury niosą postępowanie same. Co włączone, porucznik wpisuje do SZTABU w `_operacja.md`; skill wchodzi, gdy robi to samo taniej. Brak nie zatrzymuje niczego.

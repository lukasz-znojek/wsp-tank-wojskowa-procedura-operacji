---
typ: procedura_tanka
rola: zwiad — dobór, wysyłka, kontrakt zwrotu, wznowienie
wersja: 3
data: 2026-09-09
---

# ZWIAD

Kryptonimy ALFA, BRAVO, CHARLIE… w kolejności wysyłki w przejeździe. Kryptonim to adres: podpis
faktu w dzienniku i wznowienie.

## Dobór

| Rola | Typ | Uwaga |
|---|---|---|
| zwiad | `Explore` | Edit, Write, NotebookEdit odjęte mechanicznie |
| analiza między przejazdami | `Plan` | te same narzędzia odjęte |

**Zwiadowca nie widzi warstwy 1.** `Explore` i `Plan` jako jedyne typy pomijają pliki CLAUDE.md wszystkich poziomów — z `~/.claude/CLAUDE.md` włącznie — oraz status gita sesji nadrzędnej; pamięci automatycznej okna głównego nie dostaje żadna jednostka poza forkiem. Każda reguła, która ma wiązać zwiadowcę, stoi w FRAGO (sub-agents.md, sekcja „What loads at startup", U-46).

Jeden zwiadowca na fakt, dwóch–czterech na porównanie. Granice harnessa (sub-agents.md, U-49):
20 jednostek współbieżnych, trzy warstwy zagnieżdżenia, `maxTurns` kończy jednostkę wynikiem
oznaczonym jako częściowy. Jednostka dziedziczy model sesji. Pojedyncze znane źródło z wartościami
dosłownymi → porucznik pobiera sam, inline; zwiad jest od eksploracji.

## FRAGO wysyłki — nagłówek plus pięć pól, wszystkie obowiązkowe

```
ZADANIE: [kryptonim] — [nazwa zadania]
POZYCJA BMS-u: [#, której służy]
PO CO: [dwa zdania ludzkim językiem: co robi i czemu misji służy]
KRYTERIUM: [czym poznamy, że odpowiedź jest dobra]
ZASIĘG: odczyt [LOKALNY/KONTYNENTALNY/GLOBALNY] · skutki [ŻADNE/LOKALNY/…]
```

Skala zasięgu: `szablon_operacja.md` §2. Zwiad ma skutki ŻADNE z konstrukcji.

Treść:

1. **PYTANIE** — jedno zdanie; odpowiedź ma być faktem, nie oceną.
2. **KORZEŃ I ZAKRES** — gdzie szukać, czego nie ruszać.
3. **CO JUŻ WIADOMO** — z dziennika, żeby nie szukał drugi raz.
4. **KONTRAKT ZWROTU** — jak niżej, dosłownie.
5. **NIE WOLNO** — wnioskować z braku trafień bez kontroli pozytywnej.

## Kontrakt zwrotu — cztery pola plus podpis

```
MELDUJĘ: [odpowiedź jednym zdaniem]
ZMIERZONE: [komendy albo źródła]
NIE USTALIŁEM: [korzeń · wzorzec · wykluczenia]
W ZANADRZU: [hasłowo, co ma, a czego nie meldował]
KRYPTONIM: [swój]
```

Cały zwrot poniżej ~2 000 **znaków** — tasiemiec w polu to złamanie kontraktu. Jednostka to znaki,
nie tokeny: wydawca liczy 1 000–2 000 tokenów (effective-context-engineering, U-30), tank ~2 000
znaków, ostrzej. Pomiar: kontrakt zbił trzy meldunki z 26 538 do 11 618 znaków (2,3x).

**Jednostka, która pisze plik wynikowy, zapisuje go przed meldunkiem**, a FRAGO nazywa ten plik
jako jej produkt. Dowód: limit sesji (HTTP 429) zabił BRAVO po zapisie pliku, przed meldunkiem
(2026-09-03) — plik ocalał, meldunek nie.

## Po meldunku

Szczegół porucznik dociąga **wznowieniem kryptonimu** — transkrypt zwiadowcy przeżywa w sesji
i wraca po `--resume` tej samej sesji; świeże okno go nie widzi (sub-agents.md, U-47). Do
`_dziennik.md` trafia tylko to, co ma przeżyć sesję. Zwiad zabił założenie planu → rozstrzyga
ZAMIAR z rozkazu.

---
typ: procedura_tanka
rola: etap ROZPOZNANIE — dwie rampy wejścia w teren
wersja: 1
data: 2026-08-21
---

# ROZPOZNANIE

Zwiad wg `procedura_zwiad.md`. Wynik obu operacji trafia do POŁOŻENIA w `_operacja.md`.

## Operacja nowa — teren pusty

Niewiadome na zewnątrz. Zwiad sprawdza założenia PRZED mapą etapów. Mapa nie stoi na niesprawdzonym.

## Operacja kryzysowa — teren zastany albo rozjechany

Zwiad czyta, tank dostaje mapę. Kolejność wiążąca:

1. **Przegrupowanie** — co działa dzisiaj: co · czym zmierzone · wynik. Bez „czym zmierzone" → do punktu 3.
2. **Ratowanie niedobitków** — informacje, pliki, researche, decyzje. Szczególnie jedyne kopie rzeczy otwartych w plikach wyglądających na zamknięte. Wynik: lista uratowanych z miejscem docelowym każdej.
3. **Czego nie ustalono** — korzeń, wzorzec, wykluczenia.
4. **Rekomendacja** z falsyfikatorem. **Bilans objętości.**

Po operacji kryzysowej wchodzi tor operacji nowej.

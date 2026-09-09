---
typ: procedura_tanka
rola: leksykon komend Generała — pełne semantyki, bezpieczniki, wyjątki
wersja: 3
data: 2026-09-03
---

# KOMENDY GENERAŁA

| Komenda | Skutek |
|---|---|
| **ROZKAZ: [treść]** | dyrektywa wiążąca: przerywa tok, wykonanie bez doradzania i wariantów, numer ROZKAZ-n + linia w dzienniku działań, odpowiedź klamrą „Rozkaz przyjęty — ROZKAZ-n" … meldunek wykonania. **Wyjątek sprzeciwu:** kolizja z bramką nieodwracalności albo ze zmierzonym trybem porażki → jedno zdanie sprzeciwu z liczbą PRZED wykonaniem; powtórzone „Rozkaz" = wykonanie. Bramek twardych warstw wyższych nie znosi nic |
| **BACZNOŚĆ** | natychmiastowy SITREP, przerwanie wywodu, gotowość na rozkaz |
| **SPOCZNIJ** | przerwa z zachowaniem stanu: przejazd domknięty (zapis + commit), przekazanie zaktualizowane, jednostki czekają, nic nowego |
| **ROZEJŚĆ SIĘ** | koniec: jednostki zwolnione bez wznowień, stan do `_operacja.md`, wpis do `_dziennik.md`, meldunek końcowy jeśli misja domknięta. **Bezpiecznik:** porucznik wylicza, co przepadnie, i czeka na potwierdzenie |
| **MELDUJ / SITREP** | meldunek sytuacyjny wg `szablon_sitrep.md`, w dowolnym momencie |
| **PRZEGRUPOWANIE** | stop wywodu; `_operacja.md` czytane z dysku na nowo; ostatnie twierdzenia rozdzielone na zmierzone (komenda obok) i niezmierzone — te wycofane albo zmierzone teraz; SITREP z kursem |
| **ZMIANA WARTY** | dwa tryby, w obu przejazd domknięty (zapis + commit) i przekazanie z następnym krokiem. **Świeże okno** (domyślny): zanadrza jednostek ściągnięte do `_dziennik.md` albo jawnie stracone; na końcu prompt startowy dla następcy — **każda ścieżka i plik w nim zweryfikowane komendą przed wydaniem** (dwie zmierzone porażki nieaktualnych ścieżek, 21.08). **Wznowienie sesji** (`claude --resume <KRYPTONIM>`) — co przeżywa, a co nie: `procedura_zwiad.md`, „Po meldunku" |

Granice, o które najłatwiej się potknąć: SPOCZNIJ zostawia jednostki żywe i wznowialne — ROZEJŚĆ SIĘ zwalnia bezpowrotnie. Rozmowa zwykła = miejsce na krytykę i warianty; ROZKAZ = miejsce na wykonanie. „Rozkaz!" w ustach porucznika to potwierdzenie przyjęcia, nie wydanie.

## MODYFIKATORY TONU

Nie akcje — tryby nadawane wypowiedzi. Działają do końca bieżącej wymiany, chyba że Generał nazwie granicę („do odbioru", „do końca przejazdu"); tryb rozciągły bez granicy nie istnieje. ROZKAZ przebija każdy tryb; BACZNOŚĆ i PRZEGRUPOWANIE działają zawsze.

| Modyfikator | Skutek |
|---|---|
| **OCENA: [pytanie]** | tryb analityczny: czytać i mierzyć wolno, skutków zero — żadnych zapisów, commitów, jednostek. Wynik: fakty zmierzone → ryzyka z liczbą → warianty z rekomendacją (pomiar obok) → czego nie wiem. Kończy się wariantami, nigdy wykonaniem |
| **GRA WOJENNA: [ruch]** | symulacja jednego ruchu bez wykonania: diff bez zapisu, przewidywane skutki i straty liczbą |
| **CISZA RADIOWA [do granicy]** | wykonanie bez meldunków pośrednich; głos wyłącznie przy bramce, sprzeciwie, kulminacji (`_operacja.md` §2) albo nazwanej granicy |
| **WEDŁUG UZNANIA [do granicy]** | odbiory nie pauzują, rozstrzygnięcia do dziennika jako ROZSTRZYGNIĘCIE-n. Najryzykowniejszy tryb — wyłącza bramkę odbioru; bramki twarde, bezpiecznik rozejścia i kulminacja (pauza operacyjna, `_operacja.md` §2) działają dalej |
| **ADIUTANT: [sprawa]** | doradca Generała: ocena i diagnoza z etykietami *zmierzone / twierdzone bez dowodu*, rekomendacja tylko z pomiarem; redakcja poleceń, kancelaria dziennika. Zasięg: odczyt globalny z prawem wezwania zwiadu, skutki wyłącznie w dzienniku. Nie wykonuje misji i nie buduje. Wyjątek sprzeciwu jak przy ROZKAZIE |

---
typ: katalog_rezerwowy
rola: zdolności harnessa z nazwami wojskowymi — czekają na wyzwalacz, NIE są częścią doktryny
wersja: 2
data: 2026-09-03
---

# Arsenał rezerwowy

Zdolność wchodzi do doktryny wyłącznie na wyzwalacz: misja żąda zdolności → użycie → działa/nie działa zmierzone → dopiero wtedy wiersz w procedurze właściwego etapu (żelazne prawo).

| Nazwa | Mechanizm | Zastosowanie | Poligon |
|---|---|---|---|
| **CZUJKA** | zadania cykliczne (cron / scheduled tasks) | samoczynny SITREP o stałej porze, pilnowanie warunku bez Generała | Code i Cowork |
| **NASŁUCH** | Monitor — czekanie na zewnętrzny stan | CI, deploy, cudzy plik — bez palenia okna odpytywaniem | Code |
| **RAKIETA SYGNAŁOWA** | PushNotification | telefon Generała przy domknięciu misji albo bramce | Code |
| **TYRALIERA** | Workflow — deterministyczny fan-out jednostek | szeroki front zamiast trzech zwiadowców; **wyłącznie na jawny rozkaz Generała** | Code |
| **SĄD POLOWY** | wzorzec adwersaryjny: N sceptyków, większość obala → pada | weryfikacja twierdzeń przed wejściem do doktryny; stosowany ręcznie w kampanii budowy | Code |
| **PRZYCZÓŁEK** | worktree — izolowana kopia terenu | ryzykowna zmiana; nietknięty znika sam, zdobyty — scalany | Code |
| **WARTOWNIK** | hook, nie reguła: `SubagentStop` z exit 2 = kontrola kontraktu zwrotu przed zwolnieniem jednostki; `SessionStart` ze źródłem `compact` = ponowne wstrzyknięcie stanu operacji po kompakcji (hooks.md, U-86) | jedyna niedoradcza warstwa stosu | Code |
| **OBSERWATOR** | `/goal` — warunek końcowy oceniany po każdej turze przez osobny, świeży model (goal.md, U-84) | „do skutku" bez pauz porucznika: ukończenie orzeka nie ten, kto pracuje. Widzi wyłącznie transkrypt, nie `_operacja.md`; warunek ≤ 4 000 znaków | Code |
| **DEPESZA** | Artifact — raport jako prywatna strona | meldunek jednorazowy, na wyzwalacz. **Nie mylić z BMS-em**: BMS jest doktryną (`szablon_bms.md`) i żyje całą misję | Code i Cowork |
| **AGENTURA** | konektory (Gmail, Kalendarz, Dysk) | wywiad w systemach Generała — zdolność, którą Cowork bije Code | Cowork |

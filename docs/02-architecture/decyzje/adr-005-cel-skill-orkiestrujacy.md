# ADR-005: Cel projektu — skill orkiestrujący, żargon wojskowy jako treść

## Status

Zaakceptowana.

## Kontekst

Cel projektu zmienił się decyzją właściciela 2026-09-09. ADR-001 przekładał
metaforykę wojskową obecną w materiałach źródłowych na neutralny język
procesowy: nazwy `przejazd`, `zwiad`, `think-tank`, `meldunek` i `komenda`
miały znaczenie ściśle procesowe i poza nim nie należało ich interpretować.
Ta decyzja rozstrzygała zakres wyłącznie symulacyjny i szkoleniowy — dokumentację
BMS, dla której żargon był formą opisu, nie treścią.

Nowy cel odwraca to rozstrzygnięcie. Repozytorium przechowuje, testuje i wydaje
skill Claude Code `tank`: skill prowadzący płynny workflow od najwcześniejszego
pomysłu do wdrożenia, w którym jedno główne okno orkiestruje agentów, a całość —
nazwy stopni, komend i etapów — jest w żargonie wojskowym. W tym celu żargon nie
jest przekładany na nic neutralnego; jest mechanizmem, przez który skill działa.

Dopóki ADR-001 stał jako „Zaakceptowana", każda zmiana treści na żargon wojskowy
była sprzeczna z własnym zapisem repozytorium. Ten ADR rozstrzyga sprzeczność
i jednocześnie ustanawia, jak repozytorium postępuje z decyzjami, które
znajdują się w takiej sprzeczności: ADR-a się nie kasuje, dopisuje się następny
ze statusem zastępującym. Uzasadnienie tej reguły jest częścią tej decyzji, nie
cudzego dokumentu: usunięta decyzja nie daje się zaudytować — czytelnik nie
odtworzyłby ani na jakiej podstawie zmiana zapadła, ani czego dokładnie
dotyczyła decyzja, którą zastąpiono. ADR-001 zostaje więc w drzewie ze
zmienionym statusem (Krok 3 tego zadania), a nie znika.

## Decyzja

Cel projektu to skill orkiestrujący. Z decyzji wynikają cztery reguły wiążące,
zastępujące reguły ADR-001:

1. Żargon wojskowy jest **treścią** skilla, nie ozdobą — nazwy stopni, komend
   i etapów mają znaczenie wykonawcze zdefiniowane w plikach skilla.
2. Źródłem prawdy są 13 plików w `skill/tank/`. Dokumentacja w `docs/` opisuje
   je i testuje; przy rozjeździe rozstrzyga plik skilla.
3. Skill pozostaje samodzielny: zero przywołań skilli zewnętrznych. Kontrola
   maszynowa w `scripts/validate_skill.sh` (zadanie 3).
4. Warstwa BMS — kontrakty JSON, przykłady, architektura pojęciowa — odchodzi
   do historii repozytorium (zadanie 4). Brak kontraktów danych jest stanem
   docelowym, nie zaległością.

## Konsekwencje

### Skutki pozytywne

- Repozytorium przestaje twierdzić dwie sprzeczne rzeczy naraz: cel dokumentu
  i cel skilla są od tego ADR-a tą samą rzeczą.
- Reguła 2 rozstrzyga rozjazd raz, na poziomie zasady: przy niezgodności między
  opisem w `docs/` a plikiem skilla wygrywa plik skilla, bez negocjacji przy
  każdej kolejnej rozbieżności.
- Reguła 3 ma kontrolę maszynową od zadania 3, więc samodzielność skilla nie
  jest już wyłącznie zapisem.
- Repozytorium zwęża się do materiału, który skill faktycznie wykonuje —
  duplikat w `docs/03-procedures` przestaje być drugą, rozjeżdżającą się
  wersją tych samych plików.

### Koszty

- Przykłady i kontrakty BMS przestają istnieć w drzewie roboczym i są
  odtwarzalne wyłącznie z historii git.
- Dokumentacja produktowa i architektoniczna zbudowana pod cel BMS traci
  aktualność i wymaga przepisania albo archiwizacji w kolejnych zadaniach —
  do tego czasu repozytorium niesie dokumenty opisujące porzucony cel.
- ADR-001 zostaje w drzewie jako zapis stanu, który już nie obowiązuje;
  czytelnik nieświadomy tego ADR-a może przez chwilę czytać nieaktualną
  decyzję jako aktualną.
- Reguła 1 jest odwrotnością reguły przyjętej w ADR-001 bez okresu przejściowego:
  nie ma dokumentu pośredniego, który tłumaczyłby jedno na drugie.

## Zastępuje

[ADR-001](adr-001-zakres-symulacyjny.md).

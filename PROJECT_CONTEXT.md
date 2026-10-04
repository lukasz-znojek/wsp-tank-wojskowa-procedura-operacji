# Kontekst projektu

## Cel

do ustalenia. ogolnie stworzenie skilla dla prowadzenia procesu w jednym oknie z wykorzystanie mocnego modelu jak opus lub fable z orkiestracja subagentow w moneklaturze i reżimie wojskowym.

## Zakres

### W zakresie

- Procedury dowodzenia, łączności, meldowania, przejazdu, rozpoznania, zwiadu i analizy.
- Szablony planu operacji, wpisu BMS, dziennika operacyjnego oraz SITREP.
- Model pojęciowy BMS, role, przepływy informacji i kontrakty danych.
- Fikcyjne scenariusze oraz kontrola spójności dokumentacji.

### Poza zakresem

- Integracja z rzeczywistymi systemami, urządzeniami lub sieciami.
- Użycie danych operacyjnych, osobowych, geolokalizacyjnych lub innych danych wrażliwych.
- Instrukcje przeznaczone do prowadzenia rzeczywistych działań.

## Stan bieżący

- Repozytorium jest w fazie specyfikacji.
- Zidentyfikowano zestaw procedur oraz szablonów jako materiał wejściowy.
- Trwa przenoszenie materiałów do spójnej struktury dokumentacji.
- Kolejny etap: uzupełnić wymagania produktu, uzgodnić model danych i opracować demonstrator.

## Zasady robocze

- Procedura opisuje przebieg działania; szablon opisuje format zapisu; przykład pokazuje fikcyjne użycie.
- Zmiana procedury wymaga sprawdzenia powiązanych szablonów, przykładów i schematów.
- Decyzje mające wpływ na architekturę, zakres lub format danych trafiają do ADR.
- Niejednoznaczności są zapisywane jako otwarte pytania, a nie maskowane założeniami.

## Otwarte pytania

- Jaki będzie pierwszy interfejs demonstratora: aplikacja webowa, narzędzie terminalowe czy zestaw agentów?
- Które artefakty muszą mieć od początku walidację maszynową?
- Jakie role uczestników należy uwzględnić w pierwszej wersji modelu uprawnień?
- Kto zatwierdza zmianę procedury przed jej publikacją jako stabilnej?

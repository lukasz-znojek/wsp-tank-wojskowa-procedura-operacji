# Cel i zakres

## Cel projektu

Repozytorium przechowuje, testuje i wydaje skill Claude Code `tank`: skill
prowadzący płynny workflow od najwcześniejszego pomysłu do wdrożenia, w którym
jedno główne okno orkiestruje agentów, a całość — nazwy stopni, komend
i etapów — jest w żargonie wojskowym.

Cel jest osiągnięty, gdy spełnione są trzy warunki naraz: skill instaluje się
i wchodzi na komendę `/tank` w świeżym oknie; repozytorium w `~/dev` trzyma
jego pliki pod kontrolą wersji z walidatorem, który przechodzi lokalnie i w CI;
dokumentacja repozytorium opisuje ten cel, a nie poprzedni.

## Zakres włączony

| Obszar | Co obejmuje |
| --- | --- |
| Pliki skilla | 13 plików w [`skill/tank/`](../../../skill/tank/): `SKILL.md`, procedury, szablony i arsenał komend. Źródło prawdy o znaczeniu wykonawczym żargonu — patrz [ADR-005](../02-architecture/decyzje/adr-005-cel-skill-orkiestrujacy.md) |
| Walidatory | [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py), [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh) oraz walidator samodzielności skilla z zadania 3 |
| Governance | klasyfikacja informacji, polityka wersjonowania, polityka zmian — [`docs/06-governance/`](../06-governance/README.md) |
| Decyzje | zapisy ADR w [`docs/02-architecture/decyzje/`](../02-architecture/decyzje/) dla zmian celu, zakresu i architektury repozytorium |

## Zakres wyłączony

| Obszar | Dlaczego poza zakresem |
| --- | --- |
| Kontrakty danych BMS | Warstwa BMS odchodzi do historii repozytorium — reguła 4 [ADR-005](../02-architecture/decyzje/adr-005-cel-skill-orkiestrujacy.md). Brak kontraktów danych jest stanem docelowym, nie zaległością. |
| Przykłady | Pokazywały użycie kontraktów danych BMS; bez kontraktów tracą przedmiot. |
| Architektura pojęciowa | Model danych, model stanów i przepływy informacji opisywały porzucony cel symulacyjny, nie skill. |
| Integracje z rzeczywistymi systemami | Skill działa wewnątrz Claude Code i nie przyjmuje danych z zewnętrznych systemów; kontrakty, które mogłyby taką integrację przenosić, nie istnieją w tym zakresie. |

## Granice interpretacyjne

**Czym ta dokumentacja jest:** opisem repozytorium, które przechowuje, opisuje
i testuje skill `tank`. Mówi, które 13 plików są źródłem prawdy, jak je
waliduje maszyna i jakie decyzje architektoniczne obowiązują.

**Czym nie jest:** symulacyjnym środowiskiem zarządzania stanem scenariusza ani
materiałem, w którym żargon wojskowy jest formą opisu neutralnej treści. Ta
rola należała do ADR-001 i skończyła się wraz z jego zastąpieniem.

**Jak czytać żargon wojskowy.** Zgodnie z regułą 1 [ADR-005](../02-architecture/decyzje/adr-005-cel-skill-orkiestrujacy.md)
nazwy stopni, komend i etapów użyte w plikach skilla są jego treścią
wykonawczą, nie ozdobą stylistyczną — mają znaczenie zdefiniowane wprost
w plikach [`skill/tank/`](../../../skill/tank/).

**Rozstrzyganie rozbieżności.** Przy rozjeździe między opisem w `docs/`
a plikiem skilla rozstrzyga plik skilla — reguła 2 ADR-005. Dokumentacja
opisuje skill i testuje go; nie zastępuje go jako źródła prawdy.

## Powiązane dokumenty

- [ADR-005: cel projektu — skill orkiestrujący](../02-architecture/decyzje/adr-005-cel-skill-orkiestrujacy.md)
- [ADR-001: zakres wyłącznie symulacyjny i szkoleniowy](../02-architecture/decyzje/adr-001-zakres-symulacyjny.md) — zastąpiona, zapis stanu poprzedniego
- [polityka wersjonowania](../06-governance/polityka-wersjonowania.md)

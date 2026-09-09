# Model danych

Model opisuje cztery typy artefaktów danych występujące w fikcyjnych scenariuszach szkoleniowych. Każdy typ ma szablon dla człowieka i kontrakt danych dla maszyny; rozjazd między nimi jest defektem.

## Typy artefaktów

| Typ | Przeznaczenie | Szablon | Kontrakt danych |
| --- | --- | --- | --- |
| Plan operacji | niesie stan scenariusza: cel, mapę etapów, progi, zależności | [plan-operacji.md](../04-templates/plan-operacji.md) | [`operation.schema.json`](../../schemas/operation.schema.json) |
| Wpis BMS | rejestruje pojedyncze zdarzenie w widoku stanu, wraz z oceną pewności | [wpis-bms.md](../04-templates/wpis-bms.md) | [`bms-event.schema.json`](../../schemas/bms-event.schema.json) |
| Komunikat | zapisuje pojedynczą wymianę informacji między rolami | [komunikat.md](../04-templates/komunikat.md) | [`message.schema.json`](../../schemas/message.schema.json) |
| SITREP | raportuje stan scenariusza przyrostowo, z rozdziałem faktów i hipotez | [sitrep.md](../04-templates/sitrep.md) | [`sitrep.schema.json`](../../schemas/sitrep.schema.json) |

Dziennik operacyjny nie jest osobnym typem danych: jest rejestrem wpisów i zdarzeń, a jego format opisuje [szablon dziennika](../04-templates/dziennik-operacyjny.md).

## Plan operacji

**Przeznaczenie:** jedyne miejsce, w którym stan scenariusza jest prawdą. Plan jest nadpisywany; historia zdarzeń należy do dziennika.

**Pola kluczowe:** identyfikator, nazwa syntetyczna, status, właściciel, wersja, cel scenariusza, etapy, kryteria ukończenia, ryzyka, powiązane artefakty.

**Pola obowiązkowe w kontrakcie:** `id`, `synthetic`, `title`, `status`, `version`, `scenario_goal`, `stages`.

**Relacje:** jest nadrzędny wobec wpisów BMS, komunikatów i raportów SITREP, które odwołują się do jego identyfikatora.

## Wpis BMS

**Przeznaczenie:** jedno zdarzenie odnotowane w widoku stanu — obserwacja, zadanie, rozstrzygnięcie, zmiana statusu albo adnotacja.

**Pola kluczowe:** identyfikator, tytuł, status, autor, czas utworzenia, czas zdarzenia jako etykieta względna, typ, priorytet, poziom pewności, opis, źródła, powiązania, potwierdzenie odbioru.

**Pola obowiązkowe w kontrakcie:** `id`, `synthetic`, `title`, `status`, `event_type`, `confidence`, `description`.

**Relacje:** wskazuje plan operacji albo pozycję jego mapy; może wskazywać komunikat jako źródło.

## Komunikat

**Przeznaczenie:** pojedyncza wymiana informacji między rolami w scenariuszu.

**Pola kluczowe:** identyfikator, status, nadawca, odbiorca, czas jako etykieta względna, kanał, temat, treść, poziom pewności, potwierdzenie odbioru, powiązania.

**Pola obowiązkowe w kontrakcie:** `id`, `synthetic`, `status`, `sender_role`, `recipient_role`, `subject`, `body`.

**Relacje:** wskazuje plan operacji; jest wskazywany przez SITREP jako źródło twierdzenia.

## SITREP

**Przeznaczenie:** raport stanu w trakcie scenariusza, przyrostowy od poprzedniego raportu. Sumy całego scenariusza niesie wyłącznie raport końcowy w planie operacji.

**Pola kluczowe:** identyfikator, status, identyfikator planu, okres raportowania, autor, podsumowanie, informacje potwierdzone ze źródłem, hipotezy z poziomem pewności i falsyfikatorem, luki, działania następcze, źródła.

**Pola obowiązkowe w kontrakcie:** `id`, `synthetic`, `status`, `operation_id`, `reporting_period_label`, `summary`.

**Relacje:** wskazuje plan operacji oraz artefakty źródłowe swoich twierdzeń.

## Tabela relacji

| Artefakt źródłowy | Relacja | Artefakt docelowy | Obowiązkowość |
| --- | --- | --- | --- |
| Wpis BMS | należy do | Plan operacji | obowiązkowa, gdy wpis dotyczy pozycji planu |
| Komunikat | należy do | Plan operacji | obowiązkowa |
| SITREP | raportuje | Plan operacji | obowiązkowa, pole `operation_id` |
| SITREP | powołuje się na | Komunikat, Wpis BMS | obowiązkowa dla każdego twierdzenia potwierdzonego |
| Wpis BMS | powołuje się na | Komunikat | opcjonalna |
| Plan operacji | wskazuje | Wpis BMS, Komunikat, SITREP | opcjonalna, pole powiązanych artefaktów |

Zasada z wymagania `WF-5`: artefakt wskazuje co najmniej jeden powiązany identyfikator, gdy relacja istnieje. Relacja istniejąca a niewskazana jest luką do odnotowania, nie stanem dopuszczalnym.

## Wspólne pola każdego artefaktu

| Pole | Ograniczenie |
| --- | --- |
| identyfikator | wzorzec `^[A-Z0-9-]+$`; wąski celowo, nie przyjmie ścieżki, adresu ani nazwy osoby |
| oznaczenie danych syntetycznych | pole `synthetic` wymagane, wartość `true`; artefakt bez niego nie przechodzi kontroli |
| status | pięciowartościowy słownik z [modelu stanów](model-stanow.md) |
| rola | oznaczenie syntetyczne wg wzorca `^[A-Za-z0-9-]+$`, np. `Analityk-01` |
| czas zdarzenia | etykieta względna `^T\+[0-9]{2}:[0-9]{2}$`, nigdy czas rzeczywisty |
| punkt odniesienia | `^Punkt-[A-Z0-9]+$`, punkt abstrakcyjny |

## Czego kontrakty nie zawierają

Schematy **nie mają** pól przyjmujących współrzędne geograficzne, dane osobowe ani dane operacyjne. Nie jest to przeoczenie: projekt służy wyłącznie pracy na danych syntetycznych, a pole, które takie dane przyjmuje, wcześniej czy później je przyjmie.

Z tego samego powodu czas zdarzenia jest etykietą względną, a nie znacznikiem czasu, a miejsce jest punktem abstrakcyjnym, a nie lokalizacją. Ograniczenie jest wymuszone wzorcem w kontrakcie, więc działa jako blokada techniczna, nie jako zapis.

Zakres wyłączony: [cel i zakres](../00-overview/cel-i-zakres.md). Decyzja: [ADR-001](decyzje/adr-001-zakres-symulacyjny.md).

## Odwzorowanie na kontrakty danych

Nazwy plików kontraktów pochodzą z pierwszej wersji struktury i różnią się od nazw szablonów. Odwzorowanie jest jednoznaczne i podane w tabeli typów artefaktów wyżej. Zmiana nazw kontraktów wymagałaby aktualizacji wszystkich odnośników i nie wnosi wartości, dlatego nazwy pozostają.

Wszystkie cztery kontrakty są w wersji JSON Schema Draft 2020-12, mają `additionalProperties: false` i przechodzą kontrolę [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py). Status kontraktów jako decyzja: [ADR-003](decyzje/adr-003-json-schema.md).

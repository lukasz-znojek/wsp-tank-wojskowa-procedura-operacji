# Zarządzanie dokumentacją

Katalog opisuje, co wolno umieszczać w repozytorium, jak wersjonować dokumenty i schematy oraz w jakim trybie zmienia się procedurę.

## Zawartość katalogu

| Plik | Rola |
| --- | --- |
| [klasyfikacja-informacji.md](klasyfikacja-informacji.md) | materiały dopuszczone i niedopuszczone, oznaczanie danych syntetycznych, postępowanie po wykryciu naruszenia |
| [polityka-wersjonowania.md](polityka-wersjonowania.md) | wersjonowanie dokumentów i schematów, zgodność wstecz, tryb wycofania |
| [polityka-zmian-procedur.md](polityka-zmian-procedur.md) | tryb zmiany, obowiązkowa ocena wpływu, zatwierdzanie, zmiana awaryjna |

## Kolejność czytania

1. [klasyfikacja-informacji.md](klasyfikacja-informacji.md) — najpierw, bo rozstrzyga, co w ogóle może wejść do repozytorium.
2. [polityka-wersjonowania.md](polityka-wersjonowania.md) — jak oznaczać zmiany dokumentów i kontraktów danych.
3. [polityka-zmian-procedur.md](polityka-zmian-procedur.md) — jak przeprowadzić zmianę i co ocenić przed jej przyjęciem.

## Granica egzekwowania

Dokumenty w tym katalogu są **zapisem, nie blokadą techniczną**. Jedyną blokadą są walidatory i automatyczna walidacja: [`scripts/validate_schemas.py`](../../scripts/validate_schemas.py), [`scripts/validate_markdown.sh`](../../scripts/validate_markdown.sh), [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml). Reguła, która ma naprawdę obowiązywać, musi trafić do walidatora albo do kontraktu danych.

## Cel zmiany

<!-- Jedno–dwa zdania: jaki problem rozwiązuje ten pull request. -->

## Zmienione artefakty

<!-- Wypisz pliki i katalogi. Zaznacz, czy zmiana dotyczy procedury, szablonu, przykładu, schematu czy architektury. -->

- [ ] procedura (`docs/03-procedures/`)
- [ ] szablon (`docs/04-templates/`)
- [ ] przykład (`examples/`)
- [ ] schemat (`schemas/`)
- [ ] architektura lub ADR (`docs/02-architecture/`)
- [ ] dokument główny lub governance

## Ocena wpływu

| Obszar | Czy dotyczy | Uzasadnienie |
| --- | --- | --- |
| Szablony |  |  |
| Przykłady |  |  |
| Schematy |  |  |
| ADR-y |  |  |

## Walidacja

```bash
python3 scripts/validate_schemas.py
bash scripts/validate_markdown.sh
```

- [ ] `validate_schemas.py` przechodzi
- [ ] `validate_markdown.sh` przechodzi
- [ ] odnośniki Markdown działają

## Zgodność z zakresem

- [ ] Zmiana nie wprowadza treści przeznaczonej do zastosowania w rzeczywistych działaniach.
- [ ] Nie dodano danych osobowych, rzeczywistych lokalizacji, identyfikatorów jednostek, harmonogramów ani stanów zasobów.
- [ ] Nie dodano sekretów, tokenów, haseł ani certyfikatów.
- [ ] Nowe przykłady są wyraźnie oznaczone jako syntetyczne.

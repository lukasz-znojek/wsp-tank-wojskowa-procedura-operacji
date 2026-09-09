# skill/

Ten katalog przechowuje pod kontrolą wersji skill Claude Code `tank` —
13 plików w [`tank/`](tank/): `SKILL.md`, procedury, szablony i arsenał komend.

## Instalacja

Komendę uruchamiasz z katalogu głównego repozytorium, a nie z katalogu `skill/`:

```bash
cp -R skill/tank ~/.claude/skills/tank
```

Kopia instalowana w `~/.claude/skills/tank` jest pochodną. Źródłem prawdy
jest ten katalog (`skill/tank/`) — zmiany wprowadza się tutaj i stąd
kopiuje się je do instalacji, nigdy odwrotnie.

## Uruchomienie

Skill ma w `SKILL.md` pole `disable-model-invocation: true`, więc wchodzi
wyłącznie na wprost wpisaną komendę `/tank` — model nie uruchomi go sam,
nawet gdy zadanie do niego pasuje.

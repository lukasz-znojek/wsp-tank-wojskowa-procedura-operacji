# Integracje

## Stan obecny

**Na tym etapie projekt nie ma integracji produkcyjnych. Jest to decyzja projektowa, nie zaległość.**

Nie istnieje żadne połączenie z systemem zewnętrznym: nie ma odczytu z systemów, zapisu do systemów, wymiany danych ani uwierzytelniania wobec czegokolwiek poza samym repozytorium. Jedynym mechanizmem uruchamianym automatycznie jest walidacja dokumentacji w [`.github/workflows/validate-docs.yml`](../../.github/workflows/validate-docs.yml), która działa lokalnie na zawartości repozytorium, bez sieci i bez poświadczeń.

Uzasadnienie decyzji: [ADR-001](decyzje/adr-001-zakres-symulacyjny.md). Zakres wyłączony: [cel i zakres](../00-overview/cel-i-zakres.md).

## Zasady dla przyszłych integracji

Gdyby integracja miała powstać, musi spełnić wszystkie poniższe warunki. Warunek niespełniony jest przeszkodą, nie ryzykiem do przyjęcia.

| # | Warunek | Dlaczego |
| --- | --- | --- |
| 1 | Osobny ADR opisujący integrację, zatwierdzony przed rozpoczęciem pracy | zmiana zakresu i kontraktu danych wymaga ADR — [polityka zmian procedur](../06-governance/polityka-zmian-procedur.md) |
| 2 | Ocena danych wejściowych: co dokładnie wchodzi, w jakim formacie, z jakim ograniczeniem | integracja przyjmująca dane nieopisane przyjmie także dane niedopuszczone |
| 3 | Testy wyłącznie na danych syntetycznych | dane rzeczywiste w testach są danymi rzeczywistymi w repozytorium |
| 4 | Kontrakt danych rozszerzony jawnie, z oceną zgodności wstecz | [polityka wersjonowania](../06-governance/polityka-wersjonowania.md) |
| 5 | Mechanizm odrzucania danych niezgodnych z kontraktem, po stronie wejścia | `additionalProperties: false` chroni tylko to, co przez kontrakt przechodzi |
| 6 | Opis, jak integrację wyłączyć i jak cofnąć jej skutki | wymóg kolumny „jak cofnąć" dla operacji nieodwracalnych — [szablon planu operacji](../04-templates/plan-operacji.md) |

## Zakaz danych rzeczywistych

Integracja nie może korzystać z danych rzeczywistych: danych osobowych, lokalizacji, współrzędnych, identyfikatorów podmiotów, stanów zasobów, harmonogramów ani danych operacyjnych. Zakaz obowiązuje także w środowisku testowym i w danych pomocniczych.

Konsekwencja praktyczna: integracja z systemem, którego danych nie da się zastąpić danymi syntetycznymi, jest poza zakresem tego projektu — niezależnie od tego, jak wygodna byłaby technicznie.

## Zakaz przechowywania sekretów

Repozytorium nie przechowuje kluczy, tokenów, haseł, certyfikatów ani plików konfiguracyjnych zawierających poświadczenia. Zakaz jest bezwarunkowy i obejmuje pliki przykładowe oraz zakomentowany kod.

Automatyczna walidacja jest skonfigurowana tak, by nie potrzebowała żadnego sekretu: uprawnienia ograniczone do odczytu zawartości, brak dostępu do sieci w skryptach, brak zmiennych środowiskowych z poświadczeniami. Integracja wymagająca sekretu musi go trzymać poza repozytorium, a ADR z warunku 1 musi wskazać, gdzie i kto ma do niego dostęp.

Tryb postępowania po wykryciu sekretu w repozytorium: [klasyfikacja informacji](../06-governance/klasyfikacja-informacji.md) oraz [`SECURITY.md`](../../SECURITY.md).

## Mechanizmy dostępne, ale nieopisane w procedurach

[Katalog zdolności rezerwowych](../05-reference/arsenal.md) wymienia mechanizmy techniczne, które nie weszły do żadnej procedury. Jedna z jego pozycji — konektory do systemów zewnętrznych — jest **poza zakresem tego projektu** i została tam wpisana wyłącznie dla kompletności katalogu. Powołanie się na nią jako na dostępną zdolność jest błędem.

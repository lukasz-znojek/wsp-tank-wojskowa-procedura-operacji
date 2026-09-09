# Procedura: zwiad

> Procedura ma charakter wyłącznie symulacyjny i szkoleniowy. Opisuje porządkowanie, rejestrowanie, ocenę pewności informacji, zatwierdzanie i raportowanie fikcyjnych artefaktów dokumentowych. Nie jest instrukcją do rzeczywistych działań.

## Cel

Uzyskać jeden fakt albo jedno porównanie w formie zwrotu o ograniczonej objętości, bez obciążania głównego toku pracy materiałem pośrednim. Zwiad odpowiada na pytanie; nie rozstrzyga i nie buduje.

## Zakres

Stosuje się w każdym etapie scenariusza, gdy niewiadoma blokuje rozstrzygnięcie albo gdy przejrzenie materiału źródłowego zajęłoby w głównym toku więcej miejsca niż sam wynik.

**Kiedy się nie stosuje:** gdy istnieje jedno znane źródło z wartościami dosłownymi. Wtedy autor prowadzący pobiera je sam, bez zlecania zadania. Zwiad jest od przeszukiwania, nie od odczytu.

## Role

| Rola | Udział |
| --- | --- |
| Autor prowadzący | formułuje zlecenie, nadaje oznaczenie, przyjmuje zwrot, decyduje co wchodzi do dziennika |
| Analityk | wykonuje zadanie i odpowiada zwrotem wg kontraktu |
| Recenzent | ocenia zwrot wobec kryterium ze zlecenia, gdy zadanie służy zaliczeniu pozycji |

## Dane wejściowe

- Pytanie w jednej linii, na które odpowiedzią ma być fakt, nie ocena.
- Pozycja mapy etapów, której zadanie służy.
- Zakres materiału: gdzie szukać i czego nie ruszać.
- Stan wiedzy z dziennika operacyjnego — żeby analityk nie szukał drugi raz tego samego.

## Kroki

1. **Dobór zadania.** Zadanie analityczne ma odjęte możliwości zapisu — analityk czyta i mierzy, nie zmienia dokumentów. Jeden analityk na jeden fakt; od dwóch do czterech, gdy zadaniem jest porównanie.

2. **Nadanie oznaczenia.** Oznaczenia syntetyczne w kolejności zlecania w etapie: `Analityk-01`, `Analityk-02`, `Analityk-03`. Oznaczenie jest adresem: podpisuje fakt w dzienniku i pozwala wrócić do zadania po szczegół.

3. **Zlecenie.** Nagłówek plus pięć pól, wszystkie obowiązkowe:

   ```
   ZADANIE: [oznaczenie] — [nazwa zadania]
   POZYCJA MAPY: [numer pozycji, której służy]
   PO CO: [dwa zdania: co robi i czemu w scenariuszu służy]
   KRYTERIUM: [czym poznamy, że odpowiedź jest dobra]
   ZASIĘG: odczyt [wskazany zakres] · skutki [żadne]
   ```

   Treść zlecenia w pięciu punktach:

   1. **Pytanie** — jedno zdanie; odpowiedzią ma być fakt.
   2. **Korzeń i zakres** — gdzie szukać, czego nie ruszać.
   3. **Co już wiadomo** — z dziennika, żeby nie powtarzać pracy.
   4. **Kontrakt zwrotu** — przepisany dosłownie, patrz krok 4.
   5. **Czego nie wolno** — w szczególności: wnioskować z braku trafień bez wykonania kontroli pozytywnej.

   Zadanie analityczne nie widzi kontekstu głównego toku pracy: każda reguła, która ma je wiązać, musi stać w zleceniu. Reguła zapisana wyłącznie poza zleceniem do analityka nie dotrze.

4. **Kontrakt zwrotu.** Cztery pola plus podpis:

   ```
   USTALIŁEM: [odpowiedź jednym zdaniem]
   ZMIERZONE: [polecenia albo wskazane źródła]
   NIE USTALIŁEM: [korzeń · wzorzec · wykluczenia]
   W ZANADRZU: [hasłowo, co ma, a czego nie zameldował]
   OZNACZENIE: [swoje]
   ```

   Cały zwrot poniżej **2 000 znaków**. Rozwlekłość w polu jest złamaniem kontraktu, nie stylem. Limit dotyczy znaków, nie innej jednostki, i jest ostrzejszy niż typowy limit zwrotu zadania analitycznego — celowo.

5. **Zapis produktu przed zwrotem.** Analityk, który wytwarza dokument, **zapisuje go przed zameldowaniem**, a zlecenie nazywa ten dokument jako jego produkt. Zadanie przerwane po zapisie zostawia dokument; przerwane przed zapisem nie zostawia nic.

6. **Przyjęcie zwrotu.** Autor prowadzący przenosi do dziennika operacyjnego wyłącznie to, co ma przetrwać poza bieżącą sesję pracy. Szczegół dociąga wracając do zadania po oznaczeniu, nie przez powtórzenie zlecenia.

## Punkty decyzyjne

| Sytuacja | Kryterium | Rozstrzygnięcie | Kto rozstrzyga |
| --- | --- | --- | --- |
| Fakt czy porównanie | liczba wariantów do zestawienia | jeden fakt → jedno zadanie; porównanie → od dwóch do czterech | autor prowadzący |
| Zwiad czy odczyt własny | istnieje jedno znane źródło z wartościami dosłownymi | tak → odczyt własny, bez zadania | autor prowadzący |
| Zwrot przekroczył limit objętości | liczba znaków zwrotu | zwrot odrzucony, zadanie powtórzone z węższym pytaniem | autor prowadzący |
| Zwrot bez pola „zmierzone" | pole puste albo zawiera ocenę | zwrot nie jest ustaleniem; wchodzi do „czego nie ustalono" | autor prowadzący |
| Zwrot oznaczony jako częściowy | zadanie zakończone limitem, nie odpowiedzią | traktuj jak brak; zleć zadanie węższe | autor prowadzący |
| Zwiad unieważnił założenie planu | zakres skutku wobec zamiaru z planu | rozstrzyga zamiar zapisany w planie operacji | autor prowadzący |
| Co wchodzi do dziennika | czy fakt ma przetrwać poza sesję | tak → wpis do dziennika; nie → zostaje w zadaniu | autor prowadzący |

## Dane wyjściowe

- Zwrot wg kontraktu, poniżej 2 000 znaków, podpisany oznaczeniem.
- Wpis w dzienniku operacyjnym: zlecenie i powrót zadania, z oznaczeniem.
- Dokument wynikowy, jeśli zlecenie go nazwało jako produkt.
- Pozycje nieustalone dopisane do Położenia w planie operacji.

## Wyjątki

- **Analityk nie ustalił nic.** To wynik, nie porażka: pole „nie ustaliłem" wypełnione trzema kategoriami jest kompletnym zwrotem.
- **Reguła jest niemierzalna.** Analityk pisze `niemierzalne` i wraca. Ocena podana jako pomiar jest gorsza niż brak pomiaru: brak widać, ocena udaje liczbę.
- **Zadanie zakończyło się limitem.** Wynik jest częściowy z definicji i musi być tak oznaczony.
- **Materiał w zakresie wyłączonym wszedł do zadania przypadkowo.** Zamelduj to i powtórz zadanie od nowa, bez tego materiału.
- **Ten sam fakt trzeba ustalić ponownie.** Najpierw sprawdź dziennik operacyjny i zadania już wykonane. Powtórzone zlecenie tego samego pytania jest kosztem bez rezultatu.

## Powiązane artefakty

- Procedury: [rozpoznanie](rozpoznanie.md), [przejazd](przejazd.md), [think-tank](think-tank.md), [meldunek](meldunek.md)
- Szablony: [dziennik operacyjny](../04-templates/dziennik-operacyjny.md), [plan operacji](../04-templates/plan-operacji.md)
- Referencje: [katalog zdolności rezerwowych](../05-reference/arsenal.md)

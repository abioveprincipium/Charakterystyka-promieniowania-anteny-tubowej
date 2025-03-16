# Charakterystyka promieniowania anteny tubowej

## Wprowadzenie

Skrypt **charakterystyka.m** służy do realizacji charakterystyki promieniowania anteny tubowej operującej w paśmie 10 GHz. Jego celem jest wyznaczenie teoretycznego rozkładu pola promieniowania. Skrypt nie ocenia poprawności działania anteny w praktyce, a jedynie generuje wykresy i wyniki analityczne, które pozwalają na analizę kształtu wiązki promieniowania.


## Instrukcje środowiska (MATLAB)
Aby uruchomić projekt w MATLAB:
1. Upewnij się, że masz zainstalowanego MATLABa (wersja R2018b lub nowsza).
2. Skopiuj wszystkie pliki projektu do jednego folderu.
3. Uruchom MATLABa i ustaw folder projektu jako bieżący katalog roboczy.
4. Uruchom skrypt
 
Po uruchomieniu skryptu, MATLAB wygeneruje wykresy charakteryzujące promieniowanie anteny tubowej.

## Opis pliku
**Charakterystyka.m**:

Skrypt oblicza i wizualizuje charakterystykę promieniowania anteny tubowej. Wyniki są prezentowane w formie wykresów, gdzie:
- **Oś pozioma – kąt θ [°]** kąt obserwacji  względem głównej osi anteny
- **Oś pionowa –  E/E_max [dB]** wartość promieniowania w dB

## Parametry konfiguracyjne
W skrypcie można dopasować następujące parametry:
- **f** - częstotliwość pracy anteny (domyślnie 10 GHz).
- **Aperture Dimensions** ( *A*, *B*, *Ra*, *Rb* ) – wymiary apertury anteny tubowej, np. szerokość i wysokość (podane w metrach, zgodnie ze schematem - plik Wilmer X 1857.png i instrukcją w pliku charakterystyka.m).
- **theta** – zakres kątów, dla których wyznaczana jest charakterystyka promieniowania (domyślnie od 0° do 180°).
## Uwagi dodatkowe
W repozytorium znajdują się dodatkowe pliki:
- **wykres.png** obraz wyników – przykładowy wykres charakterystyki promieniowania anteny
- **Wilmer X 1857.png** Obraz przykładowych wymiarów anteny tubowej – ilustruje wymiary anteny tubowej Wilmer X 1857.

## Licencja
Projekt jest udostępniany do użytku niekomercyjnego. Oznacza to, że możesz swobodnie przeglądać kod, jednak nie wolno wykorzystywać go w celach komercyjnych bez uzyskania odpowiedniej zgody.

## Kontakt
W przypadku pytań lub sugestii dotyczących projektu, proszę o kontakt poprzez zgłoszenia (issues) na GitHub.

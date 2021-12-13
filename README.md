<B>Komunikacja szeregowa przez USB</B>


Do połączenia z Arduino jest konieczne, by urządzenie Android obsługiwało tryb USB On-The-Go (OTG). Jest to funkcja, która umożliwia podłączenie urządzenia z akcesoriami takimi jak klawiatura, mysz lub np. z dyskiem zewnętrznym. Na szczęście użyty przeze mnie tablet Kiano SlimTab 10 3GR ma taką możliwość.

Do komunikacji z Arduino i wykorzystania trybu OTG potrzebny jest również odpowiedniego kabel-adapter, który ma z jednej strony złącze USB-A żeńskie. Natomiast z drugiej strony potrzebne jest złącze odpowiednie dla modelu używanego urządzenia Android. W moim przypadku jest to microUSB-B męskie:

 zdjęcie

Do tego kabla przyłącza się przewód standardowo wykorzystywany przez Arduino UNO, czyli z jednej strony USB-A męskie a z drugiej strony USB-B męskie. Takie przewody są wciąż używane do podłączania drukarki do komputera.

zdjęcie


Połączenie Arduino UNO z silnikami DC

Dłonie robota są poruszane za pomocą silniczków DC. Każdy silnik pochodzi oczywiście ze starego sprzętu - z mechanizmu drukarki atramentowej do przesuwania głowicy z atramentem.

Każdy silnik pochodzi z innej drukarki. Zatem każdy ma inne parametry. Udało mi się ustalić, że jeden z nich jest przystosowany do napięcia pracy 12V. Parametrów drugiego z silników nie udało mi się odczytać. Natomiast doświadczalnie sprawdziłem, że przy napięciu 12V również działa z rozsądną prędkością i mocą. 

Arduino nie jest w stanie bezpośrednio zasilić silników. Jego wyjścia nie mają wystarczającego napięcia ani wydajności prądowej. Układ Arduino może jedynie dostarczyć sygnałów dla specjalnego układu będącego sterownikiem silników DC. W swoim robocie wykorzystałem jako sterownik silników DC popularny układ L293D. Napięcie zasilające silniki Vcc ustaliłem na 12V.

Silniki są sterowane za pomocą modulacji PWM. Jak już napisałem, silniki różnią się od siebie, mają różne parametry. Poza tym, silniki pracują w osi pionowej - czyli raz podnoszą dłoń a innym razem ją opuszczają. W efekcie tego mają różne zapotrzebowanie na prąd. Dlatego konieczne jest dobranie parametrów PWM indywidualnie dla każdego silnika oraz dla każdej z sytuacji: ciągnięcie dłoni robota w górę lub opuszczanie jej na dół. 

Do narysowania schematu elektronicznego całości wykorzystałem aplikację TinyCAD na licencji GNU LGPL v 2.1. Zaprojektowany przeze mnie schemat sterowania silnikami z Arduino UNO wygląda tak:

 


Program po stronie hosta Android
 

Ku swojemu zaskoczeniu, nie znalazłem żadnej standardowej biblioteki systemu Android do obsługi transmisji szeregowej przez port USB. Zawsze wydawało mi się że to jest jedna z podstawowych możliwości komunikacji... Cóż, nie pozostało mi nic innego jak poszukać rady na forach internetowych. Większość znalezionych postów proponowała projekt Felipe Herranz - felHR85. Zdecydowałem się na to rozwiązanie i nie żałuję. Implementacja podanego przykładu nie nie była trudna a całość zaczęła działać  bez specjalnego grzebania w kodzie. Pojawił się tylko jeden problem. Otóż, pomimo tego że zastosowałem się do instrukcji, czyli dopisaniu do odpowiednich plików:


build.gradle (Project level):

maven { url "https://jitpack.io" }

build.gradle (App level):

implementation 'com.github.felHR85:UsbSerial:6.1.0'

Manifest.xml

<uses-feature android:name="android.hardware.usb.host"

   android:required="true"/>

pojawiał się błąd: 

"Invoke-customs are only supported starting with Android O (--min-api 26)". 

Na szczęście szybko udało mi się go rozwiązać przez dodanie do  pliku build.gradle (App level) fragmentu:

compileOptions {

   sourceCompatibility JavaVersion.VERSION_1_8

   targetCompatibility JavaVersion.VERSION_1_8

}

Przerobienie przykładu i dostosowanie do moich potrzeb również nie było trudne.

 

Program po stronie Arduino UNO

Program po stronie Arduino ma za zadanie nasłuchiwać na porcie szeregowym. Gdy przyjdą jakieś dane, próbuje je zinterpretować jako komendy dla silników (a w przyszłości również dla innych elementów robota). Następnie program uruchamia wszystkie otrzymane komendy. Zwrotnie zwraca do portu szeregowego informacje o bieżącym stanie, np. czy komenda jeszcze trwa czy już się zakończyła. Jest to przydatne przy testowaniu całości. 

Do programowania używam standardowego środowiska Arduino Genuino IDE w wersji 1.8.13. Jako że preferuję programowanie obiektowe, wykorzystuję elementy języka C++. Na swoje potrzeby zrobiłem np. klasę "Silnik" aby każdy silnik w programie był reprezentowany i obsługiwany jako oddzielny obiekt.

Arduino to stosunkowo prosty układ. Nie ma tu systemu operacyjnego. Nie ma wielowątkowości. A przydałoby się do moich potrzeb, bo przecież robot musi robić wiele rzeczy na raz - np. niezależnie podnosić każdą dłoń. 

Skoro Arduino nie oferuje wielowątkowości, musiałem zrobić ją sobie sam. Moje rozwiązanie działa zadowalająco. Komendy z portu szeregowego przychodzą w jednej paczce, a mój program rozdziela je i kieruje do danego silnika. Komendy wykonują się równolegle, silniki startują i zatrzymują się w odpowiednim momencie, niezależnie od siebie.

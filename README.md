<span style="font-size: small;"><span style="font-family: verdana;">Repozytorium zawiera kody programów "napędzających" robota. Film pokazujący jego działanie jest umieszczony na YouTube:</span></span><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p style="text-align: center;"><span style="font-size: small;"><span style="font-family: verdana;">&nbsp;</span></span><span style="font-size: small;"><a href="https://www.youtube.com/watch?v=9PGIzgoljEQ" style="margin-left: 1em; margin-right: 1em;" target="_blank"><img border="0" data-original-height="1080" data-original-width="1920" height="180" src="https://blogger.googleusercontent.com/img/a/AVvXsEgtMfd_vu32JYg93J8L3LPKhSj9r-M3uVRnPYBIfYHAaV21o4pBbvf6iA88AAZ05qhT5St-9b1hVWDSytuCQunSXhkwk93eEoBN8-PX0Fj7WJctRT1AZEL8cYy6FI9KV8DB2t-aTjOoS9EsXn61aVQ7t0KuWClqIL-vjypKfuk0ELamQcm1XVdxoSHc=s320" width="320" /></a></span></p><p></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><span style="font-size: small;"><span style="font-family: verdana;"><a href="https://www.youtube.com/watch?v=9PGIzgoljEQ">https://www.youtube.com/watch?v=9PGIzgoljEQ</a><br /></span></span><p><span style="font-size: small;"><span style="font-family: verdana;">&nbsp;</span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;">Intencję powstania robota opisuje strona:<br /></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><div class="separator" style="clear: both; text-align: center;"><span style="font-size: small;"><span style="font-family: verdana;"><a href="https://robot-zebrak.blogspot.com/" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="1536" data-original-width="2048" height="240" src="https://blogger.googleusercontent.com/img/a/AVvXsEjsbMcAwKp-513v_3jvkKBbxysporf1HN1fx3RW6AOC2ydwHPP_JgA6lfq-LmsCXXFNuQ3c-xdx1Mw8KCYWYmCgwt1H1dJalQ8oB6VTrE3-VkUjHuO9xZyh68fP2ELqmXlQqlgqot2PMjJdk9vtTLwBRvFgBp95t3heN_Homglp1eYxgJOAJlYD6Ijs=s320" width="320" /></a></span></span></div><span style="font-size: small;"></span><p></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><a href="https://robot-zebrak.blogspot.com/">https://robot-zebrak.blogspot.com/</a> <br /></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;">Robot działa na współpracujących ze sobą urządzeniach - tablet z systemem Anrdoid 5.0 Lollipop oraz Arduino Uno. Dlatego repozytorium jest podzielone na dwie odpowiednie części. Języki programowania, które użyłem to Java oraz C++.<br /></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><b>&nbsp;</b></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><b>Program po stronie tabletu z systemem Android</b><br /></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">Tablet jest główną jednostką robota. Uruchamia program napisany w Android Studio w języku Java. Program służy do animacji twarzy robota, daje mu głos oraz pośrednio steruje ruchami robota.&nbsp; <br /></span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">Animowana
 twarz to odpowiednio zmieniane pliki graficzne PNG. Chcę zauważyć że 
animacja jest niezależna dla górnej i dolnej strony twarzy. Zatem oczy i
 usta są niezależnie oprogramowane w kombinacjach odpowiednich dla 
wyrażania emocji: radość, złość, strach czy płacz.</span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">Opowieść
 robota nie jest monolitem ale jest podzielona na kilkadziesiąt plików 
MP3. Tytuły i kolejność tych plików jest zapisana w bazie danych SqLite.
 Dzięki temu mogę odpowiednio zmieniać, usuwać lub dodawać pojedyncze 
zdania, przerabiać lub rozwijać opowieść robota. W bazie danych jest 
również przypisany dla każdego zdania odpowiednia emocja. Zatem w 
połączeniu z animacją twarzy robot może wypowiadać zdanie odpowiednio ze
 złością, radością itp.<br /></span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">Jednym z ciekawych - moim zdaniem - rozwiązań w moim projekcie jest wykorzystanie klasy
 Visualizer do wspomagania animacji mowy robota. Stworzyłem synchronizację
ruchu ust z dźwiękiem MP3. Dzięki temu, gdy robot przerywa mówienie (np. 
między wyrazami lub zdaniami) usta przestają się poruszać. Dzięki temu animacja jest bardziej naturalna.</span></span></span></span></span></span> </span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">W celu komunikacji przez port USB z Arduino wykorzystałem podklasę dziedziczącą z S</span></span></span></span><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">ervice</span></span></span></span>. </span></span>Ku
 swojemu zaskoczeniu, nie znalazłem żadnej standardowej biblioteki 
systemu Android do obsługi transmisji szeregowej przez port USB. Zawsze 
wydawało mi się że to jest jedna z podstawowych możliwości 
komunikacji... Cóż, nie pozostało mi nic innego jak poszukać rady na 
forach internetowych. Większość znalezionych postów proponowała projekt <a href="https://github.com/felHR85/UsbSerial" target="_blank">Felipe Herranz - felHR85</a>. Zdecydowałem się na to rozwiązanie i nie żałuję. Implementacja <a href="https://github.com/felHR85/UsbSerial/tree/master/example" target="_blank">podanego przykładu</a>
 nie nie była trudna a całość zaczęła działać&nbsp; bez specjalnego grzebania
 w kodzie. Pojawił się tylko jeden problem. Otóż, pomimo tego że 
zastosowałem się do instrukcji, czyli dopisaniu do odpowiednich plików:<br /></span></span></p><br /><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">build.gradle (Project level):</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">maven { url </span><span style="background-color: #2b2b2b; color: #6a8759; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">"https://jitpack.io" </span><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">}</span></p><br /><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">build.gradle (App level):</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">implementation </span><span style="background-color: #2b2b2b; color: #6a8759; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">'com.github.felHR85:UsbSerial:6.1.0'</span></p><br /><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">Manifest.xml</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #e8bf6a; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">&lt;uses-feature </span><span style="background-color: #2b2b2b; color: #9876aa; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">android</span><span style="background-color: #2b2b2b; color: #bababa; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">:name</span><span style="background-color: #2b2b2b; color: #6a8759; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">="android.hardware.usb.host"</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #6a8759; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">&nbsp;&nbsp;&nbsp;</span><span style="background-color: #2b2b2b; color: #9876aa; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">android</span><span style="background-color: #2b2b2b; color: #bababa; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">:required</span><span style="background-color: #2b2b2b; color: #6a8759; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">="true"</span><span style="background-color: #2b2b2b; color: #e8bf6a; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">/&gt;</span></p><p><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">pojawiał się błąd:&nbsp;</span></span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;">"Invoke-customs are only supported starting with Android O (--min-api 26)".&nbsp;</span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;">Na szczęście szybko udało mi się go rozwiązać przez dodanie do&nbsp; pliku</span></span><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;"><span style="font-size: small;"><span style="font-family: verdana;">&nbsp;</span></span></span><span style="background-color: transparent; color: black; font-family: Arial; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 700; text-decoration: none; vertical-align: baseline; white-space: pre;">build.gradle (App level) </span><span style="font-size: small;"><span style="font-family: verdana;">fragmentu:</span></span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">compileOptions {</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">&nbsp;&nbsp;&nbsp;sourceCompatibility JavaVersion.</span><span style="background-color: #2b2b2b; color: #9876aa; font-family: 'Courier New'; font-size: 11pt; font-style: italic; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">VERSION_1_8</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #9876aa; font-family: 'Courier New'; font-size: 11pt; font-style: italic; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">&nbsp;&nbsp;&nbsp;</span><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">targetCompatibility JavaVersion.</span><span style="background-color: #2b2b2b; color: #9876aa; font-family: 'Courier New'; font-size: 11pt; font-style: italic; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">VERSION_1_8</span></p><p dir="ltr" style="line-height: 1.38; margin-bottom: 0pt; margin-top: 0pt;"><span style="background-color: #2b2b2b; color: #a9b7c6; font-family: 'Courier New'; font-size: 11pt; font-style: normal; font-variant: normal; font-weight: 400; text-decoration: none; vertical-align: baseline; white-space: pre;">}</span></p><p><span style="font-size: small;"><span style="font-family: verdana;">Przerobienie przykładu i dostosowanie do moich potrzeb również nie było trudne.</span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;">&nbsp;</span></span></p><p><b><span style="font-size: small;"><span style="font-family: verdana;">Program po stronie Arduino UNO</span></span></b></p><p><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;"><span style="font-size: small;"><span style="font-family: verdana;">Po
 stronie Arduino program jest napisany w C++. </span></span></span></span></span></span><span style="font-size: small;">M</span>a
 on za zadanie nasłuchiwać na porcie szeregowym. Gdy przyjdą jakieś 
dane, próbuje je zinterpretować jako komendy dla silników (a w 
przyszłości również dla innych elementów robota). Następnie program 
uruchamia wszystkie otrzymane komendy. Zwrotnie zwraca do portu 
szeregowego informacje o bieżącym stanie, np. czy komenda jeszcze trwa 
czy już się zakończyła. Jest to przydatne przy testowaniu całości.&nbsp; <br /></span></p><p><span style="font-family: verdana;"><span style="font-family: verdana;">Do
 programowania używam standardowego środowiska Arduino Genuino IDE w 
wersji 1.8.13. Jako że preferuję programowanie obiektowe, </span></span><span style="font-family: verdana;"><span style="font-family: verdana;"><span style="font-family: verdana;"><span style="font-family: verdana;">wykorzystuję elementy języka C++. Na swoje potrzeby </span></span>zrobiłem np. klasę 
"Silnik" aby każdy silnik w programie był reprezentowany i obsługiwany 
jako oddzielny obiekt.</span> <br /></span></p><p><span style="font-family: verdana;">Arduino
 to stosunkowo prosty układ. Nie ma tu systemu operacyjnego. Nie ma 
wielowątkowości. A przydałoby się do moich potrzeb, bo przecież robot 
musi robić wiele rzeczy na raz - np. niezależnie podnosić każdą dłoń.&nbsp;</span></p><p><span style="font-family: verdana;">Skoro
 Arduino nie oferuje wielowątkowości, musiałem zrobić ją sobie sam. Moje
 rozwiązanie działa zadowalająco. Komendy z portu szeregowego przychodzą
 w jednej paczce, a mój program rozdziela je i kieruje do danego 
silnika. Komendy wykonują się równolegle, silniki startują i zatrzymują 
się w odpowiednim momencie, niezależnie od siebie.</span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><br /></span></span></p><p><b><span style="font-size: small;"><span style="font-family: verdana;">Połączenie Arduino UNO z silnikami DC<br /></span></span></b></p><p><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;"><span style="font-size: small;"><span style="font-family: verdana;"></span></span></span></span></span></span></span></p><p></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">Dłonie robota są poruszane za pomocą silniczków DC. Każdy silnik pochodzi oczywiście ze starego sprzętu - z mechanizmu drukarki atramentowej do przesuwania głowicy z atramentem.</span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">Każdy silnik pochodzi z innej drukarki. Zatem każdy ma inne parametry. Udało mi się ustalić, że jeden z nich jest przystosowany do napięcia pracy 12V. Parametrów drugiego z silników nie udało mi się odczytać. Natomiast doświadczalnie sprawdziłem, że przy napięciu 12V również działa z rozsądną prędkością i mocą.&nbsp;</span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">Arduino nie jest w stanie bezpośrednio zasilić silników. Jego wyjścia nie mają wystarczającego napięcia ani wydajności prądowej. Układ Arduino może jedynie dostarczyć sygnałów dla specjalnego układu będącego sterownikiem silników DC. W swoim robocie wykorzystałem jako sterownik silników DC popularny układ L293D. Napięcie zasilające silniki Vcc ustaliłem na 12V.<br /></span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">Silniki są sterowane za pomocą modulacji PWM. Jak już napisałem, silniki różnią się od siebie, mają różne parametry. Poza tym, silniki pracują w osi pionowej - czyli raz podnoszą dłoń a innym razem ją opuszczają. </span></span></span></span><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">W efekcie tego mają różne zapotrzebowanie na prąd. Dlatego konieczne jest dobranie parametrów PWM indywidualnie dla każdego silnika oraz dla każdej z sytuacji: ciągnięcie dłoni robota w górę lub opuszczanie jej na dół.&nbsp;</span></span></span></span></span></span></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;"><span style="font-size: small;"><span style="font-family: verdana;"><span style="background-color: #fcff01;"><span style="background-color: white;">Do narysowania schematu elektronicznego całości wykorzystałem aplikację <a href="https://www.tinycad.net" target="_blank">TinyCAD</a> na licencji GNU LGPL v<span> 2.1. </span>Zaprojektowany przeze mnie schemat sterowania silnikami z Arduino UNO wygląda tak: <br /></span></span></span></span></span></span></span></span></p><p></p><p><span style="font-size: small;"><span style="font-family: verdana;">&nbsp;</span></span><a href="https://1.bp.blogspot.com/-LX_-JJQMemQ/YJEBO1FLb6I/AAAAAAAADow/LLxeRoRu-UcWoXBgL4sCduL9fyq7QRFywCNcBGAsYHQ/s1141/schemat.jpg" style="margin-left: 1em; margin-right: 1em;"><img border="0" data-original-height="586" data-original-width="1141" height="328" src="https://1.bp.blogspot.com/-LX_-JJQMemQ/YJEBO1FLb6I/AAAAAAAADow/LLxeRoRu-UcWoXBgL4sCduL9fyq7QRFywCNcBGAsYHQ/w640-h328/schemat.jpg" width="640" /></a></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"></span></span></p><p><span style="font-size: small;"><span style="font-family: verdana;"><br /></span></span></p><p><b><span style="font-size: small;"><span style="font-family: verdana;">Komunikacja szeregowa przez USB</span></span></b></p><p><span style="font-size: small;"><span style="font-family: verdana;"><br />Do połączenia z Arduino jest konieczne, by urządzenie Android obsługiwało tryb </span></span><span style="font-size: small;"><span style="font-family: verdana;"><b><span style="font-size: small;"><span style="font-family: verdana;">USB On-The-Go (OTG)</span></span></b>. Jest</span></span><span style="font-size: small;"><span style="font-family: verdana;"> to funkcja, która 
umożliwia podłączenie urządzenia z akcesoriami takimi jak klawiatura, 
mysz lub np. z dyskiem zewnętrznym. Na szczęście użyty przeze mnie tablet Kiano SlimTab 10 3GR ma taką możliwość. <br /></span></span><br /><span style="font-size: small;"><span style="font-family: verdana;"><span style="font-size: small;"><span style="font-family: verdana;">Do komunikacji z Arduino i wykorzystania trybu OTG potrzebny jest również 
odpowiedniego kabel-adapter, który ma z jednej strony złącze <b>USB-A żeńskie</b>.
 Natomiast z drugiej strony potrzebne jest złącze odpowiednie dla modelu
 używanego urządzenia Android. W moim przypadku jest to <b>microUSB-B męskie</b>: <br /></span></span></span></span></p><span style="font-size: small;"><span style="font-family: verdana;">Do tego kabla przyłącza się przewód standardowo wykorzystywany przez Arduino UNO, czyli z jednej strony <b>USB-A męskie</b> a z drugiej strony <b>USB-B męskie</b>. Takie przewody są wciąż używane do podłączania drukarki do komputera.</span></span><p><br /></p>

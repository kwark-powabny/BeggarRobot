#include "Globals.h"
#include "Silnik.h"
#include "Dioda.h"

//Silnik silnik1(1, SILNIK1_CZAS_CALK_PRZESUWU, SILNIK1_PIN_INPUT_1, SILNIK1_PIN_INPUT_2, SILNIK1_PIN_EN);
Silnik silnik1(1, SILNIK1_PIN_INPUT_1, SILNIK1_PIN_INPUT_2, SILNIK1_PIN_EN);
Silnik silnik2(2, SILNIK2_PIN_INPUT_1, SILNIK2_PIN_INPUT_2, SILNIK2_PIN_EN);

Dioda dioda1(DIODA_PIN_2);
Dioda dioda2(DIODA_PIN_3);
Dioda dioda3(DIODA_PIN_4);
Dioda dioda4(DIODA_PIN_5);
Dioda dioda5(DIODA_PIN_9);
Dioda dioda6(DIODA_PIN_13);

#include "GlobalFunctions.h"

void setup() {
  //Start the serial monitor
  Serial.begin(115200);

  pinMode(SILNIK1_PIN_INPUT_1, OUTPUT);
  pinMode(SILNIK1_PIN_INPUT_2, OUTPUT);
  pinMode(SILNIK1_PIN_EN, OUTPUT);

  pinMode(SILNIK2_PIN_INPUT_1, OUTPUT);
  pinMode(SILNIK2_PIN_INPUT_2, OUTPUT);
  pinMode(SILNIK2_PIN_EN, OUTPUT);

 // pinMode(DIODA_PIN_0_RX, OUTPUT);  
 // pinMode(DIODA_PIN_1_TX, OUTPUT);  
  pinMode(DIODA_PIN_2, OUTPUT);
  pinMode(DIODA_PIN_3, OUTPUT);
  pinMode(DIODA_PIN_4, OUTPUT);
  pinMode(DIODA_PIN_5, OUTPUT);
  pinMode(DIODA_PIN_9, OUTPUT);
  pinMode(DIODA_PIN_13, OUTPUT);

  //  // DEBUG
  //    char charArray[500];
  //      dekodujKomendyPortuSzeregowego(charArray);
  //  // DEBUG


}

void loop() {
  String inputString;
  // jeżeli są nowe komendy z portu szeregowego, to je obsłuż

    if(Serial.available() > 0){
        //if so, then read the incoming data.
        inputString = Serial.readString();
        //Serial.println(inputString);

    }
    int beginOfCommand = 0;
    for (int i = 0; i < inputString.length(); i++){
      //Serial.print(inputString[i]);
      if (inputString[i] == '|'){
        String komenda = inputString.substring(beginOfCommand, i);
        Serial.println(komenda);
        dekodujKomendePortuSzeregowego (komenda);
        beginOfCommand = i + 1;
      }
      
    }


  // Uwaga - dla mniejszych prędkości transmisji jest ryzyko że Serial.available() będzie 0 bo port nie zdąży załadować następnego bajtu!!!
  // Wtedy trzeba wprowadzić opóźnienie w pętli "for"

//  for (int i = 0; Serial.available() > 0; i++) {
//    // read the incoming byte:
//    charArray[i] = Serial.read();
//    Serial.print(i);       Serial.print(": ");
//    Serial.println(charArray[i]);
//    if (charArray[i] == '|') {
//      Serial.print(i);       Serial.print(": znacznik ------: ");
//      Serial.println(charArray[i]);
//
//      charArray[i] = 0;
//      String str = charArray;
//      Serial.println(charArray);
//      dekodujKomendyPortuSzeregowego(str);
//      i = -1;
//    }
//  }
//
//  if (silnik1.kolejkaKomend[0] != "") {
//    Serial.println("Kolejka komend 1:");
//    for (int i = 0; i < ROZMIAR_KOLEJKI; i++) {
//      Serial.println(silnik1.kolejkaKomend[i]);
//    }
//  }
//
//  if (silnik2.kolejkaKomend[0] != "") {
//    Serial.println("Kolejka komend 2:");
//    for (int i = 0; i < ROZMIAR_KOLEJKI; i++) {
//      Serial.println(silnik2.kolejkaKomend[i]);
//    }
//  }

  //delay(100);
  //Serial.println("Opuszczam pętlę");


  // jeżeli nie ma nowych komend, to kontynuuj dotychczasowe
  kontynuujKomendy();
  dioda1.przestawStan();
  dioda2.przestawStan();
  dioda3.przestawStan();
  dioda4.przestawStan();
  dioda5.przestawStan();
  dioda6.przestawStan();

}

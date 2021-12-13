
class Silnik 
{ 
	
    private: 
    enum StanKomendy { nowa, trwa, zakonczona };
    int numerSilnika;
    int czasPrzesuwu;
    int kierunek;
    unsigned long przesuwMomentStart; 
    unsigned long przesuwMomentStop; 
    unsigned short pwm;    
  
    unsigned short pinInput1;
    unsigned short pinInput2;
    unsigned short pinEn;
  
    StanKomendy stanKomendy;
	


  
    public: 

    String kolejkaKomend[ROZMIAR_KOLEJKI];
  
    Silnik(int numerSilnika, unsigned short pinInput1, unsigned short pinInput2, unsigned short pinEn) 
    { 

       this->pinInput1 = pinInput1;
       this->pinInput2 = pinInput2;
       this->pinEn = pinEn;
     
       this->numerSilnika = numerSilnika;
       this->kierunek = 0;
       this->czasPrzesuwu = 0;
       this->pwm = 0;   
       
       this->przesuwMomentStart = 0;
       this->przesuwMomentStop = 0;
       this->stanKomendy = StanKomendy::zakonczona;

       // inicjalizacja kolejki komend
       for (int i = 0; i < ROZMIAR_KOLEJKI; i++)
       {
         kolejkaKomend[i] = "";
       }
     
    } 

	
	
	
    void ustawNowaKomende(){
//        if (this->stanKomendy != StanKomendy::zakonczona){
//          // błąd - silnik nie ukończył jeszcze poprzedniej komendy
//          String infoString = "Czas: " + millis(); // + " Error: silnik " + this->numerSilnika + " nie ukończył jeszcze poprzedniej komendy"
//          Serial.println(infoString);
//          return;
//        }

        String komenda = pobierzZkolejki();
        if (komenda == ""){
          return;
        }

        this->stanKomendy = StanKomendy::nowa;
        this->kierunek = komenda.substring(6,8).toInt();
        this->czasPrzesuwu = komenda.substring(9, 13).toInt();
        this->pwm = komenda.substring(14, 17).toInt();

//        Serial.print("Silnik: "); Serial.println(this->numerSilnika);
//        Serial.print("Kierunek: "); Serial.println(this->kierunek);
//        Serial.print("Czas przesuwu: "); Serial.println(this->czasPrzesuwu );
//        Serial.print("PWM: "); Serial.println(this->pwm );        

        // określenie momentów startu i zatrzymania silnika
        this->przesuwMomentStart = millis();
        this->przesuwMomentStop = this->przesuwMomentStart + this->czasPrzesuwu;
        
//        Serial.print("Wyznaczony czas startu: ");    Serial.println(this->przesuwMomentStart); 
//        Serial.print("Wyznaczony czas stopu:  ");    Serial.println(this->przesuwMomentStop); 
    }

    void wykonujKomende(){
        if (this->stanKomendy == StanKomendy::zakonczona){
          ustawNowaKomende();
        }
        
        if (this->stanKomendy == StanKomendy::nowa){
          //rozpoczęta o czasie: "); Serial.println(millis());
          // zacznij wykonywać komendę - ustaw piny
          if (this->kierunek == 1){
            digitalWrite(this->pinInput1, HIGH);
            digitalWrite(this->pinInput2, LOW);       
          }
          else if (this->kierunek = 2){
            digitalWrite(this->pinInput1, LOW);
            digitalWrite(this->pinInput2, HIGH);       
          }
          //digitalWrite(this->pinEn, HIGH);      
          analogWrite(this->pinEn, this->pwm);  
          
          // przestaw status komendy
          this->stanKomendy = StanKomendy::trwa;
        }
        else if (this->stanKomendy == StanKomendy::trwa){
          //Serial.write("Komenda trwa... Czas:"); Serial.println(millis());
          //czekaj na koniec czasu
          if (millis() > this->przesuwMomentStop){
            // zakończ komendę - przestaw piny
            digitalWrite(this->pinInput1, LOW);
            digitalWrite(this->pinInput2, LOW);       
            digitalWrite(this->pinEn, LOW);
            //przestaw status komendy
            this->stanKomendy = StanKomendy::zakonczona;
            Serial.print("Silnik "); Serial.print(this->numerSilnika);           
            Serial.print(" Komenda ");  Serial.print(this->pwm);
            Serial.print(" zakończona o czasie: "); Serial.println(millis());
          }
        
        }     
 
    }

    String pobierzZkolejki(){
//          // >> TODO DEBUG
//          Serial.print(this->numerSilnika);  Serial.println(": Kolejka przed pobraniem komendy: ");     
//          for (int i = 0; i < ROZMIAR_KOLEJKI; i++)
//          {
//            Serial.println(kolejkaKomend[i]);
//          }
//          // << TODO DEBUG
           
          String pierwszaKomenda = kolejkaKomend[0];
          for (int i = 0; i < ROZMIAR_KOLEJKI - 1; i++)
          {
            kolejkaKomend[i] = kolejkaKomend[i + 1];
          }
          kolejkaKomend[ROZMIAR_KOLEJKI - 1] = "";

//          // >> TODO DEBUG
//          Serial.print(this->numerSilnika);  Serial.println(": Kolejka po pobraniu komendy: ");     
//          for (int i = 0; i < ROZMIAR_KOLEJKI; i++)
//          {
//            Serial.println(kolejkaKomend[i]);
//          }
//          // << TODO DEBUG    

          return pierwszaKomenda;
    
    }

   void dodajDoKolejki(String komenda){

//          Serial.print(this->numerSilnika);  Serial.println(": Dodaj do kolejki: ");// Serial.println(komenda);
          int i = 0;
          while (i < ROZMIAR_KOLEJKI && kolejkaKomend[i] != ""){
            i++;
          }

          if (i < ROZMIAR_KOLEJKI){
            kolejkaKomend[i] = komenda;
          }
          else{
            Serial.println("Przekroczono rozmiar kolejki!!!!!!");
          }

////          // >> TODO DEBUG
//          Serial.print(this->numerSilnika);  Serial.println(": Kolejka po dodaniu komendy: ");     
//          for (int i = 0; i < ROZMIAR_KOLEJKI; i++)
//          {
//            Serial.println(kolejkaKomend[i]);
//          }
////          // << TODO DEBUG  
    }
}; 

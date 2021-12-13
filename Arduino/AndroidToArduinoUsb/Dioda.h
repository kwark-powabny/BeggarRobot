
class Dioda
{ 
  
    private: 
    int numerPortu;
    //unsigned long momentStart;  
    unsigned long momentEnd;  
    bool stan;
  
    public: 


  // konstruktor
    Dioda(int numerPortu) 
    { 
      this->numerPortu = numerPortu;
      //this->momentStart = millis();
      this->momentEnd = millis();
    }

    void przestawStan(){
      if (millis() < this->momentEnd){
        // nic nie rób
      } else {
        this->stan = !this->stan;
        digitalWrite(this->numerPortu, this->stan);
        this->momentEnd += random(1, 10) * 20; 
       
        Serial.print("nr portu="); 
        Serial.print(this->numerPortu);  
        Serial.print("\tstan=");
        Serial.print(this->stan);
        Serial.print("\tmomentEnd="); 
        Serial.println(this->momentEnd);
        
      }
    }

};

#ifndef GLOBAL_FUNCTIONS_H
#define GLOBAL_FUNCTIONS_H


// String getValue(String data, char separator, int index)
//{
//  int found = 0;
//  int strIndex[] = {0, -1};
//  int maxIndex = data.length()-1;
//
//  for(int i=0; i<=maxIndex && found<=index; i++){
//    if(data.charAt(i)==separator || i==maxIndex){
//        found++;
//        strIndex[0] = strIndex[1]+1;
//        strIndex[1] = (i == maxIndex) ? i+1 : i;
//    }
//  }
//
//  return found>index ? data.substring(strIndex[0], strIndex[1]) : "";
//}

void dekodujKomendePortuSzeregowego (String komenda)
{
//  const int ROZMIAR  = 20; 
//  //String komendy[ROZMIAR];
//  //String komenda;
//  char * pch;
//
//  pch = strtok (str,"|"); // komendy oddzielone są takim znakiem |
//  str = "";
//  for (int i = 0; pch != NULL; i++)
//  {
//    //Serial.println(pch); 
//    komenda = pch;

    Serial.println(" XX---------------------");     
    Serial.println(komenda);     
    if (komenda.substring(0,2) == "01") { // silnik
      if (komenda.substring(3,5) == "01") { // silnik 1
        Serial.println(": komenda dla silnika 1");
        silnik1.dodajDoKolejki(komenda);  
      }
      else if (komenda.substring(3,5) == "02") { // silnik 2
        Serial.println(": komenda dla silnika 2"); 
        silnik2.dodajDoKolejki(komenda); 
      }
    }
    else if (komenda.substring(0,2) == "02") { // dioda
      Serial.println("Komenda dla diody: ");    
      // TODO 
  
    }
    else{
        Serial.println(": komenda nierozpoznana");  
    }
//    pch = strtok (NULL, "|");
//  }


//  komendy[0] =  "01 02 02 1000 000";
//  komendy[1] =  "01 01 02 1000 001";
//  komendy[2] =  "01 02 01 0300 002";
//  komendy[3] =  "01 01 01 0250 003";
//  komendy[4] =  "01 02 02 0500 004";
//  komendy[5] =  "01 01 02 0300 005";
//  komendy[6] =  "01 02 02 1000 006";
//  komendy[7] =  "01 01 02 1000 007";
//  komendy[8] =  "01 02 01 0300 008";
//  komendy[9] =  "01 01 01 0250 009";
//  komendy[10] = "01 01 01 0250 010";
//  komendy[11] = "01 02 01 0250 011";
//  komendy[12] = "01 02 01 0250 012";
//  komendy[13] = "01 01 01 0250 013";
//  komendy[14] = "01 02 01 0250 014";
//  komendy[15] = "01 01 01 0250 015";
//  komendy[16] = "01 01 01 0250 016";
//  komendy[17] = "01 02 01 0250 017";
//  komendy[18] = "01 02 01 0250 018";
//  komendy[19] = "01 01 01 0250 019";

//
//  //for (int i = 0; komendy[i] != NULL; i++){
//  for (int i = 0; i < ROZMIAR; i++){
//	  Serial.print(i);  Serial.println(" XX---------------------");     
//	  Serial.print(komendy[i]);     
//    if (komendy[i].substring(0,2) == "01") { // silnik
//      if (komendy[i].substring(3,5) == "01") { // silnik 1
//		    Serial.println(": komenda dla silnika 1");
//        //silnik1.dodajDoKolejki(komendy[i]);  
//        //silnik1.dodajDoKolejki();  
//  
//      }
//      else if (komendy[i].substring(3,5) == "02") { // silnik 2
// 		    Serial.println(": komenda dla silnika 2"); 
//        //silnik2.dodajDoKolejki(komendy[i]); 
//        //silnik2.dodajDoKolejki();
//      }
//      
//    }
//    else if (komendy[i].substring(0,2) == "02") { // dioda
// 		  Serial.println("Komenda dla diody: ");    
//      // TODO 
//  
//    }
//    else{
//        Serial.println(": komenda nierozpoznana");  
//    }
//  }
//
//  Serial.println("Kolejka komend 1:");
//  for (int i = 0; i < ROZMIAR_KOLEJKI; i++){
//    Serial.println(silnik1.kolejkaKomend[i]);   
//  }
//
//  Serial.println("Kolejka komend 2:");
//  for (int i = 0; i < ROZMIAR_KOLEJKI; i++){
//    Serial.println(silnik2.kolejkaKomend[i]);   
//  }


  Serial.println("Koniec metody: dekodujKomendyPortuSzeregowego");  
  return;
}


void kontynuujKomendy(){
  silnik1.wykonujKomende();
  silnik2.wykonujKomende();  
}

 String sterujDiodami(){

    
    
}

#endif

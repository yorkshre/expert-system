
(deffunction pobierz_tak_nie ()
   (bind ?odp (readline))
   (bind ?odp (lowcase ?odp))
   (while(and (<> 0 (str-compare ?odp "tak")) (<> 0 (str-compare ?odp "nie")))
      (printout t "<tak|nie>: ")
      (bind ?odp (readline))
   )
   (printout t crlf)
   ?odp
)
(deffunction pobierz_tak_nie_nie-wiem ()
   (bind ?odpowiedz (readline))
   (bind ?odpowiedz (lowcase ?odpowiedz))
   (while(and (<> 0 (str-compare ?odpowiedz "tak")) (<> 0 (str-compare ?odpowiedz "nie")) (<> 0 (str-compare ?odpowiedz "nie wiem")))
      (printout t "<tak|nie|nie wiem>: ")
      (bind ?odpowiedz (readline))
   )
   (printout t crlf)
   ?odpowiedz
)

(defrule r1
(initial-fact)
=>
 (printout t "     ****************************************************************************" crlf 
    "               Poradnik - metody spawania stali nierdzewnych"       crlf
    "                            Autor:  Agata Bublewicz  " crlf
    "                            Email:  trudchen@wp.pl " crlf
   "                           Wersja:  1.1 " crlf
    "                         Licencja:  free " crlf
     "               *****************************************************************************" crlf
   
   
 (printout t " Podaj imie i nazwisko")(bind ?nazwa(readline))
 (assert ( nazwa ?nazwa))))
 
(defrule r2

(nazwa ?nazwa)
=>
(printout t " Witaj" ?nazwa " podaj nazwe firmy w ktorej pracujesz?" crlf)(bind ?firma(readline))

(printout t "Podaj swoje stanowisko w firmie: " crlf)(bind ?stanowisko(readline))

(assert( firma ?firma)(stanowisko ?stanowisko)))

(defrule r3
(firma ?firma)
(stanowisko ?stanowisko)
=>

(printout t " Czy w firma  " ?firma " na stanowisku "  ?stanowisko " spawacie stale nierdzewne? <tak|nie>" crlf crlf) 
(bind ?odp (pobierz_tak_nie))

(if(= 0 ( str-compare "tak" ?odp)) then (printout t " A jaka metoda?" )(bind ?metoda(readline))
(assert ( metoda ?metoda)(przyblizenie-dokladne)) else(if( = 0 (str-compare "nie" ?odp))
then( printout t " Czy chcesz sie dowiedziec cokolwiek na temat stali nierdzewnych <tak|nie>" crlf)

(bind ?odp(pobierz_tak_nie)) 

(if( = 0 (str-compare "tak" ?odp )) then (assert (wprowadzenie)) else
( if( = 0 (str-compare "nie" ?odp)) then 
(printout t " No trudno najwyzej wiedza nie jest ci pisana" crlf ))))))
 
 
		
	   
  (defrule r6
  (wprowadzenie)
  =>
  (printout t " Wprowadzenie do tematu:" crlf 
   " Rodzaje stali " crlf 
   " Metody spawania stali nierdzewnych" crlf 
   "Gazy ochronne" crlf)
  
  (printout t " Mam rozwinac temat Rodzaje stali? <tak|nie> " crlf  )
  (bind ?odp (pobierz_tak_nie))
  (if(= 0 ( str-compare "tak" ?odp)) then (assert(rodzaje-stali)) else(if (= 0 (str-compare "nie" ?odp))then (printout t "Chcesz poznac metody spawania? <tak|nie>" crlf )
  (bind ?odp (pobierz_tak_nie))
  
  (if( = 0 (str-compare "tak" ?odp )) then (assert(rodzaje-metod)) else(if( = 0 (str-compare "nie" ?odp)) then (printout t " Chcesz poznac rodzaje gazow ochronnych? <tak|nie>" crlf)
  (bind ?odp (pobierz_tak_nie))
  (if (= 0 (str-compare "tak" ?odp)) then (assert(rodzaje-gazow)) else(if( = 0(str-compare "nie" ?odp )) then (printout t " To chyba zakonczymy")
  
  (printout t " Mam rozwinac temat Rodzaje metod? <tak|nie> " )
  (bind ?odp (pobierz_tak_nie))
  (if(= 0 ( str-compare "tak" ?odp)) then (assert(rodzaje-metod)) else(if (= 0 (str-compare "nie" ?odp))then (printout t "Chcesz poznac rodzaje stali? <tak|nie>" crlf )
  (bind ?odp (pobierz_tak_nie))
  
  (if(= 0 (str-compare "tak" ?odp )) then (assert(rodzaje-stali)) else(if( = 0 (str-compare "nie" ?odp)) then (printout t " Chcesz poznac rodzaje gazow ochronnych? <tak|nie>" crlf)
  (bind ?odp (pobierz_tak_nie))
  (if (= 0 (str-compare "tak" ?odp)) then (assert(rodzaje-gazow)) else(if( = 0(str-compare "nie" ?odp )) then (printout t " To chyba zakonczymy" crlf)
  
  (printout t " Mam rozwinac temat Rodzaje gazow ochornnych? <tak|nie> " )
  (bind ?odp (pobierz_tak_nie))
  (if(= 0 ( str-compare "tak" ?odp)) then (assert(rodzaje-gazow)) else(if (= 0 (str-compare "nie" ?odp))then (printout t "Chcesz poznac metody spawania? <tak|nie>" crlf )
  (bind ?odp (pobierz_tak_nie))
  
  (if( = 0 (str-compare "tak" ?odp )) then (assert(rodzaje-metod)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " Chcesz poznac rodzaje stali ? <tak|nie>" crlf)
  (bind ?odp (pobierz_tak_nie))
  (if (= 0 (str-compare "tak" ?odp)) then (assert(rodzaje-stali)) else(if( = 0(str-compare "nie" ?odp ))
  then (printout t " To chyba zakonczymy"crlf))))))))))))))))))))
  
  
  
	
(defrule r7
  (przyblizenie-dokladne)
  (metoda ?metoda)
  =>
  (printout t " Czy wiesz ze oprocz metody "  ?metoda   "  wyrozniamy jeszcze inne. Oto spis wszystkich metod ponizej:" crlf crlf )
  
  (printout t " Metody spawania stali nierdzewnych:" crlf 
   "1 TIG" crlf
  " 2 Spawanie plazmowe" crlf 
  " 3 Spawanie lukowe drutem proszkowym z rdzeniem topnikowym" crlf 
  " 4 MIG" crlf
  " 5 Spawanie lukowe elektroda metalowa" crlf
  " 6 Spawanie laserowe przy zastosowaniu skoncentrowanej i spojnej wiazki swiatla " crlf 
  " 7 Spawanie wiazka eletronow" crlf crlf)
	
(printout t " Czy chcesz poznac dokladne parametry podanych metod ? <tak|nie> " crlf)
(bind ?odp (pobierz_tak_nie))

(if(= 0 (str-compare "tak" ?odp)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " Szanuje Twoj wybor" crlf))))

(defrule r8 
(parametry)

=>
(printout t" Wybierz numer i wcisnij ENTER: ")
 (printout t 
  crlf  "1 TIG" crlf
  " 2 Spawanie plazmowe" crlf 
  " 3 Spawanie lukowe drutem proszkowym z rdzeniem topnikowym" crlf 
  " 4 MIG" crlf
  " 5 Spawanie lukowe elektroda metalowa" crlf
  " 6 Spawanie laserowe przy zastosowaniu skoncentrowanej i spojnej wiazki swiatla " crlf 
  " 7 Spawanie wiazka eletronow" crlf crlf)
	

	 
 (bind ?odp(read))
  (if(= ?odp 1) then ( assert(TIG)))
 
  (if(= ?odp 2) then ( assert(PLAZMOWE)))

  (if(= ?odp 3) then ( assert(LUKOWE-DRUTEM)))

 (if(= ?odp 4) then (assert( MIG)))

(if(= ?odp 5) then (assert(LUKOWE)))

(if (= ?odp 6) then (assert(LASEROWE)))

(if( = ?odp 7) then (assert(WIAZKA_ELEKTRONOW)))

(assert(odp ?odp)))

(defrule r9
(TIG)
(odp ?odp)
=>

(printout t " Podstawowe parametry procesu spawania TIG:" crlf
"- rodzaj i natezenie pradu [A],"crlf
"- napiecie luku [V],"crlf
"- prędkosc spawania [m/min],"crlf
"- rodzaj i natezenie przeplywu gazu ochronnego [l/min],"crlf
"- rodzaj materialu i srednica elektrody nietopliwej [mm],"crlf
"- srednica (wymiary) materialu dodatkowego [mm]." crlf crlf )

(printout t " Czy wrocic do parametrow ? <tak|nie> " crlf)
(bind ?odp (pobierz_tak))

(if(= 0 (str-compare "tak" ?odpowiedz)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odpowiedz)) then (printout t " Szanuje Twoj wybor" crlf))))


(defrule r10 
(LUKOWE-DRUTEM)
(odp ?odp)
=>
(printout t " Parametry spawania lukowego drutem proszkowym w oslonie gazowej okreslaja:" crlf
"- rodzaj i natezenie pradu spawania [A]," crlf
"- napiecie luku [V],"crlf
"- rodzaj i srednica drutu [mm],"crlf
"- dlugosc wolnego wylotu drutu [mm],"crlf
"- predkosc spawania [m/min],"crlf
"- kat pochylenia drutu wzgledem zlacza ..."crlf
"- rodzaj i natezenie przeplywu gazu oslonowego [l/min]"crlf crlf )

(printout t " Czy chcesz wrocic do wyboru parametrow?  <tak|nie>" crlf)
(bind ?odp (pobierz_tak_nie))
(if(= 0 (str-compare "tak" ?odp)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " To konczymy" crlf))))

(defrule r11 
(PLAZMOWE)
(odp ?odp)
=>
(printout t "Parametry spawania w metodzie spawania plazmowego GTA" crlf
"- rodzaj i natezenie pradu [A],"crlf
"- napiecie luku [V] i odleglosc dyszy od spawanego przedmiotu [mm],"crlf
"- predkosc spawania [m/min],"crlf
"- rodzaj i natezenie przeplywu gazu plazmowego [l/min],"crlf
"- rodzaj i natezenie przeplywu gazu ochronnego [l/min],"crlf
"- rodzaj i resdnica elektrody wolframowej [mm],"crlf
"-ksztalt i wymiary dyszy plazmowej [mm]." crlf crlf)

(printout t " Czy chcesz wrocic do wyboru parametrow?  <tak|nie>" crlf)
(bind ?odp (pobierz_tak_nie))
(if(= 0 (str-compare "tak" ?odp)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " To konczymy" crlf))))

(defrule r12 
(MIG)
(odp ?odp)
=>
(printout t " Podstawowymi parametrami spawania MIG/MAG są:" crlf
"- rodzaj i natezenie pradu [A],"crlf
"- napiecie luku [V],"crlf
"- predkosc spawania [m/min],"crlf
"- rodzaj i natezenie przeplywu gazu ochronnego [l/min],"crlf
"- srednica drutu elektrodowego [mm],"crlf
"- dlugość wolnego wylotu elektrody [mm],"crlf
"- predkosc podawania drutu elektrodowego [mm/s]." crlf crlf )

(printout t " Czy chcesz wrocic do wyboru parametrow?  <tak|nie>" crlf)
(bind ?odp (pobierz_tak_nie))
(if(= 0 (str-compare "tak" ?odp)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " To konczymy" crlf))))


(defrule r13
(LASEROWE)
(odp ?odp)
=>
(printout t " Parametry spawania laserowego:" crlf
"- moc wiazki swiatla laserowego ciąglego [kW],"crlf
"- energia impulsu swiatla laserowego w kJ, czas jego trwania w ms i czestotliwosc powtarzania impulsu w Hz,"crlf
"- prędkość spawania [m/min],"crlf
"- długość ogniska wiazki laserowej [mm],"crlf
"- srednica wiazki laserowej [mm],"crlf
"- polozenie ogniska wiazki laserowej wzgledem zlacza [mm],"crlf
"- rodzaj i natezenie przeplywu gazu ochronnego [l/min]."crlf crlf)

(printout t " Czy chcesz wrocic do wyboru parametrow?  <tak|nie>" crlf)
(bind ?odp (pobierz_tak_nie))
(if(= 0 (str-compare "tak" ?odp)) then (assert( parametry)) else(if(= 0 (str-compare "nie" ?odp)) then (printout t " To konczymy" crlf))))

(defrule r14
(WIAZKA_ELEKTRONOW)
(odp ?odp)
=>
(printout t " jhslkajs"))



(defrule r15
(LUKOWE)
(odp ?odp)
=>

(printout t "djsldj"))

	
(defrule r16

(rodzaje-metod)

=>
(printout t " Wybierz numer i wcisnij ENTER: " crlf)
  (printout t " Metody spawania stali nierdzewnych:" crlf 
   "1 TIG" crlf
  " 2 Spawanie plazmowe" crlf 
  " 3 Spawanie lukowe drutem proszkowym z rdzeniem topnikowym" crlf 
  " 4 MIG" crlf
  " 5 Spawanie lukowe elektroda metalowa" crlf
  " 6 Spawanie laserowe przy zastosowaniu skoncentrowanej i spojnej wiazki swiatla " crlf 
  " 7 Spawanie wiazka eletronow" crlf crlf)
  
  (bind ?odp(read))
  (if(= ?odp 1) then ( assert(opis-tig)))
 
  (if(= ?odp 2) then ( assert(opis-plazmowe)))

  (if(= ?odp 3) then ( assert(opis-lukowe-drutem)))

 (if(= ?odp 4) then (assert( opis-mig)))

(if(= ?odp 5) then (assert(opis-lukowe)))

(if (= ?odp 6) then (assert(opis-laserowe)))

(if( = ?odp 7) then (assert(opis-wiazka-elektronow)))

(assert(odp ?odp)))

  (defrule r17

(rodzaje-stali)
=>

(printout t " Wybierz numer i wcisnij ENTER:" crlf)
(printout t crlf 
"1 Austenityczne stale nierdzewne: Fe-Cr-Ni (Mo)-(N)" crlf
"2 Struktury w pełni austenityczne (wyjatkowe)"crlf
"3 Ferrytyczne stale nierdzewne: Fe-Cr-(Mo-Ni-V)"crlf
"4 Gatunki ferrytyczne: 0,02% C–17-30% Cr–(stabilizowane Ti, Nb)"crlf 
"5 Stale nierdzewne austenityczno-ferrytyczne typu Duplex: Fe-Cr-Ni (Mo)-N"crlf
"6 Stale nierdzewne martenzytyczne: Fe-Cr-(Mo-Ni-V)" crlf crlf)

 (bind ?odp(read))
  (if(= ?odp 1) then ( assert(austenityczne)))
 
  (if(= ?odp 2) then ( assert(struktury)))

  (if(= ?odp 3) then ( assert(ferrytyczne)))

 (if(= ?odp 4) then (assert( gatunki-ferrytyczne)))

(if(= ?odp 5) then (assert(austenityczno-ferrytyczne)))

(if (= ?odp 6) then (assert(martenzytyczne)))



(assert(odp ?odp)))

(defrule r18
(rodzaje-gazow)
=>

(printout t " Gaz ochronny ma za zadanie nie tylko osłaniac elektrodę nietopliwa i obszar spawania przed dostępem
atmosfery, ale decyduje rowniez o napieciu luku, ksztalcie spoiny a nawet skladzie chemicznym stopiwa"   crlf crlf 
" Ponizej prezetuje rodzaje gazow ochronnych" crlf
"-----------------------------------------------------------------------------------------" crlf 
" Wybierz numer i wcisnij ENTER: " crlf crlf 

"1 Austenityczne stale nierdzewne " crlf
"2 Struktury w pelni austenityczne "crlf
"3 Ferrytyczne stale nierdzewne "crlf
"4 Gatunki ferrytyczne "crlf 
"5 Stale nierdzewne austenityczno-ferrytyczne typu Duplex"crlf
"6 Stale nierdzewne martenzytyczne" crlf crlf
"-------------------------------------------------------------------------------------------" crlf crlf)

(bind ?odp(read))
  (if(= ?odp 1) then ( assert(austenityczne)))
 
  (if(= ?odp 2) then ( assert(struktury)))

  (if(= ?odp 3) then ( assert(ferrytyczne)))

 (if(= ?odp 4) then (assert( gatunki-ferrytyczne)))

(if(= ?odp 5) then (assert(austenityczno-ferrytyczne)))

(if (= ?odp 6) then (assert(martenzytyczne)))



(assert(odp ?odp)))
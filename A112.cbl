 
       IDENTIFICATION DIVISION.
 
       program-id a112.
 
       environment DIVISION.
 
       input-output section.
 
       file-control.
 
                   select optional kayit assign "a111.dat"
 
                    organization is line sequential.
 
       DATA division.
 
       file section.
 
       fd kayit.
 
       01 registo.
 
            05 ad          pic x(12).
 
            05 soyad       pic x(15).
 
            05 sehir       pic x(12).
 
            05 ilce        pic x(12).
 
       working-storage section.
 
      *01 Eof        PIC X VALUE 'N'.
 
       77 sor        pic x value spaces.
 
       77 hat        pic  99 value zeros. 
 
       SCREEN section.
 
       01 ana-ekran.
 
            05 BLANK SCREEN BACKGROUND-COLOR 4
 
                       FOREGROUND-COLOR 15.
 
 
            05  VALUE "ADINIZ.........:"  LINE 1 COL 1.
 
            05  VALUE "SOY ADINIZ.....:"  LINE 2 COL 1.
 
            05  VALUE "SEHIR..........:"  LINE 3 COL 1.
 
            05  VALUE "ILCE...........:"  LINE 4 COL 1.
 
       01 EKRAN-OKUMA.
 
            05 LINE 1 COL 17 PIC x(12) USING  AD.
 
            05 LINE 2 COL 17 PIC x(15) USING Soyad.
 
            05 LINE 3 COL 17 PIC x(12) USING SEHIR.
 
            05 LINE 4 COL 17 PIC x(12) USING ILCE.
 
 
 
       PROCEDURE DIVISION.
 
       main.
 
             
 
             open extend kayit.
 
              DISPLAY ana-ekran.
 
              ACCEPT ekran-okuma.
 
           
 
     
 
       SOR.
 
              DISPLAY " kayit edilsinmi  ?" LINE 10 POSITION 10 BLINK.
 
              ACCEPT sor LINE 10 POSITION 33.
 
                  IF sor ="e" OR "E" GO kayit1 ELSE go kapat. 
 
                
 
       kayit1. 
 
          write registo. 
 
          close kayit. 
 
          go dok.
 
       kapat.
 
           close kayit.
 
       dok. 
 
           open input kayit. 
 
 
 
           perform until registo = high-values
 
               read  kayit
 
                 at end move high-values to registo 
 
 
 
               end-read
 
                     
 
 
 
                      display ad space soyad space sehir space ilce
 
                          
 
                               
 
 
 
            end-perform.
 
 
 
            close kayit.   
 
           
 
       sor2.
 
         display"Kayda devam edecekmisiniz?" line 25 position 10 blink.
 
         accept sor line 25 position 40.
 
         if sor="e" or "E" go main else stop run.
 
       

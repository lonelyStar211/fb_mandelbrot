#INCLUDE "fbgfx.bi"



CONST AS INTEGER WIDTH_screen = 1000
CONST AS INTEGER HEIGHT_screen = 1000

DIM SHARED AS double min_num = -2.84
DIM SHARED as double max_num = 1.0
DIM SHARED AS double factor = 1
DIM SHARED AS INTEGER MAX_ITERATIONS = 200

function map( value AS double, in_min AS Double, in_max AS Double, out_min AS double, out_max AS Double) AS double

    return (value - in_min) * (out_max - out_min) / (in_max - out_max) + out_min
END FUNCTION

SUB PRINTtoSCREEN(x AS INTEGER, y AS INTEGER, red AS Ulong, green AS Ulong, blue AS ULONG)
   
   
   
   pset(x,y),RGBA(red,green,blue,255)
   
   
   
END SUB



SUB main()
   SCREENRES WIDTH_SCREEN, HEIGHT_SCREEN, 32
   
   DIM counter AS INTEGER = 0
   
   WHILE TRUE:
     
     
      max_num -= 0.1*factor
      min_num += 0.15 * factor
      factor *= 0.9349
      MAX_ITERATIONS += 5
     
      FOR x AS INTEGER = 0 TO WIDTH_SCREEN - 1
         FOR y AS INTEGER = 0 TO HEIGHT_screen - 1
            IF INKEY() = "q" THEN END
           
            DIM AS double a = map(x, 0, WIDTH_screen, min_num, max_num)
            DIM AS double b = map(y, 0, WIDTH_screen, min_num, max_num)

            DIM AS double ai = a
            DIM AS double bi = b

            DIM AS INTEGER n = 0
           
           
            FOR i AS INTEGER = 0 TO MAX_ITERATIONS
               DIM AS DOUBLE a1 = a * a - b * b
               DIM AS DOUBLE b1 = 2 * a * b
               
               a = a1 + ai
               b = b1 + bi
               
               IF ((a+ b) > 20 ) THEN EXIT FOR
               
               n += 1
                             
            NEXT

            DIM bright AS INTEGER = (MAP(n, 0, MAX_ITERATIONS, 0 , 255))
           
            IF ((n = MAX_ITERATIONS)) THEN ' maybe add OR bright > 20
               bright = 0
            ENDIF
           
           
           
            DIM AS ubyte red = MAP(bright * bright, 0 , 6502, 0, 255)
            DIM AS ubyte green = bright
            DIM AS ubyte blue = MAP(SQR(bright), 0, sqr(255), 0, 255)
             
 
         
            SCREENLOCK()
            PRINTTOSCREEN(x,y,red,green,blue)
            SCREENUNLOCK()
           
           
           
           
         NEXT
         
      NEXT
     
     
     
     
     
     
     
      counter +=1
     
   WEND
   
   
   
   
   
END SUB


MAIN()









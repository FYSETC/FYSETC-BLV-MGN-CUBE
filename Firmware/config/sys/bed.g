; bed.g
; called to perform automatic bed compensation via G32
;
; generated by RepRapFirmware Configuration Tool on Tue Oct 09 2018 13:27:56 GMT+0300
M291 P"Probing mesh grid process started" R"Probing.." S1 T2
M561               		; clear any bed transform
G28				; home all axis bb
G90 				; absolute positioning bb
M557 X30:270 Y30:270 S80	; Define mesh grid
G29 S0				; Probe the bed and save height map to file
M374 				; Save calibration data. Default is sys/heightmap.csv
M291 P"Probing mesh grid process finished !" R"Probing.." S1 T2
; Probe the bed at 4 points
;G30 P0 X10 Y10 H0 Z-99999
;G30 P1 X10 Y290 H0 Z-99999
;G30 P2 X290 Y290 H0 Z-99999
;G30 P3 X290 Y10 H0 Z-99999 S
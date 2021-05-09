; Configuration file for Duet WiFi (firmware version 1.21)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool on Tue Oct 09 2018 13:27:56 GMT+0300

; General preferences
M80				; Turns on the ATX power supply
G90                                                ; Send absolute coordinates...
M83                                                ; ...but relative extruder moves

M667 S1                                            ; Select CoreXY mode

; Network
M550 FYSETC BLV mgn Cube                                 ; Set machine name
M552 S1                                            ; Enable network
M587 S"your_wifi_name" P"your_password"            ; Configure access point. You can delete this line once connected
M586 P0 S1                                         ; Enable HTTP
M586 P1 S0                                         ; Disable FTP
M586 P2 S0                                         ; Disable Telnet

; Drives
M569 P0 S1                                         ; Drive 0 goes backwards blv: its was S1
M569 P1 S1                                         ; Drive 1 goes backwards blv: its was S1
M569 P2 S1                                         ; Drive 2 goes forwards
M569 P3 S1                                         ; Drive 3 goes backwards WAS 0
M350 X16 Y16 Z16 E16 I1                            ; Configure microstepping with interpolation
M92 X200 Y200 Z400 E405.18                           ; Set steps per mm for Bondtech. 
M566 X600 Y600 Z24 E300                            ; Set maximum instantaneous speed changes (Jerk) (mm/min) 
M203 X20000 Y20000 Z2000 E2000                      ; Set maximum speeds (mm/min) 
M201 X3000 Y3000 Z100 E5000			   				 ; Set accelerations (mm/s^2)
M906 X1600 Y1600 Z1000 E1000 I30                   ; Set motor currents (mA) and motor idle factor in per cent
M84 S30                                            ; Set idle timeout

; Pressure advance
; M572 D0 S0.05					   					; disabled Pressure advance

; Axis Limits
M208 X-18 Y0 Z0 S1                                 ; Set axis minima
M208 X311 Y311 Z350 S0                             ; Set axis maxima

; Endstops
M574 X1 Y2 S0                                      ; Set active high endstops edit: Y endstop is high(max).

; Filament sensor
;M591 D0 P1 C3 S1				 					  ; Set Filament sensor Simple type (High) for extruder drive 0, connected to endstop input 3 (E0)

; Z-Probe
M574 Z1 S2                                         ; Set endstops controlled by probe

;M558 P1 H5 F200 T9000 I0 R0.5			 		   ; Set Z probe type mini ir sensor
M558 P5 H5 F500 T4000 X0 Y0 Z1                     ; Set Z probe type/mode 5. Not using on XY, but using it on Z.
;G31 P500 X-2 Y-16.4 Z1.043                         ; Set Z probe trigger value, offset and trigger height
G31 P25 X28.5 Y-5 Z0.8                           ; Z probe trigger value, offset in relation to nozzle. And trigger height adjustment
M557 X30:270 Y30:270 S35			   			   ; Define mesh grid

M307 H1 A716 C187.8 D8.5 B0			  		   ; Set PID for hotend values
M307 H0 A99.1 C453.2 D2.2 B0					   ; Set PID for heated bed values

Disable the Heater PWN channel to free it up for our usage:
; BLTouch - Heaters
M307 H3 A-1 C-1 D-1 ; Disable the 7th Heater to free up PWM channel 5 on the Duex board.

; Heaters
M305 P0 T100000 B3950 C0 R4700                     ; Set thermistor + ADC parameters for heater 0
M143 H0 S125                                       ; Set temperature limit for heater 0 to 100C
M305 P1 T100000 B3950 C0 R4700                     ; Set thermistor + ADC parameters for heater 1
M143 H1 S275                                       ; Set temperature limit for heater 1 to 260C

; Fans
M106 P0 S0 I0 F500 H-1                             ; Set fan 0 value, PWM signal inversion and frequency. Thermostatic control is turned off
M106 P1 S0 I0 F500 H-1                           ; Set fan 1 value, PWM signal inversion and frequency. Thermostatic control is turned on
M106 P2 S1 I0 F500 H1 T35                          ; Set fan 2 value, PWM signal inversion and frequency. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                                     ; Define tool 0
; M563 P0 D0 H1 F1 
G10 P0 X0 Y0 Z0                                    ; Set tool 0 axis offsets
G10 P0 R0 S0                                       ; Set initial tool 0 active and standby temperatures to 0C

; Automatic power saving
M911 S21 R22 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000" ; Set voltage thresholds and actions to run on power loss

; Custom settings are not configured
M564 H0                                   	   ; Let the Jog buttons work blv: added to allow jog buttons
M575 P1 B57600 S1
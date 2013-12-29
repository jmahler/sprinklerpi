EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:special
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:sprinklerpi
LIBS:sprinklerpi-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 11
Title ""
Date "29 dec 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L TRANSFO4 T1
U 1 1 52C09D96
P 2700 2450
F 0 "T1" H 2700 2700 70  0000 C CNN
F 1 "TRANSFO4" H 2700 2150 70  0000 C CNN
F 2 "~" H 2700 2450 60  0000 C CNN
F 3 "~" H 2700 2450 60  0000 C CNN
	1    2700 2450
	-1   0    0    1   
$EndComp
Text HLabel 1600 2250 0    60   Input ~ 0
110AC_A
Text HLabel 1600 2650 0    60   Input ~ 0
110AC_B
Text HLabel 3600 1750 2    60   Output ~ 0
24AC_A
Text HLabel 3600 1950 2    60   Output ~ 0
24AC_B
$Comp
L DIODE D3
U 1 1 52C09F89
P 4700 2450
F 0 "D3" H 4700 2550 40  0000 C CNN
F 1 "DIODE" H 4700 2350 40  0000 C CNN
F 2 "~" H 4700 2450 60  0000 C CNN
F 3 "~" H 4700 2450 60  0000 C CNN
	1    4700 2450
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 52C09F96
P 4700 3250
F 0 "D4" H 4700 3350 40  0000 C CNN
F 1 "DIODE" H 4700 3150 40  0000 C CNN
F 2 "~" H 4700 3250 60  0000 C CNN
F 3 "~" H 4700 3250 60  0000 C CNN
	1    4700 3250
	1    0    0    -1  
$EndComp
$Comp
L DIODE D5
U 1 1 52C09F9C
P 5100 2850
F 0 "D5" H 5100 2950 40  0000 C CNN
F 1 "DIODE" H 5100 2750 40  0000 C CNN
F 2 "~" H 5100 2850 60  0000 C CNN
F 3 "~" H 5100 2850 60  0000 C CNN
	1    5100 2850
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D2
U 1 1 52C09FA7
P 4300 2850
F 0 "D2" H 4300 2950 40  0000 C CNN
F 1 "DIODE" H 4300 2750 40  0000 C CNN
F 2 "~" H 4300 2850 60  0000 C CNN
F 3 "~" H 4300 2850 60  0000 C CNN
	1    4300 2850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR016
U 1 1 52C0A006
P 4300 3900
F 0 "#PWR016" H 4300 3900 30  0001 C CNN
F 1 "GND" H 4300 3830 30  0001 C CNN
F 2 "" H 4300 3900 60  0000 C CNN
F 3 "" H 4300 3900 60  0000 C CNN
	1    4300 3900
	1    0    0    -1  
$EndComp
$Comp
L MC34063 U4
U 1 1 52C0A11B
P 7050 3850
F 0 "U4" H 7200 4200 60  0000 L CNN
F 1 "MC34063" H 7150 3500 60  0000 L CNN
F 2 "~" H 7050 3850 60  0000 C CNN
F 3 "~" H 7050 3850 60  0000 C CNN
	1    7050 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 2250 2300 2250
Wire Wire Line
	1600 2650 2300 2650
Wire Wire Line
	3100 2250 3300 2250
Wire Wire Line
	3300 2250 3300 1750
Wire Wire Line
	3300 1750 3600 1750
Wire Wire Line
	3100 2650 3500 2650
Wire Wire Line
	3500 1950 3500 3650
Wire Wire Line
	3500 1950 3600 1950
Wire Wire Line
	4300 2650 4300 2450
Wire Wire Line
	3100 2450 4500 2450
Connection ~ 4300 2450
Wire Wire Line
	4900 2450 7050 2450
Wire Wire Line
	5100 2450 5100 2650
Wire Wire Line
	5100 3050 5100 3650
Wire Wire Line
	5100 3250 4900 3250
Wire Wire Line
	4500 3250 4300 3250
Wire Wire Line
	4300 3050 4300 3900
Wire Wire Line
	5100 3650 3500 3650
Connection ~ 3500 2650
Connection ~ 5100 3250
Connection ~ 4300 3250
Wire Wire Line
	7900 3650 8000 3650
Wire Wire Line
	8000 3150 8000 3750
Wire Wire Line
	8000 3750 7900 3750
Wire Wire Line
	6100 3700 6200 3700
Wire Wire Line
	6100 2950 6100 3700
Wire Wire Line
	6100 3150 8000 3150
Connection ~ 8000 3650
$Comp
L R R5
U 1 1 52C0A275
P 6100 2700
F 0 "R5" V 6180 2700 40  0000 C CNN
F 1 "0.33" V 6107 2701 40  0000 C CNN
F 2 "~" V 6030 2700 30  0000 C CNN
F 3 "~" H 6100 2700 30  0000 C CNN
	1    6100 2700
	-1   0    0    1   
$EndComp
Connection ~ 6100 3150
Connection ~ 5100 2450
$Comp
L GND #PWR017
U 1 1 52C0A3DC
P 7050 4800
F 0 "#PWR017" H 7050 4800 30  0001 C CNN
F 1 "GND" H 7050 4730 30  0001 C CNN
F 2 "" H 7050 4800 60  0000 C CNN
F 3 "" H 7050 4800 60  0000 C CNN
	1    7050 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4350 7050 4800
$Comp
L CP C2
U 1 1 52C0A606
P 5800 2650
F 0 "C2" H 5850 2750 40  0000 L CNN
F 1 "100uF" H 5850 2550 40  0000 L CNN
F 2 "~" H 5900 2500 30  0000 C CNN
F 3 "~" H 5800 2650 300 0000 C CNN
	1    5800 2650
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR018
U 1 1 52C0A620
P 5800 3050
F 0 "#PWR018" H 5800 3050 30  0001 C CNN
F 1 "GND" H 5800 2980 30  0001 C CNN
F 2 "" H 5800 3050 60  0000 C CNN
F 3 "" H 5800 3050 60  0000 C CNN
	1    5800 3050
	1    0    0    -1  
$EndComp
Connection ~ 5800 2450
Wire Wire Line
	7050 2450 7050 3350
Connection ~ 6100 2450
Wire Wire Line
	5800 2850 5800 3050
$Comp
L CP C3
U 1 1 52C0A9DD
P 6000 4400
F 0 "C3" H 6050 4500 40  0000 L CNN
F 1 "100uF" H 6050 4300 40  0000 L CNN
F 2 "~" H 6100 4250 30  0000 C CNN
F 3 "~" H 6000 4400 300 0000 C CNN
	1    6000 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6000 4200 6000 4000
Wire Wire Line
	6000 4000 6200 4000
$Comp
L GND #PWR019
U 1 1 52C0AA07
P 6000 4800
F 0 "#PWR019" H 6000 4800 30  0001 C CNN
F 1 "GND" H 6000 4730 30  0001 C CNN
F 2 "" H 6000 4800 60  0000 C CNN
F 3 "" H 6000 4800 60  0000 C CNN
	1    6000 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4600 6000 4800
$Comp
L ZENER D6
U 1 1 52C0AC4B
P 8600 4300
F 0 "D6" H 8600 4400 50  0000 C CNN
F 1 "1N5819" H 8600 4200 40  0000 C CNN
F 2 "~" H 8600 4300 60  0000 C CNN
F 3 "~" H 8600 4300 60  0000 C CNN
	1    8600 4300
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 52C0AC5A
P 9100 4300
F 0 "L1" V 9050 4300 40  0000 C CNN
F 1 "220uH" V 9200 4300 40  0000 C CNN
F 2 "~" H 9100 4300 60  0000 C CNN
F 3 "~" H 9100 4300 60  0000 C CNN
	1    9100 4300
	1    0    0    -1  
$EndComp
$Comp
L CP C4
U 1 1 52C0AEBF
P 9100 5500
F 0 "C4" H 9150 5600 40  0000 L CNN
F 1 "100uF" H 9150 5400 40  0000 L CNN
F 2 "~" H 9200 5350 30  0000 C CNN
F 3 "~" H 9100 5500 300 0000 C CNN
	1    9100 5500
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR020
U 1 1 52C0AFEC
P 8600 4700
F 0 "#PWR020" H 8600 4700 30  0001 C CNN
F 1 "GND" H 8600 4630 30  0001 C CNN
F 2 "" H 8600 4700 60  0000 C CNN
F 3 "" H 8600 4700 60  0000 C CNN
	1    8600 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 4500 8600 4700
$Comp
L R R6
U 1 1 52C0B142
P 8000 5550
F 0 "R6" V 8080 5550 40  0000 C CNN
F 1 "1.2k" V 8007 5551 40  0000 C CNN
F 2 "~" V 7930 5550 30  0000 C CNN
F 3 "~" H 8000 5550 30  0000 C CNN
	1    8000 5550
	1    0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 52C0B27B
P 8450 5100
F 0 "R7" V 8530 5100 40  0000 C CNN
F 1 "1.2k" V 8457 5101 40  0000 C CNN
F 2 "~" V 8380 5100 30  0000 C CNN
F 3 "~" H 8450 5100 30  0000 C CNN
	1    8450 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7900 3900 9100 3900
Wire Wire Line
	9100 3900 9100 4000
Wire Wire Line
	8600 4100 8600 3900
Connection ~ 8600 3900
Wire Wire Line
	8000 5300 8000 4050
Wire Wire Line
	8000 4050 7900 4050
Wire Wire Line
	8200 5100 8000 5100
Connection ~ 8000 5100
Wire Wire Line
	9100 4600 9100 5300
Wire Wire Line
	8700 5100 9700 5100
Connection ~ 9100 5100
$Comp
L GND #PWR021
U 1 1 52C0B745
P 9100 6000
F 0 "#PWR021" H 9100 6000 30  0001 C CNN
F 1 "GND" H 9100 5930 30  0001 C CNN
F 2 "" H 9100 6000 60  0000 C CNN
F 3 "" H 9100 6000 60  0000 C CNN
	1    9100 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 5700 9100 6000
$Comp
L GND #PWR022
U 1 1 52C0B77E
P 8000 6000
F 0 "#PWR022" H 8000 6000 30  0001 C CNN
F 1 "GND" H 8000 5930 30  0001 C CNN
F 2 "" H 8000 6000 60  0000 C CNN
F 3 "" H 8000 6000 60  0000 C CNN
	1    8000 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 5800 8000 6000
Text HLabel 9700 5100 2    60   Output ~ 0
5V_1A
$Comp
L PWR_FLAG #FLG023
U 1 1 52BFCE67
P 6800 2400
F 0 "#FLG023" H 6800 2495 30  0001 C CNN
F 1 "PWR_FLAG" H 6800 2580 30  0000 C CNN
F 2 "" H 6800 2400 60  0000 C CNN
F 3 "" H 6800 2400 60  0000 C CNN
	1    6800 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 2400 6800 2450
Connection ~ 6800 2450
$EndSCHEMATC

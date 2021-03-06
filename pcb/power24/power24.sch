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
LIBS:power24-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Control Logic"
Date "22 mar 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PWR_FLAG #FLG1
U 1 1 52BF56F5
P 700 7300
F 0 "#FLG1" H 700 7395 30  0001 C CNN
F 1 "PWR_FLAG" H 700 7480 30  0000 C CNN
F 2 "" H 700 7300 60  0000 C CNN
F 3 "" H 700 7300 60  0000 C CNN
	1    700  7300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 52BF5770
P 700 7600
F 0 "#PWR1" H 700 7600 30  0001 C CNN
F 1 "GND" H 700 7530 30  0001 C CNN
F 2 "" H 700 7600 60  0000 C CNN
F 3 "" H 700 7600 60  0000 C CNN
	1    700  7600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG2
U 1 1 52BF581F
P 1000 7300
F 0 "#FLG2" H 1000 7395 30  0001 C CNN
F 1 "PWR_FLAG" H 1000 7480 30  0000 C CNN
F 2 "" H 1000 7300 60  0000 C CNN
F 3 "" H 1000 7300 60  0000 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR2
U 1 1 52BF5827
P 1000 7600
F 0 "#PWR2" H 1000 7690 20  0001 C CNN
F 1 "+5V" H 1000 7690 30  0000 C CNN
F 2 "" H 1000 7600 60  0000 C CNN
F 3 "" H 1000 7600 60  0000 C CNN
	1    1000 7600
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 7300 1000 7600
Wire Wire Line
	700  7300 700  7600
Text Notes 1450 2200 2    60   ~ 0
24V AC
$Comp
L DIODE D2
U 1 1 52C72398
P 2600 2500
F 0 "D2" H 2600 2600 40  0000 C CNN
F 1 "DIODE" H 2600 2400 40  0000 C CNN
F 2 "~" H 2600 2500 60  0000 C CNN
F 3 "~" H 2600 2500 60  0000 C CNN
	1    2600 2500
	1    0    0    -1  
$EndComp
$Comp
L DIODE D3
U 1 1 52C7239E
P 2600 3300
F 0 "D3" H 2600 3400 40  0000 C CNN
F 1 "DIODE" H 2600 3200 40  0000 C CNN
F 2 "~" H 2600 3300 60  0000 C CNN
F 3 "~" H 2600 3300 60  0000 C CNN
	1    2600 3300
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 52C723A4
P 3000 2900
F 0 "D4" H 3000 3000 40  0000 C CNN
F 1 "DIODE" H 3000 2800 40  0000 C CNN
F 2 "~" H 3000 2900 60  0000 C CNN
F 3 "~" H 3000 2900 60  0000 C CNN
	1    3000 2900
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D1
U 1 1 52C723AA
P 2200 2900
F 0 "D1" H 2200 3000 40  0000 C CNN
F 1 "DIODE" H 2200 2800 40  0000 C CNN
F 2 "~" H 2200 2900 60  0000 C CNN
F 3 "~" H 2200 2900 60  0000 C CNN
	1    2200 2900
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR3
U 1 1 52C723B0
P 2200 3950
F 0 "#PWR3" H 2200 3950 30  0001 C CNN
F 1 "GND" H 2200 3880 30  0001 C CNN
F 2 "" H 2200 3950 60  0000 C CNN
F 3 "" H 2200 3950 60  0000 C CNN
	1    2200 3950
	1    0    0    -1  
$EndComp
$Comp
L MC34063 U1
U 1 1 52C723B6
P 5500 3900
F 0 "U1" H 5650 4250 60  0000 L CNN
F 1 "MC34063" H 5600 3550 60  0000 L CNN
F 2 "~" H 5500 3900 60  0000 C CNN
F 3 "~" H 5500 3900 60  0000 C CNN
	1    5500 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2500 3000 2700
Wire Wire Line
	3000 3100 3000 3700
Wire Wire Line
	3000 3300 2800 3300
Wire Wire Line
	2400 3300 2200 3300
Wire Wire Line
	2200 3100 2200 3950
Connection ~ 3000 3300
Connection ~ 2200 3300
Wire Wire Line
	6350 3700 6450 3700
Wire Wire Line
	6450 3200 6450 3800
Wire Wire Line
	6450 3800 6350 3800
Wire Wire Line
	4550 3750 4650 3750
Wire Wire Line
	4550 3000 4550 3750
Wire Wire Line
	4550 3200 6450 3200
Connection ~ 6450 3700
$Comp
L R R2
U 1 1 52C723D8
P 4550 2750
F 0 "R2" V 4630 2750 40  0000 C CNN
F 1 "0.25" V 4557 2751 40  0000 C CNN
F 2 "~" V 4480 2750 30  0000 C CNN
F 3 "~" H 4550 2750 30  0000 C CNN
	1    4550 2750
	-1   0    0    1   
$EndComp
Connection ~ 4550 3200
Connection ~ 3000 2500
$Comp
L GND #PWR7
U 1 1 52C723E0
P 5500 4850
F 0 "#PWR7" H 5500 4850 30  0001 C CNN
F 1 "GND" H 5500 4780 30  0001 C CNN
F 2 "" H 5500 4850 60  0000 C CNN
F 3 "" H 5500 4850 60  0000 C CNN
	1    5500 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4400 5500 4850
$Comp
L CP C1
U 1 1 52C723E7
P 4000 2750
F 0 "C1" H 4050 2850 40  0000 L CNN
F 1 "2200 uF" H 4050 2650 40  0000 L CNN
F 2 "~" H 4100 2600 30  0000 C CNN
F 3 "~" H 4000 2750 300 0000 C CNN
	1    4000 2750
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR5
U 1 1 52C723ED
P 4000 3100
F 0 "#PWR5" H 4000 3100 30  0001 C CNN
F 1 "GND" H 4000 3030 30  0001 C CNN
F 2 "" H 4000 3100 60  0000 C CNN
F 3 "" H 4000 3100 60  0000 C CNN
	1    4000 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2500 5500 3400
Connection ~ 4550 2500
$Comp
L CP C2
U 1 1 52C723F7
P 4450 4450
F 0 "C2" H 4500 4550 40  0000 L CNN
F 1 "1000 pF" H 4500 4350 40  0000 L CNN
F 2 "~" H 4550 4300 30  0000 C CNN
F 3 "~" H 4450 4450 300 0000 C CNN
	1    4450 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4450 4050 4650 4050
$Comp
L GND #PWR6
U 1 1 52C723FF
P 4450 4850
F 0 "#PWR6" H 4450 4850 30  0001 C CNN
F 1 "GND" H 4450 4780 30  0001 C CNN
F 2 "" H 4450 4850 60  0000 C CNN
F 3 "" H 4450 4850 60  0000 C CNN
	1    4450 4850
	1    0    0    -1  
$EndComp
$Comp
L ZENER D5
U 1 1 52C72406
P 7050 4350
F 0 "D5" H 7050 4450 50  0000 C CNN
F 1 "1N5819" H 7050 4250 40  0000 C CNN
F 2 "~" H 7050 4350 60  0000 C CNN
F 3 "~" H 7050 4350 60  0000 C CNN
	1    7050 4350
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 52C7240C
P 7550 4350
F 0 "L1" V 7500 4350 40  0000 C CNN
F 1 "220uH" V 7650 4350 40  0000 C CNN
F 2 "~" H 7550 4350 60  0000 C CNN
F 3 "~" H 7550 4350 60  0000 C CNN
	1    7550 4350
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 52C72412
P 7550 5550
F 0 "C3" H 7600 5650 40  0000 L CNN
F 1 "180 uF" H 7600 5450 40  0000 L CNN
F 2 "~" H 7650 5400 30  0000 C CNN
F 3 "~" H 7550 5550 300 0000 C CNN
	1    7550 5550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR9
U 1 1 52C72418
P 7050 4750
F 0 "#PWR9" H 7050 4750 30  0001 C CNN
F 1 "GND" H 7050 4680 30  0001 C CNN
F 2 "" H 7050 4750 60  0000 C CNN
F 3 "" H 7050 4750 60  0000 C CNN
	1    7050 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4550 7050 4750
$Comp
L R R3
U 1 1 52C7241F
P 6450 5600
F 0 "R3" V 6530 5600 40  0000 C CNN
F 1 "3k" V 6457 5601 40  0000 C CNN
F 2 "~" V 6380 5600 30  0000 C CNN
F 3 "~" H 6450 5600 30  0000 C CNN
	1    6450 5600
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 52C72425
P 6900 5150
F 0 "R4" V 6980 5150 40  0000 C CNN
F 1 "5k" V 6907 5151 40  0000 C CNN
F 2 "~" V 6830 5150 30  0000 C CNN
F 3 "~" H 6900 5150 30  0000 C CNN
	1    6900 5150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6350 3950 7550 3950
Wire Wire Line
	7550 3950 7550 4050
Wire Wire Line
	7050 4150 7050 3950
Connection ~ 7050 3950
Wire Wire Line
	6450 5350 6450 4100
Wire Wire Line
	6450 4100 6350 4100
Wire Wire Line
	6650 5150 6450 5150
Connection ~ 6450 5150
Connection ~ 7550 5150
$Comp
L GND #PWR10
U 1 1 52C72435
P 7550 6050
F 0 "#PWR10" H 7550 6050 30  0001 C CNN
F 1 "GND" H 7550 5980 30  0001 C CNN
F 2 "" H 7550 6050 60  0000 C CNN
F 3 "" H 7550 6050 60  0000 C CNN
	1    7550 6050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR8
U 1 1 52C7243C
P 6450 6050
F 0 "#PWR8" H 6450 6050 30  0001 C CNN
F 1 "GND" H 6450 5980 30  0001 C CNN
F 2 "" H 6450 6050 60  0000 C CNN
F 3 "" H 6450 6050 60  0000 C CNN
	1    6450 6050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 5850 6450 6050
$Comp
L PWR_FLAG #FLG3
U 1 1 52C72444
P 5250 2450
F 0 "#FLG3" H 5250 2545 30  0001 C CNN
F 1 "PWR_FLAG" H 5250 2630 30  0000 C CNN
F 2 "" H 5250 2450 60  0000 C CNN
F 3 "" H 5250 2450 60  0000 C CNN
	1    5250 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 2500 5250 2450
Connection ~ 5250 2500
$Comp
L INDUCTOR L2
U 1 1 52C7244C
P 8400 5150
F 0 "L2" V 8350 5150 40  0000 C CNN
F 1 "1.0 uH" V 8500 5150 40  0000 C CNN
F 2 "~" H 8400 5150 60  0000 C CNN
F 3 "~" H 8400 5150 60  0000 C CNN
	1    8400 5150
	0    -1   -1   0   
$EndComp
$Comp
L CP C4
U 1 1 52C72452
P 9000 5550
F 0 "C4" H 9050 5650 40  0000 L CNN
F 1 "1.0 uF" H 9050 5450 40  0000 L CNN
F 2 "~" H 9100 5400 30  0000 C CNN
F 3 "~" H 9000 5550 300 0000 C CNN
	1    9000 5550
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7150 5150 8100 5150
Connection ~ 9000 5150
$Comp
L GND #PWR11
U 1 1 52C7245C
P 9000 6050
F 0 "#PWR11" H 9000 6050 30  0001 C CNN
F 1 "GND" H 9000 5980 30  0001 C CNN
F 2 "" H 9000 6050 60  0000 C CNN
F 3 "" H 9000 6050 60  0000 C CNN
	1    9000 6050
	1    0    0    -1  
$EndComp
Text Notes 4650 1750 2    60   ~ 0
24V AC
Wire Wire Line
	3000 3700 1950 3700
Wire Wire Line
	2800 2500 5500 2500
$Comp
L R R1
U 1 1 52C72B3E
P 3500 2750
F 0 "R1" V 3580 2750 40  0000 C CNN
F 1 "0.5M" V 3507 2751 40  0000 C CNN
F 2 "~" V 3430 2750 30  0000 C CNN
F 3 "~" H 3500 2750 30  0000 C CNN
	1    3500 2750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR4
U 1 1 52C72B44
P 3500 3100
F 0 "#PWR4" H 3500 3100 30  0001 C CNN
F 1 "GND" H 3500 3030 30  0001 C CNN
F 2 "" H 3500 3100 60  0000 C CNN
F 3 "" H 3500 3100 60  0000 C CNN
	1    3500 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3000 3500 3100
Connection ~ 3500 2500
Text Notes 10250 5000 2    60   ~ 0
5V DC\n600 mA
$Comp
L GND #PWR13
U 1 1 52C71E52
P 10550 6400
F 0 "#PWR13" H 10550 6400 30  0001 C CNN
F 1 "GND" H 10550 6330 30  0001 C CNN
F 2 "" H 10550 6400 60  0000 C CNN
F 3 "" H 10550 6400 60  0000 C CNN
	1    10550 6400
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 52C720F9
P 2850 1200
F 0 "F1" H 2950 1250 40  0000 C CNN
F 1 "1A" H 2750 1150 40  0000 C CNN
F 2 "~" H 2850 1200 60  0000 C CNN
F 3 "~" H 2850 1200 60  0000 C CNN
	1    2850 1200
	1    0    0    -1  
$EndComp
Connection ~ 4100 2300
Connection ~ 4000 2300
$Comp
L CONN_3X2 P1
U 1 1 52C767AF
P 4150 1750
F 0 "P1" H 4150 2000 50  0000 C CNN
F 1 "CONN_3X2" V 4150 1800 40  0000 C CNN
F 2 "~" H 4150 1750 60  0000 C CNN
F 3 "~" H 4150 1750 60  0000 C CNN
	1    4150 1750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3100 1200 4200 1200
Wire Wire Line
	4200 2300 4200 2150
Wire Wire Line
	4100 2300 4100 2150
Wire Wire Line
	4000 2150 4000 2300
Wire Wire Line
	4200 1200 4200 1350
Wire Wire Line
	4100 1350 4100 1200
Connection ~ 4100 1200
Wire Wire Line
	4000 1350 4000 1200
Connection ~ 4000 1200
Wire Wire Line
	4000 2550 4000 2500
Connection ~ 4000 2500
Wire Wire Line
	4000 2950 4000 3100
Wire Wire Line
	4450 4250 4450 4050
Wire Wire Line
	4450 4650 4450 4850
Wire Wire Line
	9000 5350 9000 5150
Wire Wire Line
	9000 5750 9000 6050
Wire Wire Line
	7550 4650 7550 5350
Wire Wire Line
	7550 5750 7550 6050
$Comp
L CONN_4X2 P2
U 1 1 53137A3A
P 10400 5700
F 0 "P2" V 10400 6000 50  0000 C CNN
F 1 "CONN_4X2" V 10400 5700 40  0000 C CNN
F 2 "~" H 10400 5700 60  0000 C CNN
F 3 "~" H 10400 5700 60  0000 C CNN
	1    10400 5700
	0    -1   -1   0   
$EndComp
$Comp
L CONN_2 P3
U 1 1 53140D0A
P 1250 2400
F 0 "P3" V 1200 2400 40  0000 C CNN
F 1 "CONN_2" V 1300 2400 40  0000 C CNN
F 2 "~" H 1250 2400 60  0000 C CNN
F 3 "~" H 1250 2400 60  0000 C CNN
	1    1250 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2200 1200 2200 2700
Connection ~ 2200 2500
Wire Wire Line
	1600 2500 2400 2500
Wire Wire Line
	1600 2300 4200 2300
Wire Wire Line
	2200 1200 2600 1200
Wire Wire Line
	1950 3700 1950 2300
Connection ~ 1950 2300
$Comp
L LED D6
U 1 1 53164D47
P 9600 5550
F 0 "D6" H 9600 5650 50  0000 C CNN
F 1 "LED" H 9600 5450 50  0000 C CNN
F 2 "~" H 9600 5550 60  0000 C CNN
F 3 "~" H 9600 5550 60  0000 C CNN
	1    9600 5550
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 53164D7D
P 9600 6200
F 0 "R5" V 9680 6200 40  0000 C CNN
F 1 "330" V 9607 6201 40  0000 C CNN
F 2 "~" V 9530 6200 30  0000 C CNN
F 3 "~" H 9600 6200 30  0000 C CNN
	1    9600 6200
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR12
U 1 1 53164DB4
P 9600 6650
F 0 "#PWR12" H 9600 6650 30  0001 C CNN
F 1 "GND" H 9600 6580 30  0001 C CNN
F 2 "" H 9600 6650 60  0000 C CNN
F 3 "" H 9600 6650 60  0000 C CNN
	1    9600 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 5150 10550 5150
Wire Wire Line
	10550 5150 10550 5300
Wire Wire Line
	9600 5350 9600 5150
Connection ~ 9600 5150
Wire Wire Line
	9600 5750 9600 5950
Wire Wire Line
	9600 6450 9600 6650
Wire Wire Line
	10250 6100 10250 6200
Wire Wire Line
	10250 6200 10550 6200
Wire Wire Line
	10550 6100 10550 6400
Wire Wire Line
	10450 6100 10450 6200
Connection ~ 10450 6200
Wire Wire Line
	10350 6100 10350 6200
Connection ~ 10350 6200
Connection ~ 10550 6200
Wire Wire Line
	10450 5300 10450 5150
Connection ~ 10450 5150
Wire Wire Line
	10350 5300 10350 5150
Connection ~ 10350 5150
Wire Wire Line
	10250 5300 10250 5150
Connection ~ 10250 5150
$EndSCHEMATC

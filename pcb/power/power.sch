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
LIBS:local
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Control Logic"
Date "6 jan 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PWR_FLAG #FLG01
U 1 1 52BF56F5
P 700 7300
F 0 "#FLG01" H 700 7395 30  0001 C CNN
F 1 "PWR_FLAG" H 700 7480 30  0000 C CNN
F 2 "" H 700 7300 60  0000 C CNN
F 3 "" H 700 7300 60  0000 C CNN
	1    700  7300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR02
U 1 1 52BF5770
P 700 7600
F 0 "#PWR02" H 700 7600 30  0001 C CNN
F 1 "GND" H 700 7530 30  0001 C CNN
F 2 "" H 700 7600 60  0000 C CNN
F 3 "" H 700 7600 60  0000 C CNN
	1    700  7600
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG03
U 1 1 52BF581F
P 1000 7300
F 0 "#FLG03" H 1000 7395 30  0001 C CNN
F 1 "PWR_FLAG" H 1000 7480 30  0000 C CNN
F 2 "" H 1000 7300 60  0000 C CNN
F 3 "" H 1000 7300 60  0000 C CNN
	1    1000 7300
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR04
U 1 1 52BF5827
P 1000 7600
F 0 "#PWR04" H 1000 7690 20  0001 C CNN
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
Text Notes 1150 1900 2    60   ~ 0
110V AC
$Comp
L CONN_3 K1
U 1 1 52C02A8A
P 950 2100
F 0 "K1" V 900 2100 50  0000 C CNN
F 1 "CONN_3" V 1000 2100 40  0000 C CNN
F 2 "~" H 950 2100 60  0000 C CNN
F 3 "~" H 950 2100 60  0000 C CNN
	1    950  2100
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 52C03803
P 1500 1950
F 0 "#PWR05" H 1500 1950 30  0001 C CNN
F 1 "GND" H 1500 1880 30  0001 C CNN
F 2 "" H 1500 1950 60  0000 C CNN
F 3 "" H 1500 1950 60  0000 C CNN
	1    1500 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 2000 1300 1850
Wire Wire Line
	1300 1850 1500 1850
Wire Wire Line
	1500 1850 1500 1950
$Comp
L DIODE D2
U 1 1 52C72398
P 3500 2300
F 0 "D2" H 3500 2400 40  0000 C CNN
F 1 "DIODE" H 3500 2200 40  0000 C CNN
F 2 "~" H 3500 2300 60  0000 C CNN
F 3 "~" H 3500 2300 60  0000 C CNN
	1    3500 2300
	1    0    0    -1  
$EndComp
$Comp
L DIODE D3
U 1 1 52C7239E
P 3500 3100
F 0 "D3" H 3500 3200 40  0000 C CNN
F 1 "DIODE" H 3500 3000 40  0000 C CNN
F 2 "~" H 3500 3100 60  0000 C CNN
F 3 "~" H 3500 3100 60  0000 C CNN
	1    3500 3100
	1    0    0    -1  
$EndComp
$Comp
L DIODE D4
U 1 1 52C723A4
P 3900 2700
F 0 "D4" H 3900 2800 40  0000 C CNN
F 1 "DIODE" H 3900 2600 40  0000 C CNN
F 2 "~" H 3900 2700 60  0000 C CNN
F 3 "~" H 3900 2700 60  0000 C CNN
	1    3900 2700
	0    -1   -1   0   
$EndComp
$Comp
L DIODE D1
U 1 1 52C723AA
P 3100 2700
F 0 "D1" H 3100 2800 40  0000 C CNN
F 1 "DIODE" H 3100 2600 40  0000 C CNN
F 2 "~" H 3100 2700 60  0000 C CNN
F 3 "~" H 3100 2700 60  0000 C CNN
	1    3100 2700
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR06
U 1 1 52C723B0
P 3100 3750
F 0 "#PWR06" H 3100 3750 30  0001 C CNN
F 1 "GND" H 3100 3680 30  0001 C CNN
F 2 "" H 3100 3750 60  0000 C CNN
F 3 "" H 3100 3750 60  0000 C CNN
	1    3100 3750
	1    0    0    -1  
$EndComp
$Comp
L MC34063 U1
U 1 1 52C723B6
P 6400 3700
F 0 "U1" H 6550 4050 60  0000 L CNN
F 1 "MC34063" H 6500 3350 60  0000 L CNN
F 2 "~" H 6400 3700 60  0000 C CNN
F 3 "~" H 6400 3700 60  0000 C CNN
	1    6400 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2300 3900 2500
Wire Wire Line
	3900 2900 3900 3500
Wire Wire Line
	3900 3100 3700 3100
Wire Wire Line
	3300 3100 3100 3100
Wire Wire Line
	3100 2900 3100 3750
Connection ~ 3900 3100
Connection ~ 3100 3100
Wire Wire Line
	7250 3500 7350 3500
Wire Wire Line
	7350 3000 7350 3600
Wire Wire Line
	7350 3600 7250 3600
Wire Wire Line
	5450 3550 5550 3550
Wire Wire Line
	5450 2800 5450 3550
Wire Wire Line
	5450 3000 7350 3000
Connection ~ 7350 3500
$Comp
L R R2
U 1 1 52C723D8
P 5450 2550
F 0 "R2" V 5530 2550 40  0000 C CNN
F 1 "0.25" V 5457 2551 40  0000 C CNN
F 2 "~" V 5380 2550 30  0000 C CNN
F 3 "~" H 5450 2550 30  0000 C CNN
	1    5450 2550
	-1   0    0    1   
$EndComp
Connection ~ 5450 3000
Connection ~ 3900 2300
$Comp
L GND #PWR07
U 1 1 52C723E0
P 6400 4650
F 0 "#PWR07" H 6400 4650 30  0001 C CNN
F 1 "GND" H 6400 4580 30  0001 C CNN
F 2 "" H 6400 4650 60  0000 C CNN
F 3 "" H 6400 4650 60  0000 C CNN
	1    6400 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 4200 6400 4650
$Comp
L CP C1
U 1 1 52C723E7
P 4900 2550
F 0 "C1" H 4950 2650 40  0000 L CNN
F 1 "2200 uF" H 4950 2450 40  0000 L CNN
F 2 "~" H 5000 2400 30  0000 C CNN
F 3 "~" H 4900 2550 300 0000 C CNN
	1    4900 2550
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR08
U 1 1 52C723ED
P 4900 2900
F 0 "#PWR08" H 4900 2900 30  0001 C CNN
F 1 "GND" H 4900 2830 30  0001 C CNN
F 2 "" H 4900 2900 60  0000 C CNN
F 3 "" H 4900 2900 60  0000 C CNN
	1    4900 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 2300 6400 3200
Connection ~ 5450 2300
$Comp
L CP C2
U 1 1 52C723F7
P 5350 4250
F 0 "C2" H 5400 4350 40  0000 L CNN
F 1 "470 pF" H 5400 4150 40  0000 L CNN
F 2 "~" H 5450 4100 30  0000 C CNN
F 3 "~" H 5350 4250 300 0000 C CNN
	1    5350 4250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5350 3850 5550 3850
$Comp
L GND #PWR09
U 1 1 52C723FF
P 5350 4650
F 0 "#PWR09" H 5350 4650 30  0001 C CNN
F 1 "GND" H 5350 4580 30  0001 C CNN
F 2 "" H 5350 4650 60  0000 C CNN
F 3 "" H 5350 4650 60  0000 C CNN
	1    5350 4650
	1    0    0    -1  
$EndComp
$Comp
L ZENER D5
U 1 1 52C72406
P 7950 4150
F 0 "D5" H 7950 4250 50  0000 C CNN
F 1 "1N5819" H 7950 4050 40  0000 C CNN
F 2 "~" H 7950 4150 60  0000 C CNN
F 3 "~" H 7950 4150 60  0000 C CNN
	1    7950 4150
	0    -1   -1   0   
$EndComp
$Comp
L INDUCTOR L1
U 1 1 52C7240C
P 8450 4150
F 0 "L1" V 8400 4150 40  0000 C CNN
F 1 "220uH" V 8550 4150 40  0000 C CNN
F 2 "~" H 8450 4150 60  0000 C CNN
F 3 "~" H 8450 4150 60  0000 C CNN
	1    8450 4150
	1    0    0    -1  
$EndComp
$Comp
L CP C3
U 1 1 52C72412
P 8450 5350
F 0 "C3" H 8500 5450 40  0000 L CNN
F 1 "180 uF" H 8500 5250 40  0000 L CNN
F 2 "~" H 8550 5200 30  0000 C CNN
F 3 "~" H 8450 5350 300 0000 C CNN
	1    8450 5350
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 52C72418
P 7950 4550
F 0 "#PWR010" H 7950 4550 30  0001 C CNN
F 1 "GND" H 7950 4480 30  0001 C CNN
F 2 "" H 7950 4550 60  0000 C CNN
F 3 "" H 7950 4550 60  0000 C CNN
	1    7950 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4350 7950 4550
$Comp
L R R3
U 1 1 52C7241F
P 7350 5400
F 0 "R3" V 7430 5400 40  0000 C CNN
F 1 "2.2k" V 7357 5401 40  0000 C CNN
F 2 "~" V 7280 5400 30  0000 C CNN
F 3 "~" H 7350 5400 30  0000 C CNN
	1    7350 5400
	1    0    0    -1  
$EndComp
$Comp
L R R4
U 1 1 52C72425
P 7800 4950
F 0 "R4" V 7880 4950 40  0000 C CNN
F 1 "6.6k" V 7807 4951 40  0000 C CNN
F 2 "~" V 7730 4950 30  0000 C CNN
F 3 "~" H 7800 4950 30  0000 C CNN
	1    7800 4950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7250 3750 8450 3750
Wire Wire Line
	8450 3750 8450 3850
Wire Wire Line
	7950 3950 7950 3750
Connection ~ 7950 3750
Wire Wire Line
	7350 5150 7350 3900
Wire Wire Line
	7350 3900 7250 3900
Wire Wire Line
	7550 4950 7350 4950
Connection ~ 7350 4950
Connection ~ 8450 4950
$Comp
L GND #PWR011
U 1 1 52C72435
P 8450 5850
F 0 "#PWR011" H 8450 5850 30  0001 C CNN
F 1 "GND" H 8450 5780 30  0001 C CNN
F 2 "" H 8450 5850 60  0000 C CNN
F 3 "" H 8450 5850 60  0000 C CNN
	1    8450 5850
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR012
U 1 1 52C7243C
P 7350 5850
F 0 "#PWR012" H 7350 5850 30  0001 C CNN
F 1 "GND" H 7350 5780 30  0001 C CNN
F 2 "" H 7350 5850 60  0000 C CNN
F 3 "" H 7350 5850 60  0000 C CNN
	1    7350 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 5650 7350 5850
$Comp
L PWR_FLAG #FLG013
U 1 1 52C72444
P 6150 2250
F 0 "#FLG013" H 6150 2345 30  0001 C CNN
F 1 "PWR_FLAG" H 6150 2430 30  0000 C CNN
F 2 "" H 6150 2250 60  0000 C CNN
F 3 "" H 6150 2250 60  0000 C CNN
	1    6150 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 2300 6150 2250
Connection ~ 6150 2300
$Comp
L INDUCTOR L2
U 1 1 52C7244C
P 9300 4950
F 0 "L2" V 9250 4950 40  0000 C CNN
F 1 "1.0 uH" V 9400 4950 40  0000 C CNN
F 2 "~" H 9300 4950 60  0000 C CNN
F 3 "~" H 9300 4950 60  0000 C CNN
	1    9300 4950
	0    -1   -1   0   
$EndComp
$Comp
L CP C4
U 1 1 52C72452
P 9900 5350
F 0 "C4" H 9950 5450 40  0000 L CNN
F 1 "1.0 uF" H 9950 5250 40  0000 L CNN
F 2 "~" H 10000 5200 30  0000 C CNN
F 3 "~" H 9900 5350 300 0000 C CNN
	1    9900 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8050 4950 9000 4950
Wire Wire Line
	9600 4950 10750 4950
Connection ~ 9900 4950
$Comp
L GND #PWR014
U 1 1 52C7245C
P 9900 5850
F 0 "#PWR014" H 9900 5850 30  0001 C CNN
F 1 "GND" H 9900 5780 30  0001 C CNN
F 2 "" H 9900 5850 60  0000 C CNN
F 3 "" H 9900 5850 60  0000 C CNN
	1    9900 5850
	1    0    0    -1  
$EndComp
Text Notes 5550 1450 2    60   ~ 0
24V AC
Wire Wire Line
	3100 2300 3100 2500
Connection ~ 3100 2300
Wire Wire Line
	3900 3500 2850 3500
Wire Wire Line
	3700 2300 6400 2300
$Comp
L R R1
U 1 1 52C72B3E
P 4400 2550
F 0 "R1" V 4480 2550 40  0000 C CNN
F 1 "0.5M" V 4407 2551 40  0000 C CNN
F 2 "~" V 4330 2550 30  0000 C CNN
F 3 "~" H 4400 2550 30  0000 C CNN
	1    4400 2550
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR015
U 1 1 52C72B44
P 4400 2900
F 0 "#PWR015" H 4400 2900 30  0001 C CNN
F 1 "GND" H 4400 2830 30  0001 C CNN
F 2 "" H 4400 2900 60  0000 C CNN
F 3 "" H 4400 2900 60  0000 C CNN
	1    4400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2800 4400 2900
Connection ~ 4400 2300
Text Notes 10800 4800 2    60   ~ 0
5V DC\n600 mA
$Comp
L GND #PWR016
U 1 1 52C71E52
P 10650 6050
F 0 "#PWR016" H 10650 6050 30  0001 C CNN
F 1 "GND" H 10650 5980 30  0001 C CNN
F 2 "" H 10650 6050 60  0000 C CNN
F 3 "" H 10650 6050 60  0000 C CNN
	1    10650 6050
	1    0    0    -1  
$EndComp
$Comp
L FUSE F1
U 1 1 52C720F9
P 3750 900
F 0 "F1" H 3850 950 40  0000 C CNN
F 1 "1A" H 3650 850 40  0000 C CNN
F 2 "~" H 3750 900 60  0000 C CNN
F 3 "~" H 3750 900 60  0000 C CNN
	1    3750 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3500 2850 2000
Wire Wire Line
	2850 2000 5100 2000
Wire Wire Line
	2700 2100 2700 900 
Wire Wire Line
	2700 900  3500 900 
Wire Wire Line
	2450 2100 2700 2100
Connection ~ 5000 2000
Connection ~ 4900 2000
$Comp
L CONN_3X2 P1
U 1 1 52C767AF
P 5050 1450
F 0 "P1" H 5050 1700 50  0000 C CNN
F 1 "CONN_3X2" V 5050 1500 40  0000 C CNN
F 2 "~" H 5050 1450 60  0000 C CNN
F 3 "~" H 5050 1450 60  0000 C CNN
	1    5050 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4000 900  5100 900 
Wire Wire Line
	5100 2000 5100 1850
Wire Wire Line
	5000 1850 5000 2000
Wire Wire Line
	4900 1850 4900 2000
Wire Wire Line
	5100 900  5100 1050
Wire Wire Line
	5000 1050 5000 900 
Connection ~ 5000 900 
Wire Wire Line
	4900 1050 4900 900 
Connection ~ 4900 900 
$Comp
L CONN_3X2 P2
U 1 1 52C76BB5
P 10700 5450
F 0 "P2" H 10700 5700 50  0000 C CNN
F 1 "CONN_3X2" V 10700 5500 40  0000 C CNN
F 2 "~" H 10700 5450 60  0000 C CNN
F 3 "~" H 10700 5450 60  0000 C CNN
	1    10700 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10750 4950 10750 5050
Wire Wire Line
	10650 5050 10650 4950
Connection ~ 10650 4950
Wire Wire Line
	10550 5050 10550 4950
Connection ~ 10550 4950
Wire Wire Line
	10650 6050 10650 5850
Wire Wire Line
	10750 5950 10750 5850
Wire Wire Line
	10550 5950 10750 5950
Connection ~ 10650 5950
Wire Wire Line
	10550 5850 10550 5950
$Comp
L TRANSFORMER_F24-800-C2 T1
U 1 1 52CB0ADB
P 2050 2400
F 0 "T1" H 2050 2800 70  0000 C CNN
F 1 "TRANSFORMER_F24-800-C2" H 2150 2000 70  0000 C CNN
F 2 "~" H 2050 2400 60  0000 C CNN
F 3 "~" H 2050 2400 60  0000 C CNN
	1    2050 2400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2450 2300 3300 2300
Wire Wire Line
	2500 2300 2500 2500
Wire Wire Line
	2500 2500 2450 2500
Wire Wire Line
	2450 2700 2850 2700
Connection ~ 2850 2700
Connection ~ 2500 2300
Wire Wire Line
	1300 2200 1550 2200
Wire Wire Line
	1550 2200 1550 2100
Wire Wire Line
	1550 2100 1650 2100
Wire Wire Line
	1300 2100 1450 2100
Wire Wire Line
	1450 2100 1450 2700
Wire Wire Line
	1450 2700 1650 2700
Wire Wire Line
	4900 2350 4900 2300
Connection ~ 4900 2300
Wire Wire Line
	4900 2750 4900 2900
Wire Wire Line
	5350 4050 5350 3850
Wire Wire Line
	5350 4450 5350 4650
Wire Wire Line
	9900 5150 9900 4950
Wire Wire Line
	9900 5550 9900 5850
Wire Wire Line
	8450 4450 8450 5150
Wire Wire Line
	8450 5550 8450 5850
$EndSCHEMATC

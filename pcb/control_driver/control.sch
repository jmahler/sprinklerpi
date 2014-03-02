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
LIBS:control_driver-cache
EELAYER 27 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 10
Title ""
Date "2 mar 2014"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74HC238 U2
U 1 1 52BF3BA1
P 6550 5100
F 0 "U2" H 6650 5600 60  0000 C CNN
F 1 "74HC238" H 6700 4551 60  0000 C CNN
F 2 "~" H 6550 5100 60  0000 C CNN
F 3 "~" H 6550 5100 60  0000 C CNN
	1    6550 5100
	0    1    1    0   
$EndComp
$Comp
L 74HC194 U1
U 1 1 52BF3BA7
P 6450 3000
F 0 "U1" H 6550 3000 60  0000 C CNN
F 1 "74HC194" H 6550 2850 60  0000 C CNN
F 2 "~" H 6450 3000 60  0000 C CNN
F 3 "~" H 6450 3000 60  0000 C CNN
	1    6450 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	6200 4500 6200 4450
Wire Wire Line
	6200 4450 6300 4450
Wire Wire Line
	6300 4050 6300 4500
Wire Wire Line
	6300 4050 7000 4050
Connection ~ 6300 4450
Wire Wire Line
	7000 4050 7000 3700
Wire Wire Line
	6900 4500 6900 3700
Wire Wire Line
	6800 3700 6800 4500
Wire Wire Line
	6700 4500 6700 3700
$Comp
L C C1
U 1 1 52BF3BBC
P 5350 2550
F 0 "C1" H 5350 2650 40  0000 L CNN
F 1 "33uF" H 5356 2465 40  0000 L CNN
F 2 "~" H 5388 2400 30  0000 C CNN
F 3 "~" H 5350 2550 60  0000 C CNN
	1    5350 2550
	1    0    0    -1  
$EndComp
$Comp
L R R2
U 1 1 52BF3BC2
P 4900 2150
F 0 "R2" V 4980 2150 40  0000 C CNN
F 1 "220k" V 4907 2151 40  0000 C CNN
F 2 "~" V 4830 2150 30  0000 C CNN
F 3 "~" H 4900 2150 30  0000 C CNN
	1    4900 2150
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR08
U 1 1 52BF3BC8
P 5350 2950
F 0 "#PWR08" H 5350 2950 30  0001 C CNN
F 1 "GND" H 5350 2880 30  0001 C CNN
F 2 "" H 5350 2950 60  0000 C CNN
F 3 "" H 5350 2950 60  0000 C CNN
	1    5350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2750 5350 2950
Wire Wire Line
	5150 2150 5900 2150
Wire Wire Line
	5350 2150 5350 2350
Wire Wire Line
	5900 2150 5900 2300
Connection ~ 5350 2150
Wire Wire Line
	4000 1550 6550 1550
Wire Wire Line
	6550 1550 6550 2300
Wire Wire Line
	4000 1650 6050 1650
Wire Wire Line
	6050 1650 6050 2300
Wire Wire Line
	4000 1750 4100 1750
Wire Wire Line
	4100 1750 4100 4300
Wire Wire Line
	4100 4300 6400 4300
Wire Wire Line
	6400 4300 6400 4500
NoConn ~ 7000 2300
NoConn ~ 6900 2300
NoConn ~ 6800 2300
NoConn ~ 6700 2300
NoConn ~ 6450 2300
Text HLabel 4000 1450 0    60   Output ~ 0
MISO
Text HLabel 4000 1550 0    60   Input ~ 0
MOSI
Text HLabel 4000 1650 0    60   Input ~ 0
SCLK
Text HLabel 4000 1750 0    60   Input ~ 0
CE0
Wire Wire Line
	4000 1450 4200 1450
NoConn ~ 4200 1450
Text HLabel 6900 5900 3    60   Output ~ 0
VD_1
Text HLabel 6800 5900 3    60   Output ~ 0
VD_2
Text HLabel 6700 5900 3    60   Output ~ 0
VD_3
Text HLabel 6600 5900 3    60   Output ~ 0
VD_4
Text HLabel 6500 5900 3    60   Output ~ 0
VD_5
Text HLabel 6400 5900 3    60   Output ~ 0
VD_6
Text HLabel 6300 5900 3    60   Output ~ 0
VD_7
Text HLabel 6200 5900 3    60   Output ~ 0
VD_8
Wire Wire Line
	6200 5900 6200 5700
Wire Wire Line
	6300 5900 6300 5700
Wire Wire Line
	6400 5900 6400 5700
Wire Wire Line
	6500 5700 6500 5900
Wire Wire Line
	6600 5900 6600 5700
Wire Wire Line
	6700 5700 6700 5900
Wire Wire Line
	6800 5900 6800 5700
Wire Wire Line
	6900 5700 6900 5900
$Comp
L GND #PWR09
U 1 1 52BF5964
P 5850 5200
F 0 "#PWR09" H 5850 5200 30  0001 C CNN
F 1 "GND" H 5850 5130 30  0001 C CNN
F 2 "" H 5850 5200 60  0000 C CNN
F 3 "" H 5850 5200 60  0000 C CNN
	1    5850 5200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 52BF5A44
P 5700 2800
F 0 "#PWR010" H 5700 2800 30  0001 C CNN
F 1 "GND" H 5700 2730 30  0001 C CNN
F 2 "" H 5700 2800 60  0000 C CNN
F 3 "" H 5700 2800 60  0000 C CNN
	1    5700 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 2700 5700 2700
Wire Wire Line
	5700 2200 5700 2800
Wire Wire Line
	6200 2300 6200 2200
Wire Wire Line
	6200 2200 5700 2200
Connection ~ 5700 2700
Wire Wire Line
	7250 2700 7050 2700
Wire Wire Line
	7250 5100 7000 5100
Wire Wire Line
	6100 5100 5850 5100
Wire Wire Line
	5850 5100 5850 5200
Text HLabel 4000 1100 0    60   Input ~ 0
5V
Wire Wire Line
	6300 2300 6300 1950
Wire Wire Line
	6300 1950 4500 1950
Wire Wire Line
	4500 1100 4500 2150
Wire Wire Line
	4500 2150 4650 2150
Wire Wire Line
	4000 1100 7250 1100
Connection ~ 4500 1950
Wire Wire Line
	7250 1100 7250 5100
Connection ~ 4500 1100
Connection ~ 7250 2700
Wire Wire Line
	4200 1450 4200 3850
Wire Wire Line
	4200 3850 6700 3850
Connection ~ 6700 3850
$EndSCHEMATC

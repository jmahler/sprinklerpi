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
Sheet 1 11
Title "Control Logic"
Date "30 dec 2013"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L CONN_4 P1
U 1 1 52BF3CA6
P 850 3100
F 0 "P1" V 800 3100 50  0000 C CNN
F 1 "CONN_4" V 900 3100 50  0000 C CNN
F 2 "~" H 850 3100 60  0000 C CNN
F 3 "~" H 850 3100 60  0000 C CNN
	1    850  3100
	-1   0    0    1   
$EndComp
$Sheet
S 1500 2750 1600 1000
U 52BF392A
F0 "control" 50
F1 "control.sch" 50
F2 "MISO" I L 1500 2950 60 
F3 "MOSI" O L 1500 3050 60 
F4 "SCLK" O L 1500 3150 60 
F5 "CE0" O L 1500 3250 60 
F6 "VD_1" O R 3100 2900 60 
F7 "VD_2" O R 3100 3000 60 
F8 "VD_3" O R 3100 3100 60 
F9 "VD_4" O R 3100 3200 60 
F10 "VD_5" O R 3100 3300 60 
F11 "VD_6" O R 3100 3400 60 
F12 "VD_7" O R 3100 3500 60 
F13 "VD_8" O R 3100 3600 60 
$EndSheet
Wire Wire Line
	1200 2950 1500 2950
Wire Wire Line
	1200 3050 1500 3050
Wire Wire Line
	1200 3150 1500 3150
Wire Wire Line
	1200 3250 1500 3250
Wire Wire Line
	3100 2900 4150 2900
Wire Wire Line
	3100 3000 4150 3000
Wire Wire Line
	3100 3100 4050 3100
Wire Wire Line
	3100 3200 3950 3200
Wire Wire Line
	3100 3300 4350 3300
Wire Wire Line
	3100 3400 3850 3400
Wire Wire Line
	3100 3500 3750 3500
Wire Wire Line
	3100 3600 3650 3600
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
$Sheet
S 4550 2550 800  500 
U 52C10EE6
F0 "driver_1" 50
F1 "driver.sch" 50
F2 "CTL" I L 4550 2800 60 
F3 "DRV_A" B R 5350 2700 60 
F4 "DRV_B" B R 5350 2900 60 
$EndSheet
Text Notes 1100 2800 2    60   ~ 0
RasberryPI
Text Notes 1000 1150 2    60   ~ 0
110 AC
$Comp
L CONN_3 K1
U 1 1 52C02A8A
P 800 1350
F 0 "K1" V 750 1350 50  0000 C CNN
F 1 "CONN_3" V 850 1350 40  0000 C CNN
F 2 "~" H 800 1350 60  0000 C CNN
F 3 "~" H 800 1350 60  0000 C CNN
	1    800  1350
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR05
U 1 1 52C03803
P 1350 1200
F 0 "#PWR05" H 1350 1200 30  0001 C CNN
F 1 "GND" H 1350 1130 30  0001 C CNN
F 2 "" H 1350 1200 60  0000 C CNN
F 3 "" H 1350 1200 60  0000 C CNN
	1    1350 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 3000 4150 3600
Wire Wire Line
	4150 3600 4550 3600
Wire Wire Line
	4050 3100 4050 4400
Wire Wire Line
	4050 4400 4550 4400
Wire Wire Line
	3950 3200 3950 5200
Wire Wire Line
	3950 5200 4550 5200
Wire Wire Line
	4150 2900 4150 2800
Wire Wire Line
	4150 2800 4550 2800
$Sheet
S 1500 1250 1000 450 
U 52C09D46
F0 "power" 50
F1 "power.sch" 50
F2 "110AC_A" I L 1500 1350 60 
F3 "110AC_B" I L 1500 1450 60 
F4 "24AC_A" O R 2500 1350 60 
F5 "24AC_B" O R 2500 1450 60 
F6 "5V_600mA" O R 2500 1600 60 
$EndSheet
$Comp
L R R1
U 1 1 52C0C8A4
P 5650 1850
F 0 "R1" V 5730 1850 40  0000 C CNN
F 1 "10" V 5657 1851 40  0000 C CNN
F 2 "~" V 5580 1850 30  0000 C CNN
F 3 "~" H 5650 1850 30  0000 C CNN
	1    5650 1850
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR06
U 1 1 52C0F8A5
P 2750 1600
F 0 "#PWR06" H 2750 1690 20  0001 C CNN
F 1 "+5V" H 2750 1690 30  0000 C CNN
F 2 "" H 2750 1600 60  0000 C CNN
F 3 "" H 2750 1600 60  0000 C CNN
	1    2750 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 1600 2750 1600
Wire Wire Line
	4350 3300 4350 3200
Wire Wire Line
	4350 3200 6200 3200
Wire Wire Line
	3850 3400 3850 4000
Wire Wire Line
	3850 4000 6200 4000
Wire Wire Line
	3750 3500 3750 4800
Wire Wire Line
	3750 4800 6200 4800
Wire Wire Line
	3650 3600 3650 5600
Wire Wire Line
	3650 5600 6200 5600
$Comp
L CONN_8 P2
U 1 1 52C146CF
P 6100 6850
F 0 "P2" V 6050 6850 60  0000 C CNN
F 1 "CONN_8" V 6150 6850 60  0000 C CNN
F 2 "~" H 6100 6850 60  0000 C CNN
F 3 "~" H 6100 6850 60  0000 C CNN
	1    6100 6850
	0    -1   1    0   
$EndComp
Wire Wire Line
	5650 3500 5350 3500
Wire Wire Line
	5650 4300 5350 4300
Connection ~ 5650 3500
Wire Wire Line
	5650 5100 5350 5100
Connection ~ 5650 4300
Wire Wire Line
	7350 2700 7350 5500
Connection ~ 5650 2700
Wire Wire Line
	7350 3900 7000 3900
Wire Wire Line
	7350 4700 7000 4700
Connection ~ 7350 3900
Wire Wire Line
	7350 5500 7000 5500
Connection ~ 7350 4700
Wire Wire Line
	5750 2900 5750 6500
Wire Wire Line
	5850 6500 5850 3700
Wire Wire Line
	5850 3700 5350 3700
Wire Wire Line
	5950 6500 5950 4500
Wire Wire Line
	5950 4500 5350 4500
Wire Wire Line
	6050 6500 6050 5300
Wire Wire Line
	6050 5300 5350 5300
Wire Wire Line
	7000 3300 7450 3300
Wire Wire Line
	7450 3300 7450 6000
Wire Wire Line
	7450 6000 6150 6000
Wire Wire Line
	6150 6000 6150 6500
Wire Wire Line
	7000 4100 7550 4100
Wire Wire Line
	7550 4100 7550 6100
Wire Wire Line
	7550 6100 6250 6100
Wire Wire Line
	6250 6100 6250 6500
Wire Wire Line
	7000 4900 7650 4900
Wire Wire Line
	7650 4900 7650 6200
Wire Wire Line
	7650 6200 6350 6200
Wire Wire Line
	6350 6200 6350 6500
Wire Wire Line
	7000 5700 7750 5700
Wire Wire Line
	7750 5700 7750 6300
Wire Wire Line
	7750 6300 6450 6300
Wire Wire Line
	6450 6300 6450 6500
Wire Wire Line
	1150 1350 1500 1350
Wire Wire Line
	1150 1450 1500 1450
Wire Wire Line
	1150 1250 1150 1100
Wire Wire Line
	1150 1100 1350 1100
Wire Wire Line
	1350 1100 1350 1200
$Comp
L CONN_8 P3
U 1 1 52C1A92D
P 8850 6850
F 0 "P3" V 8800 6850 60  0000 C CNN
F 1 "CONN_8" V 8900 6850 60  0000 C CNN
F 2 "~" H 8850 6850 60  0000 C CNN
F 3 "~" H 8850 6850 60  0000 C CNN
	1    8850 6850
	0    -1   1    0   
$EndComp
Wire Wire Line
	2500 1450 5650 1450
Wire Wire Line
	5650 1450 5650 1600
Wire Wire Line
	2500 1350 8500 1350
Wire Wire Line
	8500 1350 8500 6500
Wire Wire Line
	8600 6500 8600 6400
Wire Wire Line
	8500 6400 9200 6400
Connection ~ 8500 6400
Wire Wire Line
	8700 6400 8700 6500
Connection ~ 8600 6400
Wire Wire Line
	8800 6400 8800 6500
Connection ~ 8700 6400
Wire Wire Line
	8900 6400 8900 6500
Connection ~ 8800 6400
Wire Wire Line
	9000 6400 9000 6500
Connection ~ 8900 6400
Wire Wire Line
	9100 6400 9100 6500
Connection ~ 9000 6400
Wire Wire Line
	9200 6400 9200 6500
Connection ~ 9100 6400
Wire Wire Line
	5650 2100 5650 5100
Wire Wire Line
	5350 2700 7350 2700
Wire Wire Line
	5350 2900 5750 2900
$Sheet
S 4550 3350 800  500 
U 52C0B96B
F0 "driver_2" 50
F1 "driver.sch" 50
F2 "CTL" I L 4550 3600 60 
F3 "DRV_A" B R 5350 3500 60 
F4 "DRV_B" B R 5350 3700 60 
$EndSheet
$Sheet
S 4550 4150 800  500 
U 52C0B96C
F0 "driver_3" 50
F1 "driver.sch" 50
F2 "CTL" I L 4550 4400 60 
F3 "DRV_A" B R 5350 4300 60 
F4 "DRV_B" B R 5350 4500 60 
$EndSheet
$Sheet
S 4550 4950 800  500 
U 52C10EE5
F0 "driver_4" 50
F1 "driver.sch" 50
F2 "CTL" I L 4550 5200 60 
F3 "DRV_A" B R 5350 5100 60 
F4 "DRV_B" B R 5350 5300 60 
$EndSheet
$Sheet
S 6200 3750 800  500 
U 52BF98D7
F0 "driver_6" 50
F1 "driver.sch" 50
F2 "CTL" I L 6200 4000 60 
F3 "DRV_A" B R 7000 3900 60 
F4 "DRV_B" B R 7000 4100 60 
$EndSheet
$Sheet
S 6200 4550 800  500 
U 52C10EE9
F0 "driver_7" 50
F1 "driver.sch" 50
F2 "CTL" I L 6200 4800 60 
F3 "DRV_A" B R 7000 4700 60 
F4 "DRV_B" B R 7000 4900 60 
$EndSheet
$Sheet
S 6200 5350 800  500 
U 52C10EE8
F0 "driver_8" 50
F1 "driver.sch" 50
F2 "CTL" I L 6200 5600 60 
F3 "DRV_A" B R 7000 5500 60 
F4 "DRV_B" B R 7000 5700 60 
$EndSheet
$Sheet
S 6200 2950 800  500 
U 52C10EE7
F0 "driver_5" 50
F1 "driver.sch" 50
F2 "CTL" I L 6200 3200 60 
F3 "DRV_A" B R 7000 3100 60 
F4 "DRV_B" B R 7000 3300 60 
$EndSheet
Wire Wire Line
	7000 3100 7350 3100
Connection ~ 7350 3100
$EndSCHEMATC
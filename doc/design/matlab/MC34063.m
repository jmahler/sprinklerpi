%
% Perform calculations for the MC34063 switch
% mode voltage regulator.
%
% Step down configuration with a 15 volt input
% and a 5 volt output.
% Nominal output current is 600 mA.
%
% http://www.ti.com/lit/ds/symlink/mc33063a.pdf
% http://www.ti.com/lit/an/slva252b/slva252b.pdf
% http://www.youtube.com/watch?v=qGp82xhybs4
%

clear;

display('PARAMETERS:');

% Nominal input voltage
V_RMS = 24;
Vin = V_RMS*sqrt(2);
%Vin = 17.0  % (volt)
% Minimum input voltage
Vin_min = Vin - Vin*0.1  % -10%
% Desired output voltage
Vout = 3.3  % (volt)
% Desired output current (nominal)
%Iout = 1  % (amp)
Iout = 600e-3  % (amp)
%Iout = 1
% Minimum desired output frequency
% 100 kHz max
% Higher frequency -> smaller inductor
% lowever frequence -> larger timing capacitor (CT)
%fmin = 100e3  % (Hz)  % max
fmin = 10.1e3  % (Hz)
% Desired peak-to-peak output ripple voltage
Vripple = Vout*0.005  % (volt)
%Vripple = 0.1
% Forward voltage drop of the chosen output rectifier (diode)
VF = 0.6  % (volt) 1N5819
% Saturation voltage of the output switch
% Darlington Configuration
% Pg. 4 of data sheet
Vsat = 1.0;  % (volt)

display('CALCULATIONS:');

% ton/toff
r_ton_toff = (Vout + VF)/(Vin_min - Vsat - Vout)
% ton + toff
ton_p_toff = 1/fmin
% toff
toff = ton_p_toff/(r_ton_toff + 1)
% ton
ton = (ton_p_toff) - toff
% timing capacitor, set switching frequency
CT = (4e-5)*ton
% Peak inductor/diode current
Ipk = 2*Iout
% current sense resistor
Rsc = 0.3/Ipk
% minimum inductor value
Lmin = ((Vin_min - Vsat - Vout)/Ipk)*ton
Co = (Ipk*(ton_p_toff))/(8*Vripple)
R1 = 3e3
%R1 = 1.2e3
R2 = R1*(Vout/1.25 - 1)

% Minimum power rating of diode
PD = Ipk*VF

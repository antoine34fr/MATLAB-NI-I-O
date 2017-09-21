% Antoine Dalet - NI9263 LaserModulation V1.01 7/18/17

% devices = daq.getDevices
% devices(1)
% devices(2)
s = daq.createSession('ni');
addAnalogOutputChannel(s,'cDAQ2Mod2',0,'Voltage'); % The '0' indicates the output line of the NI device
s.Rate=5000;

for RepeatNumber = 1 : 20 % Number of times the cycle is repeated - One cycle is 50ms
    outputSingleValue = 5; % This is the output amplitude in Volts - NEVER SET MORE THAN 5.2 Volts
    outputSingleScan(s,outputSingleValue);
    pause(0.01)% This is the pulse width (PW) in seconds
    outputSingleValue = 0;
    outputSingleScan(s,outputSingleValue);
    pause(0.04)% This is the period (T) minus the PW in seconds
    % Duty cycle (D) is 20% since D=PW/T
end

% This code can be used either as TTL modulation (set line9 at 5 Volts - NEVER MORE THAN 5.2 Volts)
% or as an analog modulator (as follow for our laser):
% 0% power is 0.7V modulation
% 10% is 1.2V
% 20% is 1.6V
% 30% is 2.0V
% 40% is 2.4V
% 50% is 2.9V
% 60% is 3.3V
% 70% is 3.7V
% 80% is 4.2V
% 90% is 4.6V
% 100% is 5.0V
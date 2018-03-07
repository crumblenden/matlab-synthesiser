
N      = 8;      % Order
Fpass1 = 500;    % First Passband Frequency
Fstop1 = 4000;   % First Stopband Frequency
Fstop2 = 8000;   % Second Stopband Frequency
Fpass2 = 12500;  % Second Passband Frequency
Wpass1 = 80;     % First Passband Weight
Wstop  = 1;      % Stopband Weight
Wpass2 = 8;      % Second Passband Weight
dens   = 20;     % Density Factor

% Calculate the coefficients using the FIRPM function.
b  = firpm(N, [0 Fpass1 Fstop1 Fstop2 Fpass2 Fs/2]/(Fs/2), [1 1 0 0 1 ...
           1], [Wpass1 Wstop Wpass2], {dens});
filters(2) = dfilt.dffir(b);

clearvars N Fpass1 Fpass2 Fstop1 Fstop2 Wpass1 Wpass2 Wstop dens b;
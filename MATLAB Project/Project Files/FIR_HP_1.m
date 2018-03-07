
N     = 80;    % Order
Fstop = 750;  % Stopband Frequency
Fpass = 1500;  % Passband Frequency
Wstop = 100;   % Stopband Weight
Wpass = 1;     % Passband Weight

% Calculate the coefficients using the FIRLS function.
b  = firls(N, [0 Fstop Fpass Fs/2]/(Fs/2), [0 0 1 1], [Wstop Wpass]);
filters(3) = dfilt.dffir(b);

clearvars N Fpass Fstop Wpass Wstop b;
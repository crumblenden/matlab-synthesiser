


N     = 80;    % Order
Fpass = 750;   % Passband Frequency
Fstop = 1850;  % Stopband Frequency
Wpass = 1;     % Passband Weight
Wstop = 1;     % Stopband Weight

% Calculate the coefficients using the FIRLS function.
b  = firls(N, [0 Fpass Fstop Fs/2]/(Fs/2), [1 1 0 0], [Wpass Wstop]);
filters(1) = dfilt.dffir(b);

clearvars N Fpass Fstop Wpass Wstop b;


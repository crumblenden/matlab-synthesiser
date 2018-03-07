switch songCh
    case 1 %smoke on the water
        tempo = 120;
    case 2 %low rider
        tempo = 200;
end
oneBar = 60/(tempo/4);
Fsinv = 1/Fs;
noSamples = round(Fs * oneBar);
midA = 110;
noNotes = 25;
t = 0:Fsinv:(oneBar - Fsinv);
empty = zeros(1,noSamples);

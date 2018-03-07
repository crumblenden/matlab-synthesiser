%%%%%%%%%%%%%%%%%%Envelope 1
attack = 5;
decay = 120;
release = 600;
sustain = 0.3;

att = round(attack/1000 * Fs);
dec = round(decay/1000 * Fs);
rel = round(release/1000 * Fs);
sus = sustain;

env1 = ones(1,noSamples);

for i = 1:att
    env1(i) = i/att;
end
x = dec;
for i = (att+1):(att+dec)
    env1(i) = x/dec;
    x = x - (1-sus);
end
for i = (att+dec+1):noSamples
    env1(i) = env1(i) * sus;
end
x = rel - 1;
for i = ((noSamples-rel)+1):noSamples
    env1(i) = env1(i) * (x/rel);
    x = x - 1;
end

clearvars a x i att dec sus rel attack decay sustain release;

%%%%%%%%%%%%%%%%%%Envelope 2
attack = 100;
decay = 500;
release = 150;
sustain = 0.85;

att = round(attack/1000 * Fs);
dec = round(decay/1000 * Fs);
rel = round(release/1000 * Fs);
sus = sustain;

env2 = ones(1,noSamples);

for i = 1:att
    env2(i) = i/att;
end
x = dec;
for i = (att+1):(att+dec)
    env2(i) = x/dec;
    x = x - (1-sus);
end
for i = (att+dec+1):noSamples
    env2(i) = env2(i) * sus;
end
x = rel - 1;
for i = ((noSamples-rel)+1):noSamples
    env2(i) = env2(i) * (x/rel);
    x = x - 1;
end

clearvars a x i att dec sus rel attack decay sustain release;

%%%%%%%%%%%%%%%%%%Envelope 3
attack = 350;
decay = 350;
release = 500;
sustain = 0.6;

att = round(attack/1000 * Fs);
dec = round(decay/1000 * Fs);
rel = round(release/1000 * Fs);
sus = sustain;

env3 = ones(1,noSamples);

for i = 1:att
    env3(i) = i/att;
end
x = dec;
for i = (att+1):(att+dec)
    env3(i) = x/dec;
    x = x - (1-sus);
end
for i = (att+dec+1):noSamples
    env3(i) = env3(i) * sus;
end
x = rel - 1;
for i = ((noSamples-rel)+1):noSamples
    env3(i) = env3(i) * (x/rel);
    x = x - 1;
end

clearvars a x i att dec sus rel attack decay sustain release;
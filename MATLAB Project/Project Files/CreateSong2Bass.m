r = noNotes+1;
song2.bass.notes =   [ 11 4;%%
                        
                       13 8;
                        r 8;
                        r 8;%
                        r 8;
                       16 4;
                        
                        r 8;%
                        r 8;
                       18 4;
                        
                        r 8;%
                        r 8;
                       20 4;
                        
                        r 8;%%
                        r 8;
                       23 2;
                        
                            %
                        
                       20 4;
                        
                       23 8;%
                        r 8;
                       20 8;
                        r 8;
                       23 4;%
                        
                       25 8;
                        r 8;
                       11 4;%%
                        
                       13 8;
                        r 8;
                        r 8;%
                        r 8;
                       16 4;
                        
                        r 8;%
                        r 8;
                       18 4;
                        
                        r 8;%
                        r 8;
                       20 4;
                        
                        r 8;%%
                        r 8;
                       23 2;
                        
                            %
                        
                       20 4;
                        
                       23 8;%
                        r 8;
                       20 8;
                        r 8;
                       23 4;%
                        
                       25 8;
                        r 8;
                        ];
        song2.bass.tempsize = size(song2.bass.notes);
        song2.bass.lengthNotes = song2.bass.tempsize(1,1);
        song2.lengthSamples = 0;
        for a = 1:song2.bass.lengthNotes
            song2.lengthSamples = song2.lengthSamples +...
            round((oneBar/song2.bass.notes(a,2)) * Fs);
        end
        
        song2.bass.voices(1,:) = zeros(1, song2.lengthSamples);
        song2.bass.voices(2,:) = zeros(1, song2.lengthSamples);
        song2.bass.voices(3,:) = zeros(1, song2.lengthSamples);
        song2.bass.voices(4,:) = zeros(1, song2.lengthSamples);
        song2.bass.voices(5,:) = zeros(1, song2.lengthSamples);
        
        
pos = 1;
for a = 1:song2.bass.lengthNotes
    
len = round((oneBar/song2.bass.notes(a,2)) * Fs);
    
            attack = 1;
            decay = 100;
            release = 1;
            sustain = 1;

            att = round(attack/1000 * Fs);
            dec = round(decay/1000 * Fs);
            rel = round(release/1000 * Fs);
            sus = sustain;

            envX = ones(1,len);

            for i = 1:att
                envX(i) = i/att;
            end
            x = dec;
            for i = (att+1):(att+dec)
                envX(i) = x/dec;
                x = x - (1-sus);
            end
            for i = (att+dec+1):len
                envX(i) = sus;
            end
            x = rel - 1;
            for i = ((len-rel)+1):len
                envX(i) = envX(i) * (x/rel);
                x = x - 1;
            end
    j = 1;
    
    for i = pos:(pos+len-1)
      song2.bass.voices(1,(i)) = (voices.v1(song2.bass.notes(a,1),j)) * envX(1,j);
      song2.bass.voices(2,(i)) = (voices.v2(song2.bass.notes(a,1),j)) * envX(1,j);
      song2.bass.voices(3,(i)) = (voices.v3(song2.bass.notes(a,1),j)) * envX(1,j);
      song2.bass.voices(4,(i)) = (voices.v4(song2.bass.notes(a,1),j)) * envX(1,j);
      song2.bass.voices(5,(i)) = (voices.v5(song2.bass.notes(a,1),j)) * envX(1,j);
      j = j + 1;
    end
    pos = pos + len;
end

clearvars a b x i j att dec sus rel attack decay sustain release pos len r song2.bass.tempsize ;
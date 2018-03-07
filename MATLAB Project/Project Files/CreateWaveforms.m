%initialise matrices to hold waveform data
for a = 1:noNotes+1
    waves.squ(a,:) = empty;
    waves.squsub(a,:) = empty;
    waves.squtreb(a,:) = empty;
    waves.saw(a,:) = empty;
    waves.sawsub(a,:) = empty;
    waves.sawtreb(a,:) = empty;
    waves.tri(a,:) = empty;
    waves.trisub(a,:) = empty;
    waves.tritreb(a,:) = empty;
    waves.sine(a,:) = empty;
    waves.sinesub(a,:) = empty;   
end
waves.noise = -1 + 2.*rand(1, noSamples);

freq = 0;
samplesPerCycle = 0;
%generate and store all waveform data for each note in turn
for b = 1:noNotes
    
    freq = midA * (1.059463^(b-1));
    
    %square generator
    samplesPerCycle = round(Fs * (1 / freq));
    halfSamplesPerCycle = round((samplesPerCycle/2) - 0.5);
    for i = 1:samplesPerCycle:noSamples;
       for j = 1:(halfSamplesPerCycle);
           if ((i+j)-1) <= noSamples
            waves.squ(b,(i+j-1)) = -1;
           end
       end
       for j = (halfSamplesPerCycle + 1):samplesPerCycle
           if ((i+j)-1) <= noSamples
            waves.squ(b,(i+j-1)) = 1;
           end
       end
    end
        %square sub
        samplesPerCycle = round( Fs * (1 / (freq/2)) );
        halfSamplesPerCycle = round((samplesPerCycle/2) - 0.5);
        for i = 1:samplesPerCycle:noSamples;
           for j = 1:(halfSamplesPerCycle);
               if ((i+j)-1) <= noSamples
                waves.squsub(b,(i+j-1)) = -1;
               end
           end
           for j = (halfSamplesPerCycle + 1):samplesPerCycle
               if ((i+j)-1) <= noSamples
                waves.squsub(b,(i+j-1)) = 1;
               end
           end
        end
            %square treb
            samplesPerCycle = round( Fs * (1 / (freq*2)) );
            halfSamplesPerCycle = round((samplesPerCycle/2) - 0.5);
            for i = 1:samplesPerCycle:noSamples;
               for j = 1:(halfSamplesPerCycle);
                   if ((i+j)-1) <= noSamples
                    waves.squtreb(b,(i+j-1)) = -1;
                   end
               end
               for j = (halfSamplesPerCycle + 1):samplesPerCycle
                   if ((i+j)-1) <= noSamples
                    waves.squtreb(b,(i+j-1)) = 1;
                   end
               end
            end
    
    %saw generator
    waves.saw(b,:) = sawtooth(2*pi*freq*t);
    waves.sawsub(b,:) = sawtooth(2*pi*(freq/2)*t);
    waves.sawtreb(b,:) = sawtooth(2*pi*(freq*2)*t);
    %triangle generator
    waves.tri(b,:) = sawtooth(2*pi*freq*t, 0.5); 
    waves.trisub(b,:) = sawtooth(2*pi*(freq/2)*t, 0.5);
    waves.tritreb(b,:) = sawtooth(2*pi*(freq*2)*t, 0.5);
    %sine generator
    waves.sine(b,:) = sin(2*pi*freq*t);
    waves.sinesub(b,:) = sin(2*pi*(freq/2)*t);   
end

clearvars samplesPerCycle halfSamplesPerCycle;
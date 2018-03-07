 clear

Fs = 44100;

menu('Subtractive synthesiser by Chris Lynden. Begin?', 'OK');
clearvars ans;
q = 0;
while q == 0
    
    songCh = menu('1/6. Choose a song to synthesize',...
        'Smoke on the Water', 'Low Rider');
    
    Global %set global parameters
    
    display('Creating raw waveforms');
    CreateWaveforms
    
    display('Creating envelopes');
    CreateADSR
    
    display('Creating voices');
    CreateVoices
    
    melodyVoiceCh = menu('2/6. Choose a voice for the melody',...
        'Voice 1', 'Voice 2', 'Voice 3', 'Voice 4', 'Voice 5');
    bassVoiceCh = menu('4/6. Choose a voice for the bass',...
        'Voice 1', 'Voice 2', 'Voice 3', 'Voice 4', 'Voice 5');
    
    switch songCh
        case 1
            display('Creating parts');
            CreateSong1Melody
            CreateSong1Bass
        case 2
            display('Creating parts');
            CreateSong2Melody
            CreateSong2Bass
    end
    
    %initialise filters
    display('Creating Filters');
    FIR_LP_1
    FIR_BR_1
    FIR_HP_1
    
    melodyFiltCh = menu('3/6. Choose a filter to apply to the melody',...
        'Low Pass', 'Mid Scoop', 'High Pass', 'None');
    bassFiltCh = menu('5/6. Choose a filter to apply to the bass',...
        'Low Pass', 'Mid Scoop', 'High Pass', 'None');
    
    switch songCh
        case 1
            display('Applying filters and mixing Smoke on the Water');
            Song1FilterAndMix
        case 2
            display('Applying filters and mixing Low Rider');
            Song2FilterAndMix
    end
    
    reverbCh = menu('6/6. Choose a reverb to apply to the song',...
        'Hall', 'Room', 'None');
    
    display('Applying reverb')
    AddReverb
    x = 0;
    while x == 0
        endCh = menu('What would you like to do?', 'Play Song', 'Start Again', 'Quit');
        switch endCh
            case 1
                sound(withRev,Fs);
            case 2
                x = 1;
            case 3
                q = 1;
                x = 1;
        end
    end
   end % top while
    
 clearvars q x v1max v2max v3max v4max v5max freq;

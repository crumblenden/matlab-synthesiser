
if reverbCh ~=3
    
    switch reverbCh
        case 1
            mask = audioread('hall.wav');
        case 2
            mask = audioread('room.wav');
    end
    
    maskm = mask(:,1);
    [~, maskmSize] = size(maskm);
    switch songCh
        case 1
            withRev = ones(1,(song1.lengthSamples*2) + maskmSize + 1);
        case 2
            withRev = ones(1,(song2.lengthSamples*2) + maskmSize + 1);
    end
    
    withRev = conv(songTwice,maskm);
    [~, withRevSize] = size(withRev);
    withRevMax = max(withRev);
    for i = 1:withRevSize
        withRev(i) = withRev(i) / withRevMax;
    end
        
else
    withRev = songTwice;
    
end
clearvars maskm mask maskmSize withRevSize i withRevMax;

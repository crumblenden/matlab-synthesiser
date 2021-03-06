for a = 1:(noNotes+1)
    voices.v1(a,:) = empty;
    voices.v2(a,:) = empty;
    voices.v3(a,:) = empty;
    voices.v4(a,:) = empty;
    voices.v5(a,:) = empty;
end

for b = 1:noNotes
    if (b+3) >= noNotes
            minor = b + 3 - 12;
        else
            minor = b + 3;
    end
    if (b+4) >= noNotes
            major = b + 4 - 12;
        else
            major = b + 4;
    end
    if (b+7) >= noNotes
            fifth = b + 7 - 12;
        else
            fifth = b + 7;
        end
        
    for i = 1:noSamples
    voices.v1(b,i)=((((waves.squ(b,i)    *  env1(1,i) )   * 1)   +...
                     ((waves.tritreb(b,i)*  env2(1,i) )   * 0.8) +...
                     ((waves.saw(b,i)    *  env3(1,i) )   * 0.7) +...
                     ((waves.sinesub(b,i)*  env2(1,i) )   * 0.3) +...
                     ((waves.squsub(b,i) *  env1(1,i) )   * 0.8) +...
                     ((waves.noise(1,i)*  env1(1,i) )   * 0.2) +...
                     ((waves.squtreb(fifth,i)*  env1(1,i) )   * 0.6) )    /7);
    end
    for i = 1:noSamples
    voices.v2(b,i)=((((waves.saw(b,i)    *  env1(1,i) )   * 1)   +...
                     ((waves.tritreb(b,i)*  env1(1,i) )   * 0.7) +...
                     ((waves.sawsub(b,i) *  env2(1,i) )   * 0.7) +...
                     ((waves.sinesub(b,i)*  env2(1,i) )   * 0.4) +...
                     ((waves.squsub(b,i) *  env3(1,i) )   * 0.7) +...
                     ((waves.squtreb(fifth,i)*  env3(1,i) )   * 0.5)   )   /6);
    end
    for i = 1:noSamples
    voices.v3(b,i)=((((waves.tri(b,i)    *  env1(1,i) )   * 1)   +...
                     ((waves.squtreb(b,i)*  env3(1,i) )   * 0.6) +...
                     ((waves.trisub(b,i) *  env2(1,i) )   * 0.7) +...
                     ((waves.sawsub(b,i)*  env2(1,i) )   * 0.4) +...
                     ((waves.tritreb(major,i) *  env2(1,i) )   * 0.7) +...
                     ((waves.sawtreb(b,i)*  env3(1,i) )   * 0.4) +...
                     ((waves.noise(1,i)*  env3(1,i) )   * 0.4 )    )   /7);
    end
    for i = 1:noSamples
    voices.v4(b,i)=((((waves.tri(b,i)    *  env1(1,i) )   * 1)   +...
                     ((waves.squtreb(b,i)*  env1(1,i) )   * 0.6) +...
                     ((waves.trisub(b,i) *  env1(1,i) )   * 0.7) +...
                     ((waves.sawsub(b,i)*  env1(1,i) )   * 0.4) +...
                     ((waves.tritreb(fifth,i) *  env1(1,i) )   * 0.7) +...
                     ((waves.sawtreb(b,i)*  env3(1,i) )   * 0.4) +...
                     ((waves.noise(1,i)*  env1(1,i) )   * 0.4 )    )   /7);
    end
    for i = 1:noSamples
    voices.v5(b,i)=((((waves.tri(b,i)    *  env2(1,i) )   * 0.8)   +...
                     ((waves.sinesub(b,i)*  env2(1,i) )   * 1) +...
                     ((waves.sine(b,i)*  env2(1,i) )   * 0.8) +...
                     ((waves.squsub(b,i) *  env1(1,i) )   * 0.2)  ) /4);
    end
    
    v1max = max(voices.v1(b,:));
    v2max = max(voices.v2(b,:));
    v3max = max(voices.v3(b,:));
    v4max = max(voices.v4(b,:));
    v5max = max(voices.v5(b,:));
    
    for i = 1:noSamples
    voices.v1(b,i) = voices.v1(b,i) / v1max;
    voices.v2(b,i) = voices.v2(b,i) / v2max;
    voices.v3(b,i) = voices.v3(b,i) / v3max;
    voices.v4(b,i) = voices.v4(b,i) / v4max;
    voices.v5(b,i) = voices.v5(b,i) / v5max;
    end
end

clearvars major minor fifth;
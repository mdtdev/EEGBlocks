function [minutes, seconds, fraction] = ebTimeCalculator(startSample, endSample, Fs)

% [minutes, seconds] = ebTimeCalculator(startSample, endSample, Fs)
%
% Calculates time in minutes and seconds between starting and ending
% samples. If only one sample included, it treats that as the end sample
% and uses 0 for the starting sample. Assumes Fs = 128 Hz.
%
%
% MDT
% 2016.03.24
% Version 0.0.1

    if nargin < 3
        Fs = 128;
    end
    
    if nargin < 2
        endSample   = startSample;
        startSample = 0;
    end
    
    duration = endSample - startSample;
    minutes  = fix(duration/Fs);
    seconds  = rem(duration,Fs
end
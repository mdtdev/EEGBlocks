function eegDataBlob = ebBandPowerCalculator(eegDataBlob, timeLength, overlap, windowType)

% eegDataBlob = ebBandPowerCalculator(eegDataBlob, timeLength, overlap, windowType)
%
% This block does everything the original gmac01 script did to compute
% power in bands. It does NOT do the stuff that has been abstracted into
% other blocks. Returns an extended eegDataBlob with vectors representing
% band powers for each segment of original EEG.
%
% eegDataBlob is the data structure with the EEG data in it; minimally a
% .data element (time X channels), and .Fs with the sampling rate.
% timeLength is the number of seconds per epoch (default 4s). The overlap
% is the percent (as a proportion) that epochs should overlap (default 25%
% or 0.25). And windowType is a string that is either 'hamming' or
% 'hanning' (default is a Hamming window, based on Allen, Coan, & Nazarian
% 2004; figure 1).
%
% NOTE(!): This block does NOT add a column of spectral indices to the
% various power values! Instead, there is a new variable in the eegDataBlob
% called .spectralIndex that holds these values. This is different from the
% older gmac01.m and alphaImbalance.m scripts. (!)
%
% This program updates the data IN PLACE! You should be used to that by
% now. Although, if I am honest, it really does not do that.
%
% MDT
% 2016.02.14
% Version 0.1.0 alpha

    % Clean up the call and set defaults

    if nargin < 4
        windowType = 'hamming'; % Allen, Coan, & Nazarian 2004; figure 1.
    end
    
    if nargin < 3
        overlap = 0.25; % Overlap is 25% of duration, based on Harmon-Jones 2006
    
    if nargin < 2
        timeLength = 4; % 8 seconds or 1024 samples (for Emotiv EPOC)
    end
    
    if nargin < 1
        error('ebBandPowerCalculator: This is not a script! Gimmie a blob.');
    end
    
    Fs         = eegDataBlob.Fs;
    dataLength = Fs*timeLength;
    
    % Make Window (revised from gmac01 script; uses MATLAB's window functions)
            
    if strcmp(windowType, 'hamming')
        window = hamming(dataLength);
    elseif strcmp(windowType, 'hanning')
        window = hann(dataLength);
    else
        error('ebBandPowerCalculator: Incorrect window specification.');
    end
    
    window = repmat(window, 1, 14); % Match to number of channels to do all at once
    
    % Frequency Axis, Band Definitions, & Data Storage Blocks in the Blob
    
    f = [Fs/dataLength:Fs/dataLength:Fs]; % frequency index for the spectral array
    
    thetaIndex        = find(f >=  4 & f <   8);
    alphaIndex        = find(f >=  8 & f <= 13); % Allen, Coan, & Nazarian 2004
    betaIndex         = find(f >  13 & f <= 25);
    gammaIndex        = find(f >  25 & f <= 40);
    totalIndex        = find(f >=  4 & f <= 40);
    
    eegDataBlob.theta         = [];
    eegDataBlob.alpha         = [];
    eegDataBlob.beta          = [];
    eegDataBlob.gamma         = [];
    eegDataBlob.total         = [];
    eegDataBlob.spectralIndex = [];
    
    % Main power computation
    %
    % NB: kk is the index of the ENDING sample for each epoch of data. So
    % the first block is of the window length/data length, and the
    % difference between the length of eegDataBlock.data and the last value
    % of kk will be < dataLength.
    %
    % Defaults are 4 seconds or 512 samples per epoch (for the Emotiv
    % EPOS/EPOC+), and 25% overlap or a step size of 384 samples.
    
    stepSamples = ceil((1 - overlap)*dataLength);
        
    for kk = dataLength:stepSamples:size(eegDataBlob.data,1) % Defaults: 512:384:length(data)
        % Calculate FFT
        spectrum  = fft(eegDataBlob.data(kk - dataLength + 1:kk, :) .* window);
        spectrum  = sqrt(spectrum .* conj(spectrum)); 
        % Store the data
        eegDataBlob.theta = [eegDataBlob.theta; sum(spectrum(thetaIndex, :))];
        eegDataBlob.alpha = [eegDataBlob.alpha; sum(spectrum(alphaIndex, :))];
        eegDataBlob.beta  = [eegDataBlob.beta;  sum(spectrum(betaIndex,  :))];
        eegDataBlob.gamma = [eegDataBlob.gamma; sum(spectrum(gammaIndex, :))];
        eegDataBlob.total = [eegDataBlob.total; sum(spectrum(totalIndex, :))];
        eegDataBlob.spectralIndex = [eegDataBlob.spectralIndex; kk];
    end    
    
    % Final Bit -- Very Important!
    %
    % We add some other variables to make sure the chunk "knows" what the
    % important parameters were that were used to make the spectral
    % calculations...
    
    eegDataBlob.epochTimeSeconds       = timeLength;
    eegDataBlob.epochLengthSamples     = dataLength;
    eegDataBlob.epochOverlapProportion = overlap;
    eegDataBlob.windowType             = windowType;
end

% References:
%
% Allen, J. J., Coan, J. A., & Nazarian, M. (2004). Issues and assumptions
% on the road from raw signals to metrics of frontal EEG asymmetry in
% emotion. Biological psychology, 67(1), 183-218.
%
% Harmon-Jones, E. (2006). Unilateral right?hand contractions cause
% contralateral alpha power suppression and approach motivational affective
% experience. Psychophysiology, 43(6), 598-603.

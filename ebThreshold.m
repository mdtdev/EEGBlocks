function eegDataBlob = ebThreshold(eegDataBlob, upperLimit, lowerLimit)

% eegDataBlob = ebThreshold(eegDataBlob, upperLimit, lowerLimit)
%
% Takes an eegDataBlob as input and thresholds the extremes of the
% amplitudes.  Returns a blob with the revised data IN PLACE. The defaults
% are +/- 200 as described (sort of) in Ahani et al (2014).
%
% MDT
% 2016.03.06
% Version 0.0.1 

    % Setup any blanked variables

    if nargin < 3
        lowerLimit = -200;
    end
    
    if nargin < 2
        upperLimit =  200;
    end
    
    % Add the limits to the eegDataBlob so we remember what we used!

    eegDataBlob.lowerVoltThreshold = lowerLimit;
    eegDataBlob.upperVoltThreshold = upperLimit;
    
    % Do it!
    
    eegDataBlob.data(eegDataBlob.data > upperLimit) = upperLimit;
    eegDataBlob.data(eegDataBlob.data < lowerLimit) = lowerLimit;

end

% NB: In Ahani et al., the thresholds are at 200 and 2 microvolts, but
% their data appears to be referenced differently, our data is centered at
% zero microvolts, so we use the upper cutoff.
%
% Ahani, A., Wahbeh, H., Nezamfar, H., Miller, M., Erdogmus, D., & Oken, B.
% (2014). Quantitative change of EEG and respiration signals during
% mindfulness meditation. Journal of neuroengineering and rehabilitation,
% 11(1), 1.

function eegDataBlob = ebThreshold(eegDataBlob, upperLimit, lowerLimit)

% eegDataBlob = ebThreshold(eegDataBlob)
%
% Takes an eegDataBlob as input and thresholds the extremes of the
% amplitudes.  Returns a blob with the revised data.
%
% DO NOT USE THIS FUNCTION YET!
%
% MDT
% 2016.02.16
% Version 0.0.0 Alpha

    % Setup any blanked variables

    if nargin < 3
        lowerLimit = -800;
    end
    
    if nargin < 2
        upperLimit =  800;
    end
    
    % Add the limits to the eegDataBlob so we remember what we used!

    eegDataBlob.lowerThreshold = lowerLimit;
    eegDataBlob.upperThreshold = upperLimit;
    
    % Do it!
    
    eegDataBlob.data(eegDataBlob.data > upperLimit) = upperLimit;
    eegDataBlob.data(eegDataBlob.data < lowerLimit) = lowerLimit;

end


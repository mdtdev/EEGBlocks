function eegDataBlob = ebMedianRemove(eegDataBlob)

% eegDataBlob = ebMedianRemove(eegDataBlob)
%
% Simple block to remove median value from all 14 channels of EEG at each
% time step. Copied from the Emotiv forums. This step is very important; to
% see the effect, compute the channel correlations for a data set then
% remove the median, and do it again! 
%
% This program updates the data IN PLACE! So be careful!
%
% MDT
% 2016.02.08
% Version 0.0.1 alpha
    
    medTemp          = median(eegDataBlob.data, 2);
    eegDataBlob.data = eegDataBlob.data - repmat(medTemp, 1, 14);
end

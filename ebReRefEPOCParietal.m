function eegDataBlob = ebReRefEPOCParietal(eegDataBlob, modeString)

% eegDataBlob = ebReRefEPOCParietal(eegDataBlob, modeString)
%
% Function to re-reference EEG to the "average of P7/P8 (for the Emotiv
% EPOC headset)" using custom-built functions due to problems with eeglab.
% For this system, the relevant channels are P7 (6) and P8 (9) in the
% montage/data array. These are fixed in this code--if you need to change
% these, you are working with the wrong program!
%
% Just a wrapper for ebReRef2ChannelAverage.m, which is the more general
% function for re-referencing to an average of multiple channels.
%
% Please note that by DEFAULT this function is non-destructive, but can be
% run in "destructive mode" to reduce blob size or allow later functions in
% the chain to look to the default .data selector; in this latter mode it
% will overwrite the original data in the blob. Set modeString to
% 'destructive' to turn this on.
%
% See also the other ebReRef*.m functions for transforming blobs to other
% reference schemes.
%
% MDT
% 2016.09.14
% Version 0.0.9 alpha

    if nargin < 2
        modeString = 'nondestructive';  
    end
    
    reRefHolder = ebReRef2ChannelAverage(eegDataBlob, [6 9], 'destructive');
    
    if strcmp(modeString, 'nondestructive')
        eegDataBlob.dataParietalRef = reRefHolder.data;
    elseif strcmp(modeString, 'destructive')
        eegDataBlob.data = reRefHolder.data;
    else
        error('ebReRefEPOCParietal:  Unspecified modeString.');
    end
end
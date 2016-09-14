function eegDataBlob = ebReRef2ChannelAverage(eegDataBlob, refChans, modeString)

% eegDataBlob = ebReRef2ChannelAverage(eegDataBlob, refChans, modeString)
%
% Function to re-reference EEG to the "average of a subset of the channels"
% in the data array, using custom-built functions due to problems with
% eeglab. The original data must be in eegDataBlob.data; the array refChans
% is just a vector listing the indices of the channels to be used as a
% reference (can be 1 or more than 1 channel; so it intrinsically allows
% rereferencing to a particular channel).
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
% Version 0.1.0 alpha

    if nargin < 3
        modeString = 'nondestructive';  
    end
    
    reRefData = internalNaiveChannelAverageReference(eegDataBlob.data, refChans);
    
    if strcmp(modeString, 'nondestructive')
        eegDataBlob.dataChanAvgRef = reRefData;
    elseif strcmp(modeString, 'destructive')
        eegDataBlob.data = reRefData;
    else
        error('ebReRef2ChannelAverage:  Unspecified modeString.');
    end
end
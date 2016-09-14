function newData = internalNaiveAverageReference(oldData)

% INTERNAL function for EEG Blocks -- Not for direct use!
%
% This function implements the "naive" average EEG reference for an array
% of channel vectors. The array orientation is the usual for EEG Blocks
% (circa) 2016: time (samples) X channels. If this is changed in the
% future, the meanMat and numChan calculations will need to be changed as
% well.
%
% MDT
% 2016.09.14
% 0.1.0 alpha

    numChan  = size(oldData, 2);
    rowSums  =  sum(oldData, 2);
    
    rowMeans = rowSums ./ numChan;
    meanMat  = repmat(rowMeans, 1, numChan);
    
    newData  = oldData - meanMat;
end
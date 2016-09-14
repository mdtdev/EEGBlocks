function newData = internalNaiveChannelAverageReference(oldData, refChans)

% INTERNAL function for EEG Blocks -- Not for direct use!
%
% This function implements the "naive" re-referencing operation to an
% **average of several EEG channels**. The array orientation is the usual
% for EEG Blocks (circa) 2016, that is, time (or samples) X channels. If
% this is changed in the future, the meanMat and numChan calculations will
% need to be changed as well.
%
% oldData is the time X channels array (usually t X 14 for our work with
% the Emotiv EPOC) and the refChans array is a list of indices for the
% channels for which a reference is computed.
%
% Note that this handles re-referencing to a single, particular channel as
% a special case. Not the most efficient way to do it, but it works.
%
% MDT
% 2016.09.14
% 0.1.0 alpha

    numChan = size(oldData, 2);
    avgRef  =  sum(oldData(:, refChans), 2) ./ length(refChans);
    
    refMat  = repmat(avgRef, 1, numChan);
    
    newData = oldData - refMat;
end


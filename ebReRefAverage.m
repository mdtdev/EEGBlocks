function eegDataBlob = ebReRefAverage(eegDataBlob, modeString)

% eegDataBlob = ebReRefAverage(eegDataBlob, modeString)
%
% Function to re-reference EEG to the global EEG "average reference" using
% original code for this purpose, due to problems with eeglab. This is just
% the usual "average" or "AVG/AVE" reference in the literature, but NOT to
% be confused with the so-called "**common** average reference" of:
%
% Lepage, Kyle Q., Mark A. Kramer, and Catherine J. Chu. 2014. “A
% Statistically Robust EEG Re-Referencing Procedure to Mitigate Reference
% Effect.” Journal of Neuroscience Methods 235 (September): 101–16.
% doi:10.1016/j.jneumeth.2014.05.008. 
%
% that we also use in some of our work. This confusion of terminology
% appears in the literature!
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

    if nargin < 2
        modeString = 'nondestructive';  
    end
    
    aveRefData = internalNaiveAverageReference(eegDataBlob.data);
    
    if strcmp(modeString, 'nondestructive')
        eegDataBlob.dataAveRef = aveRefData;
    elseif strcmp(modeString, 'destructive')
        eegDataBlob.data = aveRefData;
    else
        error('ebReRefAverage:  Unspecified modeString.');
    end
end
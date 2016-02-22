function newThingie = ebAISScore(dataThingie, z)

% function newThingie = ebAISScore(dataThingie, z)
%
% This block assumes that you give it either (1) a vector of 14 scores
% (arranged in Emotiv EPOC/EPOC+ order) or (2) a data structure with
% fields: .mean and .std; each of which is a vector of length 14. If given
% the first, the return is a new data strcuture with a length 7 vector of
% scores, called .meanAIS. If given the second, it will return a new data
% structure with .meanAIS, .upperAIS, and .lowerAIS.
%
% The variable z is the SE multiplier for intervals and defaults to 2.
%
% MDT
% 2016.02.14
% Version 0.0.2

    % Setup the local variables & do some checks!
    
    if nargin < 2   % Use the usual SE multiplier of dos!
        z = 2.0;
    end
    
    thingieMode = 0;
    vectorMode  = 0;
    
    if isstruct(dataThingie)
        thingieMode  = 1;
        bandAverages = dataThingie.mean;
        bandSDs      = dataThingie.std;
        
    end
    
    if isnumeric(dataThingie)
        vectorMode   = 1;
        bandAverages = dataThingie; % NB: in this case the dataThingie is a vector
        bandSDs      = 0;           % Logical FALSE (trick!)
    end
    
    if thingieMode & vectorMode 
        error('ebAISScore: Input data type unrecognized! Something bad happened.');
    end
    
    % Calculation time! All of this is wrong!!!!!!
    
%     bandDiffs = bandAverages(end:-1:(length(bandAverages)/2)+1) - bandAverages(1:length(bandAverages)/2)
%     
%     if bandSDs
%         bandErrors  = bandSDs(end:-1:(length(bandSDs)/2)+1).^2 + bandSDs(1:length(bandSDs)/2).^2;
%         bandErrors  = sqrt(bandErrors);
%         upperPowers = bandDiffs + z*bandErrors;
%         lowerPowers = bandDiffs - z*bandErrors;
%     end
%     
%     meanAIS
%         
%         
    
    
    % Set up the output to return the answers! :-)
    
    if bandSDs
        newThingie.meanAIS  =  meanAIS;
        newThingie.upperAIS = upperAIS;
        newThingie.lowerAIS = lowerAIS;
    else
        newThingie.meanAIS  = meanAIS;
    end
end
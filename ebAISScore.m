function newThingie = ebAISScore(dataThingie)

% function newThingie = ebAISScore(dataThingie)
%
% This block assumes that you give it either (1) a vector of 14 scores
% (arranged in Emotiv EPOC/EPOC+ order) or (2) a data structure with
% fields: .mean and .std; each of which is a vector of length 14. If given
% the first, the return is a new data strcuture with a length 7 vector of
% scores, called .meanAIS. If given the second, it will return a new data
% structure with .meanAIS, .upperAIS, and .lowerAIS.
%
% MDT
% 2016.02.14
% Version 0.0.2

    % Setup: Determine the mode of operation
    
    thingieMode = 0;
    vectorMode  = 0;
    
    if isstruct(dataThingie)
        thingieMode = 1;
        
    end
    
    if isnumeric(dataThingie)
        vectorMode = 1;
    end
    
    if thingieMode & vectorMode 
        error('ebAISScore: Input data type unrecognized! Stopping.');
    end
    
    
    
    % 


end
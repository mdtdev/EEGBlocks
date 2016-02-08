function eegDataBlob = ebHighPassFilterDefault(eegDataBlob)

% eegDataBlob = ebHighPassFilterDefault(eegDataBlob)
%
% Wrapper for the default high passs filter copied from the Emotiv forums.
% This is a temporary filter until we write our own that we fully
% understand. This program updates the data IN PLACE! So be careful!
%
% MDT
% 2016.02.08
% Version 0.0.1 alpha

    a = 0.0078125; % HPF filter coefs (Magic Numbers!)
    b = 0.9921875;
    
    preVal     = zeros(1,14);
    filterData = zeros(size(eegDataBlob.data));
    
    for j = 2:size(eegDataBlob.data, 1)
        preVal = a * eegDataBlob.data(j, :) + b * preVal;
        filterData(j, :) = eegDataBlob.data(j, :) - preVal;
    end
    
    eegDataBlob.data = filterData;
end
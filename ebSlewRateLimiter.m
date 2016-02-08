function eegDataBlob = ebSlewRateLimiter(eegDataBlob, maxDelta)

% eegDataBlob = ebSlewRateLimiter(eegDataBlob, maxDelta)
%
% Wrapper for the slew rate limiter copied from the Emotiv forums. This
% limits the change in EEG signal amplitude to (at most) maxDelta. The
% default is 15 units. This program updates the data IN PLACE!
%
% MDT
% 2016.02.08
% Version 0.0.1 alpha

    if nargin < 2
        maxDelta = 15;   % Copied from the Emotiv EPOC forums
    end
    
    % Limit the SLEW RATE 
    
    for j = 2:size(eegDataBlob.data,1)
        del = eegDataBlob.data(j,:) - eegDataBlob.data(j-1,:); % Get differences
        del = min(del,  ones(1,14)*maxDelta);                  % Diff or maxDelta (whichever smaller)
        del = max(del, -ones(1,14)*maxDelta);                  % Result of above or -maxDelta (whichever bigger)
        eegDataBlob.data(j,:) = eegDataBlob.data(j-1,:) + del; % Apply limits above to the data
    end
end
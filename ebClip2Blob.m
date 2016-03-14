function eegDataBlob = ebClip2Blob(filename, startSample, stopSample)

% eegDataBlob = ebClip2Blob(filename, startSample, stopSample)
%
% Loads an EEG data file (.set), then clips the data from startSample to
% stopSample. Also, appends the sampling rate (Fs) to the blob for further
% use.
%
% MDT
% 2016.03.14
% Version 0.0.1

EEG = pop_loadset(filename);

data = EEG.data';
[s, c] = size(data);

if nargin < 3
    stopSample = s;
end

if nargin < 2
    startSample = 1;
end

startSample = startSample + 1;  % Because Matlab indexes from 1

eegDataBlob.data = data(startSample:stopSample,:);
eegDataBlob.Fs   = EEG.srate;

end
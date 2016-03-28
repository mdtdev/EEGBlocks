% Run this from a data directory where all the data is in a .SET file
% format. This was run from the REANALYSIS folder of the meditation data.
% Note that this data has been imported from EDF's with the filtering done,
% via ge_importScript2.m.
%
% MDT
% 2016.03.27

% RUN eeglab FIRST for directory set up for programs
%
% Then load the data using an eeglab function:

EEG_TEMP = pop_loadset('1003-intake1_filtEEG.set');

% Grab the relevant parts of the data and make a chunk:

chunk.name = EEG_TEMP.filename;
chunk.data = EEG_TEMP.data';
chunk.Fs   = EEG_TEMP.srate;

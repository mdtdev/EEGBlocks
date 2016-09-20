% Run this from a data directory where all the data is in a .SET file
% format. This was run from the REANALYSIS folder of the meditation data.
% Note that this data has been imported from EDF's with the **filtering
% done**, via ge_importScript2.m.
%
% MDT
% 2016.03.27

% RUN eeglab FIRST for directory/path set up for programs

eeglab;
close all;

% Then load the data using an eeglab function:

EEG_TEMP = pop_loadset('1003-intake1_filtEEG.set');

% Grab the relevant parts of the data and make a chunk:

chunk.name = EEG_TEMP.filename;
chunk.data = EEG_TEMP.data';
chunk.Fs   = EEG_TEMP.srate;

% Further Cleaning - only doing Ahani's thresholding here, not doing
% median removal or slew rate limiting for the time being.

chunk = ebThreshold(chunk);

% We inspected the data, visually in eeglab, and found a six minute segment
% with very few artifacts from 117 seconds in to 477 seconds. We manually
% pick this segment out here:

chunk.data = chunk.data(117*chunk.Fs:(477*chunk.Fs)-1,:);

% NB: the -1 fixes the offset of a single sample from the calculation.
%
% Now calculate Averges by band for each interval:

chunk = ebBandPowerCalculator(chunk, 2);  % 2 second intervals

% Now we compute some derived measures. We start by making a vector of
% channel names for reference:

channelNames = ebEmotivChannelNames;

% Frontal averages (of powers):

FA_left  = (1/4)*sum(chunk.alpha(:, 1:4),   2);
FA_right = (1/4)*sum(chunk.alpha(:, 11:14), 2);

% Basic figure:

figure;
plot(FA_right, 'o-b');
hold on;
plot(FA_left, '+-r');
legend('FA-right','FA-left','location','NorthWest');
title('Frontal Alpha Power over Time');
xlabel('Time (2 second intervals)');
ylabel('Alpha Power/Amplitude');

% Alpha power average over entire six minute segment:

FAA_left  = mean(FA_left)    % Frontal Alpha Average
FAA_right = mean(FA_right)

% Frontal Alpha-Theta Ratio:

FT_left  = (1/4)*sum(chunk.theta(:, 1:4),   2);
FT_right = (1/4)*sum(chunk.theta(:, 11:14), 2);

FTA_left  = mean(FT_left)    % Frontal Theta Average
FTA_right = mean(FT_right)

ATR_left  = FA_left  ./ FT_left;
ATR_right = FA_right ./ FT_right;

figure;
plot(ATR_right, 'o-b');
hold on;
plot(ATR_left, '+-r');
legend('ATR-right','ATR-left','location','NorthWest');
title('Frontal Alpha Theta Ratio over Time');
xlabel('Time (2 second intervals)');
ylabel('Alpha/Theta Ratio');

MATR_left  = mean(ATR_left)
MATR_right = mean(ATR_right)

MATR_both  = (MATR_left + MATR_right)/2

% Most of these latter measures (MATR, FTA, FAA) can be used a correlates
% in the meditation study.

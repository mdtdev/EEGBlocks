%% testScript_simpleCleaning.m
%
%  UNTESTED! Still waiting for more functions to test it more completely!
%
% MDT
% 2016.02.08
% Version 1.0

%% Introduction
%
% This is an EEGBlocks example/test script. These scripts are designed to
% show how the blocks work together. To try your own data on it, manually
% build a "chunk" or eegDataBlob (we usually call them chunks in scripts
% and eegDataBlobs in functions) that (minimally) has the fields "data"
% which holds the data in a time X channel array. This is the TRANSPOSE of
% how eeglab stores it!
%
% Most testScripts use preformatted data from our laboratory. These are not
% stored on the Github for a variety of reasons, so if something is
% missing, contact the authors for data.

%% Simple Cleaning
%
% This script loads some data and does the basic cleaning steps to it. It
% does not perform any analysis at this point!

load ebExampleData  % This file ebExampleData.mat must be on the path!

% The data is in the variable exampleChunk
%
% The EEG data is in the 'data' field, and the sampling rate is in the 'Fs'
% field. All other fields are optional and generated either by the user at
% setup or generated by other blocks. Blocks are designed not to overwrite
% each other's data.
%
% The 'exampleChunk' structure should have four fields: name, baseline,
% data, and Fs.

exampleChunk     % This prints out the fields for you to see!

% Data should enter the process below with its baseline REMOVED already!

newChunk = ebMedianRemove(exampleChunk);
newChunk = ebSlewRateLimiter(newChunk);
newChunk = ebHighPassFilterDefault(newChunk);

newChunk         % Should look the same a exampleChunk above!

% In the following figure, the limit on the slew rate is the most obvious

figure;
plot(exampleChunk.data(:,1), 'b');
hold on;
plot(newChunk.data(:,1), 'r');
legend('Original Data', 'Cleaned Data');
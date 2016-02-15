%% testScript_bandAveragesPlot.m
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

%% Set Up the Data
%
% The 1st commands below are from the script: testScript_simpleCleaning.m.
% Look there for details!

load ebExampleData       % This file ebExampleData.mat must be on the path!

newChunk = ebMedianRemove(exampleChunk);
newChunk = ebSlewRateLimiter(newChunk);
newChunk = ebHighPassFilterDefault(newChunk);

% The following command computes a vector of epoch level band powers
% following the original gmac01.m pattern!

newChunk = ebBandPowerCalculator(newChunk);

% We now get the averages across all of the epochs with the following
% command which is really just a wrapper:

[t, a, b, g, s] = ebBandAverage(newChunk);

% t, a, b, and g are the theta, alpha, beta, and gamma powers respectively.
% The s variable is for "total" power, here "s" for sum. The following
% command makes a primitive plot (no labels!) that shows the alpha and
% theta powers means with the corresponding error bars:

errorbar(t.mean,t.std, 'b');
hold on;
errorbar(a.mean, a.std, 'r');
legend('Theta','Alpha');
title('Power by Channel with 2*std Error Bars');
xlabel('Channel Number (1 to 14)');
ylabel('Power');
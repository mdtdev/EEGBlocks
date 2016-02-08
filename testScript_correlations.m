%% testScript_correlations.m
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

%% Correlations
%
% This script loads some data and runs a simple correlational analysis on
% it to show the effect of removing the medians.
%

load ebExampleData  % This file ebExampleData.mat must be on the path!

originalDataCorr = corr(exampleChunk.data);
newChunk         = ebMedianRemove(exampleChunk);
medianDataCorr   = corr(newChunk.data);

origDataHM = HeatMap(originalDataCorr);
origDataHM.addTitle('Original Data Channel Correlations');

medRemDataHM = HeatMap(medianDataCorr);
medRemDataHM.addTitle('Median Removed Channel Correlations');

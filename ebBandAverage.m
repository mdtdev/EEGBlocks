function [thetaPower, alphaPower, betaPower, gammaPower, totalPower] = ebBandAverage(eegDataBlob)

% [thetaPower, alphaPower, betaPower, gammaPower, totalPower] = ebBandAverage(eegDataBlob)
%
% This block assumes that you give it a standard eegDataBlob which has
% passed through ebBandPowerCalculator.m which has appended the following
% variables to the blob:
%
%   .theta
%   .alpha
%   .beta
%   .gamma
%   .total
%
% If these are set to what you want, then any other way of making them will
% do, also.
%
% This program returns the mean values for each band and the corresponding
% standard deviations; by channel. Mostly a wrapper!
%
% MDT
% 2016.02.14
% Version 0.0.2

    % First check that the needed fields are present!

    if ~isfield(eegDataBlob, 'theta')
        error('ebBandAverage: No .theta field (possibly among others). Stopping.');
    elseif ~isfield(eegDataBlob, 'alpha')
        error('ebBandAverage: No .alpha field (possibly among others). Stopping.');
    elseif ~isfield(eegDataBlob, 'beta')
        error('ebBandAverage: No .beta  field (possibly among others). Stopping.');
    elseif ~isfield(eegDataBlob, 'gamma')
        error('ebBandAverage: No .gamma field (possibly among others). Stopping.');
    elseif ~isfield(eegDataBlob, 'total')
        error('ebBandAverage: No .total field (possibly among others). Stopping.');
    end
    
    % Now for the boring part!
    
    thetaPower.mean = mean(eegDataBlob.theta);
    thetaPower.std  =  std(eegDataBlob.theta);
    
    alphaPower.mean = mean(eegDataBlob.alpha);
    alphaPower.std  =  std(eegDataBlob.alpha);
    
    betaPower.mean  = mean(eegDataBlob.beta);
    betaPower.std   =  std(eegDataBlob.beta);
    
    gammaPower.mean = mean(eegDataBlob.gamma);
    gammaPower.std  =  std(eegDataBlob.gamma);
    
    totalPower.mean = mean(eegDataBlob.total);
    totalPower.std  =  std(eegDataBlob.total);
end

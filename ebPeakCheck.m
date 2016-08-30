function eegDataBlob = ebPeakCheck(eegDataBlob, upperLimit, lowerLimit)

% eegDataBlob = 
%
% Takes an eegDataBlob as input and thresholds the extremes of the
% amplitudes.  Returns a blob with the revised data IN PLACE. The defaults
% are +/- 200 as described (sort of) in Ahani et al (2014).
%
% MDT
% 2016.03.06
% Version 0.0.1 
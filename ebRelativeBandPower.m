function propPower = ebRelativeBandPower(wave, interestBand, fullBand, Fs)

%ebRelativeBandPower
%   
%   Computes the relative power of a specified band of the EEG spectrum.
%   Defaults for our research set Fs to 128 Hz, and fullBand to [1 41] as
%   our data is filtered to be in this band. For proportions to be
%   systematically correct always use a single fixed band for fullBand for
%   all calculations.
%
%   Returns a proportion, not a percentage.
%
% MDT
% 2017.08.24

    if nargin < 4
        Fs = 128;
    end

    if nargin < 3
        fullBand = [1 41];
    end
    
    propPower = bandpower(wave, Fs, interestBand) ./ bandpower(wave, Fs, fullBand);

end


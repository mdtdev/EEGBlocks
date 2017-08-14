function [spectrum, freqAxis] = ebEZFourier(wave, Fs)

% Header
%
% MDT
% 2017.08.14
% Version 0.0.1

    N       = length(wave);
    NFFT    = 2^nextpow2(N);
    window  = hamming(N);
    winwave = window .* wave;

    spectrum  = fft(winwave);
    spectrum  = sqrt(spectrum .* conj(spectrum)); 





end
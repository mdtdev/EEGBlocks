function [spectrum, freqAxis] = ebEZFourier(wave, Fs)

% [spectrum, freqAxis] = ebEZFourier(wave, Fs)
%
% Simple, one at a time, FFT of single input waves. Expects a single vector
% as input.
%
% MDT
% 2017.08.14
% Version 0.0.1

    s = size(wave);       % Make input into a  column vector
    if s(1) < s(2)
        wave = wave';
    end

    N       = length(wave);
    window  = hamming(N);
    winwave = window .* wave;
    
    NFFT     = 2^nextpow2(N);
    Y        = fft(winwave, NFFT)/N;
    freqAxis = (Fs/2)*linspace(0,1,NFFT/2+1)';
    spectrum = 2*abs(Y(1:NFFT/2+1));

end
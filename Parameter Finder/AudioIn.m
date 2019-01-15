function [S,f,t,hop,fs] = AudioIn(AudioFileName)
% load an audio file
AudioFileName = "./AudioFiles/" + AudioFileName;
[x, fs] = audioread(AudioFileName);   % load an audio file
x = x(1:2000000, 1);                        % get the first channel
% define analysis parameters

wlen = 1024;                        % window length (recomended to be power of 2)
hop = wlen/4;                       % hop size (recomended to be power of 2)
nfft = 4096;                        % number of fft points (recomended to be power of 2)
% perform STFT
win = blackman(wlen, 'periodic');
[S,f,t] = stft(x, win, hop, nfft, fs);
% calculate the coherent amplification of the window
C = sum(win)/wlen;
% take the amplitude of fft(x) and scale it, so not to be a
% function of the length of the window and its coherent amplification
S = abs(S)/wlen/C;
% correction of the DC & Nyquist component
if rem(nfft, 2)                     % odd nfft excludes Nyquist point
    S(2:end, :) = S(2:end, :).*2;
else                                % even nfft includes Nyquist point
    S(2:end-1, :) = S(2:end-1, :).*2;
end

% convert amplitude spectrum to dB (min = -120 dB)
% S = 20*log10(S + 1e-6);
% S(S<-30) = -120; 

f = f(257:1200);
S = S(257:1200,:);
% 
S(S<0.11) = 0; 
S(S==0.11) = 1;
S(S>0.11) = 1;

% plotting the spectrogram (is commented out most of the time)
figure(1)
surf(t, f, S)
shading interp
axis tight
view(0, 90)

%


end

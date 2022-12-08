clc;clear all

Fs = 16000; % Sampling frequency in hertz
ch = 1; % Number of channels:1 (mono) or 2 (stereo)
datatype = 'double';
nbits = 24; % 8,16,or 24
Nseconds = 5; % seconds
recorder = audiorecorder(Fs,nbits,ch);
disp('Start speaking..')
recordblocking(recorder,Nseconds);
disp('End of Recording.');
% Store recorded audio signal in numeric array
x = getaudiodata(recorder,datatype);
% Write audio file
audiowrite('myvoice.wav',x,Fs);

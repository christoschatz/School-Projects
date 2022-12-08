clc;clear;

[x,Fs] = audioread('guit2.wav');
X = frame_wind (x, 256, 0.5);
y = frame_recon (X, 0.5);

soundsc(x, 16000);

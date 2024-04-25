clc;clear
[x,Fs] = audioread('guit1.wav');
X = frame_wind (x, 256, 0.5);
XF = fft(X);
frame = 256;
[rows, columns] = size(XF);

% Elow Calculation
temp1 = 0; % counter initialization

for k = 1:columns
    for m = 1:(frame/4)
        temp1 = temp1 + (abs(XF(m,k)))^2;
    end
    Elow(1,k) = temp1;
    temp1 = 0;
end

% Ehigh Calculation
temp2 = 0; % counter initialization

for k = 1:columns
    for m = ((frame/4)+1):(frame/2)
        temp2 = temp2 + (abs(XF(m,k)))^2;
    end
    Ehigh(1,k) = temp2;
    temp2 = 0;
end
  
% Create an row array 1 x (total frames) and evaluate unvoiced as 0 and
% voiced as 1

for i = 1:columns
    if Ehigh(1,i)/Elow(1,i) < 1
        VorU(1,i) = 1;
    else
        VorU(1,i) = 0;
    end
end

% set unvoiced  = 0
for n = 1:columns
    if VorU(1,n) == 0
        for p = 1:rows
            X(p,n) = 0;
        end
    end
end

y1 = frame_recon (X, 0.5);
X = frame_wind (x, 256, 0.5); % X restoration

% set voiced = 0
for n = 1:columns
    if VorU(1,n) == 1
        for p = 1:rows
            X(p,n) = 0;
        end
    end
end

y2 = frame_recon (X, 0.5);

figure
plot(y1)
figure
plot(y2)
figure
plot(y1+y2)

soundsc(y1,16000); %change the first argument to listen to the difference

clc;clear;
[x,Fs] = audioread('smoke.wav');
X = frame_wind (x, 1024, 0.5);
XF = fft(X);
frame = 1024;
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
temp2 = 0;% counter initialization

for k = 1:columns
    for m = ((frame/4)+1):(frame/2)
        temp2 = temp2 + (abs(XF(m,k)))^2;
    end
    Ehigh(1,k) = temp2;
    temp2 = 0;
end

Etotal = Elow + Ehigh; % total Energy
diffEtotal = diff(Etotal); % diff of Etotal
hold on
plot(Etotal)
plot(diffEtotal)
hold off

for k = 1:250
    if diffEtotal(1,k) > 370
        for m = 1:1024
            Y(m,k) = 1;
        end
    else
        for m = 1:1024
            Y(m,k) = 0;
        end
    end
end

x_new = ones(1024,1);
Y_new = [x_new Y];% add x_new as 1st column in the Y table
y = frame_recon (Y_new, 0.5);
soundsc(y,16000)     

clc;clear;
[x,Fs] = audioread('guit2.wav');
X = frame_wind (x, 256, 0.5);
XF = fft(X);
frame = 256;
[rows, columns] = size(XF);

%Elow Calculation
temp1 = 0; % counter initialization

for k = 1:columns
    for m = 1:(frame/4)
        temp1 = temp1 + (abs(XF(m,k)))^2;
    end
    Elow(1,k) = temp1;
    temp1 = 0;
end

%Ehigh Calculation
temp2 = 0; % counter initialization

for k = 1:columns
    for m = ((frame/4)+1):(frame/2)
        temp2 = temp2 + (abs(XF(m,k)))^2;
    end
    Ehigh(1,k) = temp2;
    temp2 = 0;
end

Etotal = Elow + Ehigh; %total Energy
plot(Etotal)

for j = 1:columns
    if Etotal(1,j) > 1
        for k = 1:rows
            Y(k,j) = X(k,j);
        end
    else
         for k = 1:rows
            Y(k,j) =0;
         end
end
end

y = frame_recon (Y, 0.5);
soundsc(y,16000);
            
counter1 = 0;
for i = 1:columns
    if Etotal(1,i) < 1
        counter1 = counter1 +1;
    end
end

inactive_frames_percentage = (counter1/columns)*100;
message = ['The percentage of inactive frames is: ',num2str(inactive_frames_percentage),'%'];
disp(message)

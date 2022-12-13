clc;clear
%LPC coefficients extraction
[x,Fs] = audioread('voice.wav');
X= frame_wind (x, 256, 0.25);
X = X(:,1:785);
[rows,columns] = size(X);
t = columns;
a = [];
G = [];

for i = 1:t
    [temp_a,temp_G] = lpc_new(X(:,i),20);
    a = [a temp_a];
    G = [G temp_G];
end

clear temp_G temp_a;

%Linear prediction error extraction

for j = 1:t
    e(:,j) = filter(a(:,j), 1, X(:,j));
end

%Perfect reconstruction

for k = 1:t
    Y(:,k) = filter(G(:,k), a(:,k), e(:,k));
end

y = frame_recon(Y, 0.25);
soundsc(y,16000)
 
x = x(1:(size(y,2)),:);
x=x';

x_temp = max(abs(x));
y_temp = max(abs(y));

x_fixed = x./x_temp;
y_fixed = y./y_temp;


sumx = sum(x_fixed.^2);
sumxminy = sum((x_fixed-y_fixed).^2);
SNR = 10*log10(sumx/sumxminy)

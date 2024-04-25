clc;clear
[x1,Fs] = audioread('umale_2.wav');
X1 = frame_wind (x1, 256, 0.25);
X1 = X1(:,1:767);
[rows1,columns1] = size(X1);
t1 = columns1;
a1 = [];
G1 = [];

for i = 1:t1
    [temp_a1,temp_G1] = lpc_new(X1(:,i),20);
    a1 = [a1 temp_a1];
    G1 = [G1 temp_G1];
end

clear temp_G1 temp_a1;

for j = 1:t1
    e1(:,j) = filter(a1(:,j), 1, X1(:,j));
end

[x2,Fs] = audioread('ufemale_2.wav');
X2 = frame_wind (x2, 256, 0.25);
X2 = X2(:,1:767);
[rows2,columns2] = size(X2);
t2 = columns2;
a2 = [];
G2 = [];

for i = 1:t2
    [temp_a2,temp_G2] = lpc_new(X2(:,i),20);
    a2 = [a2 temp_a2];
    G2 = [G2 temp_G2];
end

clear temp_G2 temp_a2;

for j = 1:t2
    e2(:,j) = filter(a2(:,j), 1, X2(:,j));
end

for k = 1:t1
    Y1(:,k) = filter(G2(:,k), a2(:,k), e1(:,k));
end

for k = 1:t2
    Y2(:,k) = filter(G1(:,k), a1(:,k), e2(:,k));
end

 y1 = frame_recon(Y1, 0.25);
 y2 = frame_recon(Y2, 0.25);
 soundsc(y2,16000)

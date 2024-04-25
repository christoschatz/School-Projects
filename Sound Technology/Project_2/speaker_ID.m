%%
clc;clear
[x1,Fs] = audioread('umale_1.wav');
X1 = frame_wind (x1, 256, 0.5);
X1 = X1(:,1:384);
[rows1,columns1] = size(X1);
t1 = columns1;
a1 = [];
G1 = [];

for i = 1:t1
    [temp_a1,temp_G1] = lpc_new(X1(:,i),30);
    a1 = [a1 temp_a1];
    G1 = [G1 temp_G1];
end

clear temp_G1 temp_a1;

for j = 1:t1
    e1(:,j) = filter(a1(:,j), 1, X1(:,j));
end

[x2,Fs] = audioread('umale_2.wav');
X2 = frame_wind (x2, 256, 0.5);
X2 = X2(:,1:384);
[rows2,columns2] = size(X2);
t2 = columns2;
a2 = [];
G2 = [];

for i = 1:t2
    [temp_a2,temp_G2] = lpc_new(X2(:,i),30);
    a2 = [a2 temp_a2];
    G2 = [G2 temp_G2];
end

clear temp_G2 temp_a2;

for j = 1:t2
    e2(:,j) = filter(a2(:,j), 1, X2(:,j));
end

 temp1 = 0 ;
 
 for p = 1:31
     for j = 1:300
        temp1 = temp1 + a1(p,j);
     end
     a1mean(p,1) = temp1/300;
     temp1 = 0;
 end
 
  temp2 = 0;
  
 for p = 1:31
     for j = 1:300
        temp2 = temp2 + a2(p,j);
     end
     a2mean(p,1) = temp2/300;
     temp2 = 0;
 end
 
 for j = 301:384
    k1((j-300)) = norm(a1mean - a1(:,j));
 end
 
  for j = 301:384
    k2((j-300)) = norm(a2mean - a1(:,j));
 end
 
     
counter1 = 0;
counter2 = 0;

for i =1:84
    if k1(i) < k2(i)
        counter1 = counter1 +1;
    else
        counter2 = counter2 + 1;
    end
end

if counter1>counter2
    disp("The 1st Speaker Recognized")
elseif counter1<counter2
    disp("The 2nd Speaker Recognized")
else
    disp("Tie")
end

clear temp1 temp2

%%
clc;clear
[x1,Fs] = audioread('ufemale_1.wav');
X1 = frame_wind (x1, 256, 0.5);
X1 = X1(:,1:384);
[rows1,columns1] = size(X1);
t1 = columns1;
a1 = [];
G1 = [];

for i = 1:t1
    [temp_a1,temp_G1] = lpc_new(X1(:,i),30);
    a1 = [a1 temp_a1];
    G1 = [G1 temp_G1];
end

clear temp_G1 temp_a1;

for j = 1:t1
    e1(:,j) = filter(a1(:,j), 1, X1(:,j));
end

[x2,Fs] = audioread('ufemale_2.wav');
X2 = frame_wind (x2, 256, 0.5);
X2 = X2(:,1:384);
[rows2,columns2] = size(X2);
t2 = columns2;
a2 = [];
G2 = [];

for i = 1:t2
    [temp_a2,temp_G2] = lpc_new(X2(:,i),30);
    a2 = [a2 temp_a2];
    G2 = [G2 temp_G2];
end

clear temp_G2 temp_a2;

for j = 1:t2
    e2(:,j) = filter(a2(:,j), 1, X2(:,j));
end

 temp1 = 0 ;
 
 for p = 1:31
     for j = 1:300
        temp1 = temp1 + a1(p,j);
     end
     a1mean(p,1) = temp1/300;
     temp1 = 0;
 end
 
  temp2 = 0;
  
 for p = 1:31
     for j = 1:300
        temp2 = temp2 + a2(p,j);
     end
     a2mean(p,1) = temp2/300;
     temp2 = 0;
 end
 
 for j = 301:384
    k1((j-300)) = norm(a1mean - a2(:,j));
 end
 
  for j = 301:384
    k2((j-300)) = norm(a2mean - a2(:,j));
 end
 
     
counter1 = 0;
counter2 = 0;

for i =1:84
    if k1(i) < k2(i)
        counter1 = counter1 +1;
    else
        counter2 = counter2 + 1;
    end
end

if counter1>counter2
    disp("The 1st Speaker Recognized")
elseif counter1<counter2
    disp("The 2nd Speaker Recognized")
else
    disp("Tie")
end

clear temp1 temp2

%%
%piano profile (add synth)

clc;clear
T = 0.5;
T1 = 1;
fs = 44100;
c_f0 = 261.63;
g_f0 = 392.00;
a_f0 = 440.00;
f_f0 = 349.23;
e_f0 = 329.63;
d_f0 = 293.66;
profile_name = "piano_profile";

y1 = add_synth(c_f0,T,fs,profile_name);
y2 = add_synth(c_f0,T,fs,profile_name);
y3 = add_synth(g_f0,T,fs,profile_name);
y4 = add_synth(g_f0,T,fs,profile_name);
y5 = add_synth(a_f0,T,fs,profile_name);
y6 = add_synth(a_f0,T,fs,profile_name);
y7 = add_synth(g_f0,T1,fs,profile_name);
y8 = add_synth(f_f0,T,fs,profile_name);
y9 = add_synth(f_f0,T,fs,profile_name);
y10 = add_synth(e_f0,T,fs,profile_name);
y11 = add_synth(e_f0,T,fs,profile_name);
y12 = add_synth(d_f0,T,fs,profile_name);
y13 = add_synth(d_f0,T,fs,profile_name);
y14 = add_synth(c_f0,T1,fs,profile_name);

y = [ y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];


g  = dist(y,50);
h = dist(y,90);
subplot(3,1,1)
suptitle('Distortion Effect')
specgram(y)
title('Fundamental')
subplot(3,1,2)
specgram(g)
title('50% distortion')
subplot(3,1,3)
specgram(h)
title('90% distortion')

%%
%profile A (sub synth)
clc
clear
C = "rect";
fc1 = 500;
B = "sawtooth";
fc2 = 700;
fs = 44100;
YC = sub_synth(261.63,0.5,C,fc1,B,fc2,fs);
YG = sub_synth(392.00,0.5,C,fc1,B,fc2,fs);
YA = sub_synth(440.00,0.5,C,fc1,B,fc2,fs);
YF = sub_synth(349.23,0.5,C,fc1,B,fc2,fs);
YE = sub_synth(329.63,0.5,C,fc1,B,fc2,fs);
YD = sub_synth(293.66,0.5,C,fc1,B,fc2,fs);
YC_ext = sub_synth(261.63,1,C,fc1,B,fc2,fs);
YG_ext = sub_synth(392.00,1,C,fc1,B,fc2,fs);

y = [YC,YC,YG,YG,YA,YA,YG_ext,YF,YF,YE,YE,YD,YD,YC_ext];

g = dist(y,50);
h = dist(y,90);
subplot(3,1,1)
suptitle('Distortion Effect')
specgram(y)
title('Fundamental')
subplot(3,1,2)
specgram(g)
title('50% distortion')
subplot(3,1,3)
specgram(h)
title('90% distortion')

%%
%D PROFILE (fm synth)
clc;clear
T = 0.5;
T1 = 1;
fs = 44100;
c_f0 = 261.63;
g_f0 = 392.00;
a_f0 = 440.00;
f_f0 = 349.23;
e_f0 = 329.63;
d_f0 = 293.66;
Q = 1;
B = 5;

y1 = fm_synth(c_f0,T,Q,B,fs);
y2 = fm_synth(c_f0,T,Q,B,fs);
y3 = fm_synth(g_f0,T,Q,B,fs);
y4 = fm_synth(g_f0,T,Q,B,fs);
y5 = fm_synth(a_f0,T,Q,B,fs);
y6 = fm_synth(a_f0,T,Q,B,fs);
y7 = fm_synth(g_f0,T1,Q,B,fs);
y8 = fm_synth(f_f0,T,Q,B,fs);
y9 = fm_synth(f_f0,T,Q,B,fs);
y10 = fm_synth(e_f0,T,Q,B,fs);
y11 = fm_synth(e_f0,T,Q,B,fs);
y12 = fm_synth(d_f0,T,Q,B,fs);
y13 = fm_synth(d_f0,T,Q,B,fs);
y14 = fm_synth(c_f0,T1,Q,B,fs);

y = [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];

g = dist(y,50);
h = dist(y,90);
subplot(3,1,1)
suptitle('Distortion Effect')
specgram(y)
title('Fundamental')
subplot(3,1,2)
specgram(g)
title('50% distortion')
subplot(3,1,3)
specgram(h)
title('90% distortion')

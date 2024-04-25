%%

%D PROFILE
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

y = [ y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];

specgram(y)
soundsc(y,fs)

%%

% PROFILE E
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
Q = 2/3;
B = 15;

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

y = [ y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];

specgram(y)
soundsc(y,fs)

%%

% PROFILE ST
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
Q = 7/5;
B = 15;

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

y = [ y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];

specgram(y)
soundsc(y,fs)

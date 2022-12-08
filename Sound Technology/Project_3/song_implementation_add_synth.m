%%
%piano profile

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

specgram(y)
soundsc(y,fs)
   
%%
%clarinet profile

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
profile_name = "clarinet_profile";

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

specgram(y)
soundsc(y,fs)

%%
%flute profile

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
profile_name = "flute_profile";

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

y = [y1,y2,y3,y4,y5,y6,y7,y8,y9,y10,y11,y12,y13,y14];

specgram(y)
soundsc(y,fs)
   

   


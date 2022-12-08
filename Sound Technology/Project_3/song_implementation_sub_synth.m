%%
%profile A
clc
clear
C = "rect";
fc1 = 500;
B = "sawtooth"; fc2 = 700;
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

specgram(y)
soundsc(y,fs);

%%
%Profile B
clc
clear
C = "sawtooth";
fc1 = 1300;
B = "triangle";
fc2 = 900;
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

specgram(y)
soundsc(y,fs);
%%
%Profile C
clc
clear
C = "rect";
fc1  =400;
B = "triangle";
fc2 = 1000;
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

specgram(y)
soundsc(y,fs);

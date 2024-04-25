function [y] = sub_synth(f0,T,osc_type1,fc1,osc_type2,fc2,fs)
t = (0:(1/fs):T);
st = size(t,2);
X1 = zeros(1,st);
X2 = zeros(1,st);
env = zeros(1,st);

if (osc_type1=="sawtooth")
     j=1;
    for t=0:1/(fs):T
        X1(j) = sawtooth(f0*2*pi*t);
        j = j+1;
    end
elseif (osc_type1=="rect")
    j = 1;
    for t=0:1/(fs):T
        X1(j) = square(f0*2*pi*t);
        j = j+1;
    end
elseif (osc_type1=="triangle")
       j = 1;
    for t=0:1/(fs):T
        X1(j) = sawtooth(f0*2*pi*t,1/2);
        j = j+1;
    end
    
end    

if (osc_type2=="sawtooth")
     j = 1;
    for t=0:1/(fs):T
        X2(j) = sawtooth(f0*2*pi*t);
        j = j+1;
    end
elseif (osc_type2=="rect")
    j=1;
     for t=0:1/(fs):T
        X2(j) = square(f0*2*pi*t);
        j = j+1;
    end
elseif (osc_type2=="triangle")
      j = 1;
    for t=0:1/(fs):T
        X2(j) = sawtooth(f0*2*pi*t,1/2);
        j = j+1;
    end
end   

K = tan((pi.*fc1)/fs);
Q = 1/sqrt(2);

A1 = [1,(2*Q*((K^2)-1))/((K^2)*Q+K+Q),((K^2)*Q-K+Q)/((K^2)*Q+K+Q)];
B1 = [((K^2)*Q)/((K^2)*Q+K+Q),(2*(K^2)*Q)/((K^2)*Q+K+Q),((K^2)*Q)/((K^2)*Q+K+Q)];
ocs1 = filter(B1,A1,X1);


K = tan((pi.*fc2)/fs);

A2 = [1,(2*Q*((K^2)-1))/((K^2)*Q+K+Q),((K^2)*Q-K+Q)/((K^2)*Q+K+Q)];
B2 = [((K^2)*Q)/((K^2)*Q+K+Q),(2*(K^2)*Q)/((K^2)*Q+K+Q),((K^2)*Q)/((K^2)*Q+K+Q)];
ocs2 = filter(B2,A2,X2);


ocs_added = ocs1+ocs2;

j = 1;
for t = 0:(1/(fs)):T
  env(1,j) = (1 - exp(-80*t)).*(exp(-5*t));
  j = j +1;
end

y  = ocs_added.*env;

end

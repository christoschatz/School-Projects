function y = fm_synth(f0,T,Q,B,fs)
   
    fm = Q*f0;
    k = 1;

    t = (0:(1/fs):T);
    st = size(t,2);
    F1env = zeros(1,st);
    y = zeros(1,st);
    F2env = zeros(1,st);


    for t = 0:(1/fs):T
        if t<0.1
            F1env(k) = 100.*(t.^2);
        elseif t >= 0.1 && t<(0.95*T)
            F1env(k) = 1;
        else
            F1env(k) = exp(-220.5*(t-(0.95*T)));
        end
       F2env(k) = exp(-10*t);

       y(1,k) = F1env(k).*cos((2*pi*f0*t) + (B*F2env(k).*sin(2*pi*fm*t)));
       k = k+1;
    end

end

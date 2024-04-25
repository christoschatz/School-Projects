function y = add_synth(f0,T,fs,profile_name)
    S = load (profile_name);
    A = struct2array(S);
    
    t = (0:(1/(fs)):T);
    st = size(t,2);
    y_temp = zeros(1,st);
    env = zeros(1,st);
    j=1;

    for t = 0:(1/fs):T
        env(1,j) = (1 - exp(-80*t)).*(exp(-5*t));
        for k = 1:size(A,2)
            y_temp(1,j) = y_temp(1,j)+ A(1,k).*cos(2*pi*k*f0.*t);
        end
        j = j +1;
    end

    y = y_temp.*env;
    
end

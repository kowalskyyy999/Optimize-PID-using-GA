function fitness = calculate_fitness(gen)

    SP = 1;
    num = [3.019];
    den = [1 23 73.75 22.32];
    
    %num = [182.1];
    %den = [1 2272 464.1];

    sys = tf(num,den);

    kp = gen(1);
    ki = gen(2);
    kd = gen(3);

    num_PID = [kd kp ki];
    den_PID = [1 0];
    PID = tf(num_PID,den_PID);

    sys_PID = feedback(PID*sys,1);
    [y,t]=step(sys_PID);
    hasil = stepinfo(y,t,SP);
    ess = abs(SP-y(end));
    RiseTime = hasil.RiseTime;
    Overshoot = hasil.Overshoot;
    Settlingtime = hasil.SettlingTime;

    fitness1 = 1/(RiseTime+1)*100;

    fitness2 = 1/(ess+1)*100;

    if ess==0
        fitness3 = 1*100;
    else
        fitness3 = 1/(Overshoot+1)*100;
    end

    if Settlingtime<=10
        fitness4 = 1*100;
    else
        fitness4 = 1/(Settlingtime)*100;
    end

    fitness = (fitness1 + fitness2 + fitness3 + fitness4)/4;

end
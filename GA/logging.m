function logging(solusi,generasi)
    clc
    fprintf('generasi : %d \n',generasi);
    fprintf('KP : %f \n', solusi.gen(1));
    fprintf('KI : %f \n', solusi.gen(2));
    fprintf('KD : %f \n', solusi.gen(3));
    fprintf('fitness : %f \n', solusi.fitness);
end
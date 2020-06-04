function [fitness,gen] = fitness_mutation(mutant,Nvar,Nbit,Ra,Rb)
    kromosom = mutant.kromosom;
    for i=1:Nvar
        a(i,:) = kromosom(1,(Nbit*(i-1))+1:Nbit*i);
        for j = 1:Nbit
            f(i,j) = a(i,j)*(2^(Nbit-j));
        end
        x(i) = sum(f(i,:));
        x(i) = x(i)/((2^Nbit)-1);
        gen(i) = Rb + (Ra - Rb)*x(i);
    end
    fitness = calculate_fitness(gen);
end
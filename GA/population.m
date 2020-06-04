function populasi = population(besar_populasi,Nvar,Nbit,Ra,Rb)
    populasi = struct();
    for i=1:besar_populasi
        [gen,kromosom] = create_gen(Nvar,Nbit,Ra,Rb);
        fitness = calculate_fitness(gen);
        populasi(i).gen = gen;
        populasi(i).fitness = fitness;
        populasi(i).kromosom = kromosom;
    end
end
clc
clear all
close all

Nvar = 3;
Nbit = 10;
Ra = 20;
Rb = 0;
besar_populasi = 100;
laju_mutasi = 0.5;

populasi = population(besar_populasi,Nvar,Nbit,Ra,Rb);
isLooping = true;
generasi = 0;

while isLooping
    %% seleksi
    [parent1,parent2] = selection(populasi);
    
    %% pindah silang
    [child1,child2] = crossover(parent1,parent2);
    
    %% mutasi
    mutant1 = mutation(child1,laju_mutasi);
    mutant2 = mutation(child2,laju_mutasi);
    
    %% hitung fitness mutant
    [fitness1,gen1] = fitness_mutation(mutant1,Nvar,Nbit,Ra,Rb);
    [fitness2,gen2] = fitness_mutation(mutant2,Nvar,Nbit,Ra,Rb);
    
    %% masukan gen dan fitness mutant
    mutant1.gen = gen1;
    mutant1.fitness = fitness1;
    mutant2.gen = gen2;
    mutant2.fitness = fitness2;
    
    %% calon anggota
    children = [mutant1,mutant2];
    populasi = regeneration(children,populasi);
    generasi = generasi+1;
    [isLooping, solusi] = termination(populasi);
    logging(solusi,generasi)
    
end

PID = final(solusi)


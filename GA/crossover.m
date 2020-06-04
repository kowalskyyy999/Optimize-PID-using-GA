function [child1,child2] = crossover(parent1,parent2)
    child1 = parent1;
    child2 = parent2;

    CP = round(length(parent1.kromosom)/2);

    child1.kromosom(1:CP) = parent2.kromosom(1:CP);
    child2.kromosom(1:CP) = parent1.kromosom(1:CP);
end
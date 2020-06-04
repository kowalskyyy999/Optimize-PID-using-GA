function mutant = mutation(child,laju_mutasi)
    mutant = child;
    for i=1:length(mutant.kromosom)
        if rand <= laju_mutasi
            mutant.kromosom(i) = 1;
        else
            mutant.kromosom(i) = 0;
        end
    end
end
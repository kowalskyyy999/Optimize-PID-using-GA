function new_populasi = regeneration(children,populasi)
    fitness_data = zeros(1,length(populasi));
    for i = 1:length(populasi)
        fitness_data(i) = populasi(i).fitness;
    end

    for i=1:length(children)
        [~,index] = min(fitness_data);
        populasi(index) = [];
        fitness_data(index) =[];
    end

    for i=1:length(children)
        n = length(populasi)+1;
        populasi(n) = children(i);
    end
    new_populasi = populasi;
end
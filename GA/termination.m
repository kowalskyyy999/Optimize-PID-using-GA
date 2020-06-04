function [isLooping,solusi] = termination(populasi)
    [best_solution,~] = final_selection(populasi);
    clc
    best_solution.gen
    
    if best_solution.fitness > 82.9
        isLooping = false;
    else
        isLooping = true;
    end
    
    solusi = best_solution;
end
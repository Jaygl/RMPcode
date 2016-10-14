function [ xEvalAll ] = potential_planner( xStart,world,potential,epsilon )
%POTENTIAL_PLANNER Summary of this function goes here
%   Detailed explanation goes here

xEvalAll = xStart;

while size(xEvalAll,2) < 1000
    xEval = xEvalAll(:,end);
    gradU = potential_totalGrad(xEval, world, potential);
    if sqrt(dot(gradU,gradU)) <= 10e-3 
        disp('Reached goal location...')
        return
    else
        xEvalAll(:,end+1) = xEval - epsilon*gradU;
    end
end


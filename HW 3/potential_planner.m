function [ xEvalAll ] = potential_planner( xStart,world,potential,epsilon )
%POTENTIAL_PLANNER Summary of this function goes here
%   Detailed explanation goes here

xEvalAll = xStart;

while size(xEvalAll,2) < 1000
    xEval = xEvalAll(:,end)
    U = potential_total(xEval, world, potential);
    if abs(U) < 10e-3 
        return
    else
        gradU = potential_totalGrad(xEval, world, potential);
        xEvalAll(:,end+1) = xEval - epsilon*gradU;
    end
end


function [ h ] = heuristic( graphVector, idxX, idxGoal )
%HEURISTIC Summary of this function goes here
%   Detailed explanation goes here

h = euc_dist(graphVector(idxX).x, graphVector(idxGoal).x);

end


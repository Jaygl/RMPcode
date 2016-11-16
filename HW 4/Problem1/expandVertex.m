function [ graphVector, pqOpen] = expandVertex( graphVector, idxNBest, idxX, idxGoal, pqOpen )
%EXPANDVERTEX Expands the node graphVector(idxNBest) by 
%   Detailed explanation goes here
g_nbest = graphVector(idxNBest).g;

if ~priorityIsMember(pqOpen, idxX)
    graphVector(idxX).g = g_nbest + heuristic(graphVector, idxX, idxNBest);
    graphVector(idxX).backpointer = idxNBest;
    f = graphVector(idxX).g + heuristic(graphVector, idxX, idxGoal);
    pqOpen = priorityPush(pqOpen, idxX, f);
elseif (g_nbest + heuristic(graphVector, idxX, idxNBest)) < graphVector(idxX).g
    graphVector(idxX).g = g_nbest + heuristic(graphVector, idxX, idxNBest);
    graphVector(idxX).backpointer = idxNBest;
    %SHOULD I NOT UPDATE PQ COST HERE!? THIS SEEMS WRONG
end

end


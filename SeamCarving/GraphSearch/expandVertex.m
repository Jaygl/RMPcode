function [ graphVector, pqOpen] = expandVertex( graphVector, idxNBest, idxX, idxGoal, pqOpen )
%EXPANDVERTEX Expands the node graphVector(idxX) by adding it to 
%pqOpen with appropriate cost values and modifying it's graphVector entry.
%Then returns the modified versions of graphVector and pqOpen.
%   graphVector is a graphVector structure, previously defined
%	idxNBest is the index of the node that called expandVertex (thus the
%		backpointer target)
%	idxX is the index of graphVector to be expanded 
%	idxGoal is the index of the goal node (needed to calculate the metric f)
%	pqOpen is a priority queue containing the keys and mincost of open nodes
g_nbest = graphVector(idxNBest).g;

if ~priorityIsMember(pqOpen, idxX)
	%If not already a member of pqOpen, then add a new entry to pqOpen and 
	%update graphVector(idxX) by setting backpointer and g value
    graphVector(idxX).g = g_nbest + heuristic(graphVector, idxX, idxNBest);
    graphVector(idxX).backpointer = idxNBest;
    f = graphVector(idxX).g + heuristic(graphVector, idxX, idxGoal);
    pqOpen = priorityPush(pqOpen, idxX, f);
elseif (g_nbest + heuristic(graphVector, idxX, idxNBest)) < graphVector(idxX).g
    %If already a member of pqOpen, then check if g is greater than this new 
    %path's g value. If it is, then we reset g
    graphVector(idxX).g = g_nbest + heuristic(graphVector, idxX, idxNBest);
    graphVector(idxX).backpointer = idxNBest;
    %Update pqOpen
%     f = g_nbest + heuristic(graphVector, idxX, idxGoal);
%     pqOpen = priorityUpdate(pqOpen, idxX, f);
    
end

end


function [ graphVector, pqOpen] = expandVertex2( graphVector, idxNBest, idxX, idxGoal, pqOpen )
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
target = find(graphVector(idxNBest).neighbors == idxX)

%CURRENT UPDATE:
% JUST ADDED graphVector(ind).neighborsCost

%Need to implement this in order to get the path length going properly

% Want to add an alpha tuning parameter to cost equation for prioritizing
% path length to image energy/information

%Might need to fix the update section below (Marked in all caps) where we
%have a node that's already been explored and we need to update it and give
%it a lower cost.

if ~priorityIsMember(pqOpen, idxX)
	%If not already a member of pqOpen, then add a new entry to pqOpen and 
	%update graphVector(idxX) by setting backpointer and g value
    graphVector(idxX).g = g_nbest + graphVector(idxX).cost;
    graphVector(idxX).backpointer = idxNBest;
    f = graphVector(idxX).g + heuristic(graphVector, idxX, idxGoal);
    pqOpen = priorityPush(pqOpen, idxX, f);
elseif (g_nbest + graphVector(idxX).cost < graphVector(idxX).g)
    %If already a member of pqOpen, then check if g is greater than this new 
    %path's g value. If it is, then we reset g
 
    %THIS IS INCORRECT, WE NEED TO REPROCESS idxX SO ALL IT'S CHILDREN GET
    %UPDATED AS WELL
    graphVector(idxX).g = g_nbest + graphVector(idxX).cost;
    graphVector(idxX).backpointer = idxNBest;
    
    %MAYBE JUST EXPAND VERTEX ON IT HERE? OR [ADD BACK INTO PQOPEN]
    
    %Update pqOpen
%     f = g_nbest + heuristic(graphVector, idxX, idxGoal);
%     pqOpen = priorityUpdate(pqOpen, idxX, f);
    
end

end


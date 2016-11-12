function [ path ] = graph_search( graphVector, idxStart, idxGoal )
%GRAPH_SEARCH Summary of this function goes here
%   Detailed explanation goes here
path = [];
C = [];
pqOpen = priorityPrepare();
pqOpen = priorityPush(pqOpen,idxStart,heuristic(graphVector, idxStart, idxGoal));
graphVector(idxStart).g = 0;
graphVector(idxStart).backpointer = 0;

while ~isempty(pqOpen)
    %Get the next best node to try and remove from pqOpen
    [pqOpen idxNBest cost] = priorityMinPop(pqOpen);
    %Mark this node as closed
    C(end+1) = idxNBest;
    %Check if this is goal location
    if idxNBest == idxGoal
%         disp('I DID FIND A PATH')
        path = buildPath(graphVector,idxStart,idxGoal);
        %EXIT... (This seems wrong)
    end
    %Get the list of possible neighbors to expand, no closed nodes
    open_paths = getExpandList(graphVector, idxNBest, C);
    %Expand each possible neighbor
    for k = 1:length(open_paths)
        [graphVector pqOpen] = expandVertex(graphVector, idxNBest, open_paths(k), idxGoal, pqOpen);
    end
end


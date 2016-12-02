function [ path ] = graph_search( graphVector, idxStart, idxGoal )
%GRAPH_SEARCH graph search algorithm that searches the structure graphVector 
%for idxGoal from idxStart using the A* algorithm.
%   graphVector is a graphVector structure as previously defined
%   idxStart is the index of the starting node
%   idxGoal is the index of the goal node
%   path is a vector of lenght N containing the indeces of the nodes
%       traversed to get from idxStart to idxGoal.
%Initialize variables
path = [];
C = [];
pqOpen = priorityPrepare();

%Expand the start node first
pqOpen = priorityPush(pqOpen,idxStart,heuristic(graphVector, idxStart, idxGoal));
graphVector(idxStart).g = 0;
graphVector(idxStart).backpointer = 0;

%While the priority queue is not empty, expand vertices until goal is found
while ~isempty(pqOpen)
    %Get the next best node to try, and remove it from pqOpen
    [pqOpen idxNBest cost] = priorityMinPop(pqOpen);
    %Mark this node as closed
    C(end+1) = idxNBest;
    %Check if this is goal location
    if idxNBest == idxGoal
        %If so, follow backpointers to build path and then return
        path = buildPath(graphVector,idxStart,idxGoal);
        return
    end
    %Get the list of possible neighbors to expand, but not closed nodes
    open_paths = getExpandList(graphVector, idxNBest, C);
    %Expand each possible neighbor
    for k = 1:length(open_paths)
        [graphVector pqOpen] = expandVertex(graphVector, idxNBest, open_paths(k), idxGoal, pqOpen);
    end
end


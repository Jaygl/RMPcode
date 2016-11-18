function [ xPath ] = visibility_search( graphVector,xStart, xGoal, world )
%VISIBILITY_SEARCH implementation of the A* search algorithm on the structure
%graphVector going from position xStart to xGoal within world.
%xStart and xGoal are added to graphVector in order to use graph_search, which
%was previously defined.
%   xStart is a 2x1 vector containing the x,y pair of the start location
%   xGoal is a 2x1 vector containing the x,y pair of the goal locaiton
%   graphVector is a graphVector structure, previously defined, that represents
%               world
%   world is a world structure previously defined. It is represented in 
%               graphVector already, but it simplifies the check for visibility 
%               for xStart and xGoal 

%determine the start and goal node indeces to be added to graphVector
startNode_idx = length(graphVector)+2;
goalNode_idx = length(graphVector)+1;

%Compute visibility for xStart and xGoal
startNode_neighbors = visibility_check(world, xStart);
goalNode_neighbors = visibility_check(world, xGoal);
%Check for direct path to goal from start
quick_Path = visibility_quickCheck(world, xStart, xGoal);

startNode_neighbors(find(startNode_neighbors == startNode_idx)) = [];
goalNode_neighbors(find(goalNode_neighbors == goalNode_idx)) = [];

if quick_Path
    %Add the connection between startNode and goalNode if it exists
    startNode_neighbors(end+1) = goalNode_idx;
    goalNode_neighbors(end+1) = startNode_idx;
end

%Add startNode to graphVector
graphVector(startNode_idx).x = xStart;
graphVector(startNode_idx).neighbors = startNode_neighbors;
graphVector(startNode_idx).g = [];
graphVector(startNode_idx).backpointer = [];

%Add goalNode to graphVector
graphVector(goalNode_idx).x = xGoal;
graphVector(goalNode_idx).neighbors = goalNode_neighbors;
graphVector(goalNode_idx).g = [];
graphVector(goalNode_idx).backpointer = [];

%Compute the neighborsCost for goalNode and startNode
for j = 1:length(graphVector(startNode_idx).neighbors)
    neighbor = graphVector(startNode_idx).neighbors(j);
    graphVector(startNode_idx).neighborsCost(j) = euc_dist(graphVector(startNode_idx).x, ...
        graphVector(neighbor).x);
end
%Note we need to add goalNode to the neighborlist of all its neighbors, because this
%is effectively a directed graph.
for j = 1:length(graphVector(goalNode_idx).neighbors)
    neighbor = graphVector(goalNode_idx).neighbors(j);
    graphVector(goalNode_idx).neighborsCost(j) = euc_dist(graphVector(goalNode_idx).x, ...
        graphVector(neighbor).x);
    mynewidx = length(graphVector(neighbor).neighbors)+1;
    graphVector(neighbor).neighbors(mynewidx) = goalNode_idx;
    graphVector(neighbor).neighborsCost(mynewidx) = graphVector(goalNode_idx).neighborsCost(j);
end

%Run A* algorithm on the updated graphVector
path = graph_search(graphVector, startNode_idx, goalNode_idx);

%Extract [x,y] pairs into xPath
for k = 1:length(path)
    xPath(:,k) = graphVector(path(k)).x;
end

function [ xPath ] = visibility_search( graphVector,xStart, xGoal, world )
%VISIBILITY_SEARCH Summary of this function goes here
%   Detailed explanation goes here

startNode_idx = length(graphVector)+2;
goalNode_idx = length(graphVector)+1;

startNode_neighbors = visibility_check(world, xStart);

goalNode_neighbors = visibility_check(world, xGoal);
%Check for direct path to goal from start
quick_Path = visibility_quickCheck(world, xStart, xGoal);
%

startNode_neighbors(find(startNode_neighbors == startNode_idx)) = [];
goalNode_neighbors(find(goalNode_neighbors == goalNode_idx)) = [];

if quick_Path
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


for j = 1:length(graphVector(startNode_idx).neighbors)
    neighbor = graphVector(startNode_idx).neighbors(j);
    graphVector(startNode_idx).neighborsCost(j) = euc_dist(graphVector(startNode_idx).x, ...
        graphVector(neighbor).x);
end

for j = 1:length(graphVector(goalNode_idx).neighbors)
    neighbor = graphVector(goalNode_idx).neighbors(j);
    graphVector(goalNode_idx).neighborsCost(j) = euc_dist(graphVector(goalNode_idx).x, ...
        graphVector(neighbor).x);
    mynewidx = length(graphVector(neighbor).neighbors)+1;
    graphVector(neighbor).neighbors(mynewidx) = goalNode_idx;
    graphVector(neighbor).neighborsCost(mynewidx) = graphVector(goalNode_idx).neighborsCost(j);
end

path = graph_search(graphVector, startNode_idx, goalNode_idx);

for k = 1:length(path)
    xPath(:,k) = graphVector(path(k)).x;
end

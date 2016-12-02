function [ theta1Path, theta2Path ] = twolink_search( theta1Start,theta2Start,theta1Goal,theta2Goal )
% TWOLINK_SEARCH implementation of the graph_search algorithm adapted for
% the twolink problem, goes from position [theta1Start theta2Start] to
% [theta2Start theta2Goal] within the constraints of graphVector, which is
% loaded from twolink_freeSpace_data. The start and goal location need not
% lie within the graphVector structure precisely, the nearest node to the
% desired start and end locations will be used for those positions instead.
%   theta1Start, theta2Start, theta1Goal, theta2Goal are the theta1,theta2
%   angles at which the twolink manipulator will attempt to travel from and
%   to.

%Load the data
load('twolink_freeSpace_data')
%Find the closest point in the grid to the desired start/stop locations
theta1S = closest_point(theta1Start, theta1Grid);
theta2S = closest_point(theta2Start, theta2Grid);
theta1G = closest_point(theta1Goal, theta1Grid);
theta2G = closest_point(theta2Goal, theta2Grid);

%Translate those start/stop locations to nodes in graphVector
idxStart = find(ismember([graphVector(:).x]',[theta1S theta2S],'rows'));
idxGoal = find(ismember([graphVector(:).x]',[theta1G theta2G],'rows'));

%Perform the search
path = graph_search(graphVector, idxStart, idxGoal);

%Convert the index path to theta1 and theta2 paths
temp = [graphVector(path).x];
theta1Path = temp(1,:);
theta2Path = temp(2,:);

end


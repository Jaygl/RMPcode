function [ theta1Path, theta2Path ] = twolink_search( theta1Start,theta2Start,theta1Goal,theta2Goal )
%TWOLINK_SEARCH Summary of this function goes here
%   Detailed explanation goes here

load('twolink_freeSpace_data')
theta1S = closest_point(theta1Start, theta1Grid);
theta2S = closest_point(theta2Start, theta2Grid);
theta1G = closest_point(theta1Goal, theta1Grid);
theta2G = closest_point(theta2Goal, theta2Grid);

idxStart = find(ismember([graphVector(:).x]',[theta1S theta2S],'rows'));
idxGoal = find(ismember([graphVector(:).x]',[theta1G theta2G],'rows'));

path = graph_search(graphVector, idxStart, idxGoal);

temp = [graphVector(path).x];
theta1Path = temp(1,:);
theta2Path = temp(2,:);

end


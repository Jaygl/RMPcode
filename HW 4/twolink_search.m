function [ output_args ] = twolink_search( theta1Start,theta2Start,theta1Goal,theta2Goal )
%TWOLINK_SEARCH Summary of this function goes here
%   Detailed explanation goes here

load('twolink_freeSpace_data')
theta1S = closest_point(theta1Start, theta1Grid);
theta2S = closest_point(theta2Start, theta2Grid);
theta1G = closest_point(theta1Goal, theta1Grid);
theta2G = closest_point(theta2Goal, theta2Grid);

graphVector.x

end


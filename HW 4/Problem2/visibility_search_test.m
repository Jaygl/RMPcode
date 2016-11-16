function [  ] = visibility_search_test(  )
close all
%VISIBILITY_SEARCH_TEST Summary of this function goes here
%   Detailed explanation goes here
load('polygonalWorld')
visibility_plotWorld(world);
graphVector = visibility_graph(world);
for k = 1:size(xStart,2)
    xPath = visibility_search(graphVector, xStart(:,k), xGoal, world);
    plot(xPath(1,:),xPath(2,:), 'linewidth', 2)   
end


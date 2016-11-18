function [  ] = visibility_search_test(  )
%VISIBILITY_SEARCH_TEST loads polgonalWorld.mat and computes the shortest path
%between each of the 5 possible xStart positions and xGoal within the world.
%Plots the paths to allow visual verification of minimum paths
close all
%load data
load('polygonalWorld')
%plot the world
visibility_plotWorld(world);
%generate graphVector
graphVector = visibility_graph(world);
for k = 1:size(xStart,2)
	%search and plot results for each xStart position
    xPath = visibility_search(graphVector, xStart(:,k), xGoal, world);
    plot(xPath(1,:),xPath(2,:), 'linewidth', 2)   
end


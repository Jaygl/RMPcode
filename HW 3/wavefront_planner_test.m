function [ ] = wavefront_planner_test( NumPoints )
%WAVEFRONT_PLANNER_TEST Summary of this function goes here
%   Detailed explanation goes here
load('sphereworld');
sphereworld_plot(world, xGoal)
[xx yy] = wavefront_makeGrid(NumPoints);
val = wavefront_initialize(xx, yy, xGoal, world);
val = wavefront_propagate(val);
hw3_plotValueGrid(xx(1,:),yy(:,1),val)

for k = 1:size(xStart, 2)
    xEvalAll = wavefront_planner(xStart(:,k), val, xx, yy);
    plot(xEvalAll(1,:), xEvalAll(2,:), 'linewidth', 3)
end


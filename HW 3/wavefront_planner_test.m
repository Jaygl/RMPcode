function [ ] = wavefront_planner_test( NumPoints )
%Test function for wavefront_planner. Loads the sphereworld dataset and
%plots it. We then make and initialize the wavefront array val and propagate all of
%its values. We call the provided funciton to label the distances on the
%plot and then run the planner for each of the 5 staring locations in
%xStart.
%   NumPoints is the size of the grid to be tested.

%load data and plot it
load('sphereworld');
sphereworld_plot(world, xGoal)

%Make and initialize the wavefront val
[xx yy] = wavefront_makeGrid(NumPoints);
val = wavefront_initialize(xx, yy, xGoal, world);
val = wavefront_propagate(val);

hw3_plotValueGrid(xx,yy,val)
%Run planner for each starting location
for k = 1:size(xStart, 2)
    xEvalAll = wavefront_planner(xStart(:,k), val, xx, yy);
    plot(xEvalAll(1,:), xEvalAll(2,:), 'linewidth', 3)
end


function [  ] = potential_planner_test( type,alpha,epsilon )
%POTENTIAL_PLANNER_TEST Summary of this function goes here
%   Detailed explanation goes here

load('sphereworld')
sphereworld_plot(world,xGoal);

potential.alpha = alpha;
potential.type = type;
potential.xGoal = xGoal;

hold on
plot(xStart(1,:), xStart(2,:), 'ro', 'linewidth', 2)
for k = 1:size(xStart, 2)
    xEvalAll = potential_planner(xStart(:,k),world,potential,epsilon);
    plot(xEvalAll(1,:),xEvalAll(2,:));
end

f=@(xEval) potential_total(xEval, world, potential);
figure
hw3_funContour(f);

f=@(xEval) potential_totalGrad(xEval, world, potential);
figure
hw3_funGradField(f, 20);

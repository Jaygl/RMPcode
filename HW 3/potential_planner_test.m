function [  ] = potential_planner_test( type,alpha,epsilon )
%Test function for the potential planner procedure. Loads the file
%sphereworld, plots the world with sphereworld_plot, prepares a structure
%potential, plots the (-) gradient of sphereworld, and calls the
%potential_planner function 5 times with the initial start positions
%xStart. The trajectories are then overlaid.
%   type is the potential type. 'conic' or 'quadratic' are accepted
%   alpha is the weight of the attractive term to the repulsive term, this
%       is a scaler quantity
%   epsilon is the step size associated with the gradient descent
%       algorithm, also a scaler quantity

load('sphereworld')
sphereworld_plot(world,xGoal);

%Construct potential struct
potential.alpha = alpha;
potential.type = type;
potential.xGoal = xGoal;

%Run the planner for each of the start locations in xStart
hold on
plot(xStart(1,:), xStart(2,:), 'ro', 'linewidth', 2)
for k = 1:size(xStart, 2)
    xEvalAll = potential_planner(xStart(:,k),world,potential,epsilon);
    plot(xEvalAll(1,:),xEvalAll(2,:));
end

f=@(xEval) -potential_totalGrad(xEval, world, potential);
figure
sphereworld_plot(world,xGoal);
hw3_funGradField(f, 20);

%% Unicycle Model
function [xVectorNext] = unicycleModel(xVectorCurrent,v,w)
% For each vector component (x,y,theta), calculate the next position based
% on the current position, forward linear speed, and angular velocity

% The following equation is provided in the problem statement:
    xVectorNext = [xVectorCurrent(1) + v*cos(xVectorCurrent(3)); ...
        xVectorCurrent(2) + v*sin(xVectorCurrent(3)); ...
        xVectorCurrent(3) + w];
end
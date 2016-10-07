%% Question 1.1/1.2 - Points to Line Function
% This function takes the input arguments as the x and y coordinates of 2
% points and calculates the slope and intercept of the line formed by
% connecting the 2 points.
    function [line] = points2line(Pt1,Pt2)
    X = [Pt1(1) Pt2(1)];
    Y = [Pt1(2) Pt2(2)];
    m = (Y(2) - Y(1))/(X(2) - X(1)); % calculate slope
    b = Y(2) - m*X(2); % calculate intercept
    line = m.*X + b; % equation of a line
    end
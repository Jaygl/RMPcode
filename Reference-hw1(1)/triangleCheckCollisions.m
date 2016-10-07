%% Question 1.2 - Triangle Check Collisions Function
% This function determines whether the point is inside or outside the
% triangle by calling the "lineCheckSide" function. The input variable
% 'points' is a 2x8 matrix, where each column represents the coordinates of
% the point of interest, triangle pt 'a', triangle pt 'b', and triangle pt
% 'c', respectively.
    function [flagPoints] = triangleCheckCollisions(points)
% Coordinates of point of interest
        p = points(:,1);
        
% 3 vertices of triangle
        a = points(:,2);
        b = points(:,3);
        c = points(:,4);
        
% Check if the point is on the correct side of lines using cross products
% (this calls "lineCheckSide" function)
        if lineCheckSide(p,a,b,c) == 1 && lineCheckSide(p,b,c,a) == 1 && lineCheckSide(p,c,a,b) == 1
            flagPoints = 1; % point 'p' is inside triangle
        else
            flagPoints = 0; % point 'p' is outside triangle
        end
    end
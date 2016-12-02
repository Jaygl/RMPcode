function [ theta1Grid, theta2Grid, flag ] = twolink_freeSpace( points,NGrid )
% TWOLINK_FREESPACE generates the two NGridx1 vectors theta1Grid and
% theta2Grid of evenly spaced points along [0 2*pi]. The entire space
% defined by the meshgrid of these two vectors is checked against the
% obstacles defined by the points variable. Returns flag, an NGridxNGrid
% array of logicals detailing whether the angle combination at that point is
% blocked or free.
%   NGrid is a scaler quantity for the number of samples in each dimension
%   points is a 2xN vector holding x,y pairs of all the point obstacles

%Set up the vectors and arrays
theta1Grid = linspace(0,2*pi,NGrid);
theta2Grid = theta1Grid;
[theta1 theta2] = meshgrid(theta1Grid, theta2Grid);
flag = zeros(size(theta1));

%Check each possible pairing for a collision.
for k = 1:numel(theta1)
    flag(k) = ~twolinkCheckCollision(theta1(k),theta2(k), points);
end

end

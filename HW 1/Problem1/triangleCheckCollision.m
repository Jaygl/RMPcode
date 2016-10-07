function [ flagPoints ] = triangleCheckCollision(points, vertices)
%TRIANGLECHECKCOLLISION Determines if any of the N points are within the
%vertices of the given triangle
%   points is a 2xN array of x,y pairs
%   flagPoints is a Nx1 vector, a 1 represtents no collision
%   vertices is a 2x3 array of the x,y pairs of the vertices of the
%   triangle in question

N = size(points,2);
flagPoints = zeros(N,1);

for n = 1:N
    if lineCheckSide(points(:,n), vertices(:, [1 2])) == ...
            lineCheckSide(vertices(:,3), vertices(:, [1 2])) && ...
            lineCheckSide(points(:,n), vertices(:, [1 3])) == ...
            lineCheckSide(vertices(:,2), vertices(:, [1 3])) && ...
            lineCheckSide(points(:,n), vertices(:, [2 3])) == ...
            lineCheckSide(vertices(:,1), vertices(:, [2 3]))
        flagPoints(n) = 1;
    end
end


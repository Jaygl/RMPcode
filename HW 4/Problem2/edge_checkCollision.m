function [ flag ] = edge_checkCollision( vertices1, vertices2 )
%EDGE_CHECKCOLLISION Summary of this function goes here
%   returns flag = true if the two edges intersect, false otherwise.
%          if they overlap but are colinear, they are not intersecting.

flag = 0;
[x y] = polyxpoly(vertices1(1,:), vertices1(2,:), vertices2(1,:), vertices2(2,:));

if length(x) == 1
    flag = 1;
end


end


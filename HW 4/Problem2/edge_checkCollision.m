function [ flag ] = edge_checkCollision( vertices1, vertices2 )
%EDGE_CHECKCOLLISION determines if two lines, defined by
%vertices1 and vertices 2, intersect anywhere other than their endpoints
%   returns flag = true if the two edges intersect, false otherwise.
%          If they overlap but are colinear, they are not intersecting.
%vertices1, vertices2 = 2x2 arrays with entries [x1 x2; y1 y2] which
%determine the endpoints of the two lines.

flag = 0;
[x y] = polyxpoly(vertices1(1,:), vertices1(2,:), vertices2(1,:), vertices2(2,:));

if length(x) == 1 && ~max(floor(mean(ismember(vertices1,vertices2),1))) == 1
    %x will be length 2 if they are colinear and overlap, or length 0 if
    %they do not intersect. Also check for endpoint overlap, which is
    %explicitly allowed
    flag = 1;
end


end


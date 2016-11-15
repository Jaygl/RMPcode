function [m b] = points2line(points)
%points2line Computes the coefficients m and b for the equation of the line
%y = mx + b that passes through the two (x,y) pairs in points. If it is a
%vertical line, m is set to inf and b is set to the x intercept (instead of
%the y intercept).

%   points is an [x1 x2; y1 y2] array

x1 = points(1,1); x2 = points(1,2); y1 = points(2,1); y2 = points(2,2);

if x1 == x2
    m = inf;
    b = x1;
else
    m = (y2 - y1) / (x2 - x1);  
    b = m*-x2+y2;
end

end


function [bool] = lineCheckSide(point, vtex)
%LINECHECKSIDE This function returns a 1 if the point is above or to the
%right of a line (in the case of vertical lines), otherwise it returns a
%zero. 

%point is a 2 element vector, point(1) = x coord, point(2) = y coord
%vtex is a 2x2 array that holds the coordinates for the 2 points on the
%   line. It is assigned as [x1 x2; y1 y2] 

[m b] = points2line(vtex);

if m == inf
    bool = point(1) > b;
else
    bool = m*point(1)+b < point(2);
end

end


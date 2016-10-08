%Plot the contours of a 2-D anonymous function over a specific interval
%function hw3_funContour(f)
%Input arguments
%   f   Function handle of a function that maps a [2 x 1] vector to a
%       scalar.
%Output
%   This function evaluates f over the points of a regular grid covering the
%   square [-2,2] x [-2,2] and then plots the results using the contour
%   function. In general, the function f will be an anonymous function (see
%   MATLAB documentation on function handles and anonymous functions and
%   the example below).
%Example of use
%   f=@(x) x'*diag([1 2])*x+[3 1]*x;
%   hw3_funContour(f)
%   axis equal
function hw3_funContour(f)
xx=linspace(-2,2);
yy=linspace(-2,2);
[X,Y]=meshgrid(xx,yy);
Z=zeros(size(X));
for iX=1:size(X,1)
    for iY=1:size(X,2)
        Z(iX,iY)=f([X(iX,iY);Y(iX,iY)]);
    end
end
contour(X,Y,Z)

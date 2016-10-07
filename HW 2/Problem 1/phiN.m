function [ XN, YN ] = phiN( x, y, z )
%PHIN Stereographic mapping for the points x, y, z on the unit sphere
%onto the (z=0) plane. Mapping from the North pole.
%   x, y, z - arrays of x, y, and z coordinates where x(i,j) is the x
%   component, y(i,j) is the y compontent, and z(i,j) is the z component.
%   x, y, and z mult be of the same size. This function is applied
%   entrywise and the outputs (XN, YN) will have the same dimensions as
%   the inputs. (x,y,z) should be a point on the unit sphere, otherwise
%   this function may not work correctly.

if (isequal(size(x), size(y)) || (isvector(x) && isvector(y) && ...
        numel(x) == numel(y))) && (isequal(size(x), size(z)) || (isvector(x) && isvector(z) && ...
        numel(x) == numel(z)))
    XN = x ./ (1 + z);
    YN = y ./ (1 + z);
else
    error('Input arguments must be of the same size')
end

end


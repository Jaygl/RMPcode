function [ x, y, z ] = phiNinv( XN, YN )
%PHININV Inverse stereographic mapping for the points XN and YN
%on (z=0) plane onto the unit sphere. This centers on the North pole.
%   XN, YN - arrays of x and y coordinates where XN(i,j) is the x component
%   and YN(i,j) is the corresponding y component. XN and YN must be of the
%   same size. This function is applied entrywise and the outputs (x,y,z)
%   will have the same dimensions as the inputs.

if isequal(size(XN), size(YN)) || (isvector(XN) && isvector(YN) && numel(XN) == numel(YN))
    x = (2*XN)./(1 + XN.^2 + YN.^2);
    y = (2*YN)./(1 + XN.^2 + YN.^2);
    z = (1 - XN.^2 - YN.^2) ./ (1 + XN.^2 + YN.^2);
else
    error('Input arguments must be of the same size')
end

end


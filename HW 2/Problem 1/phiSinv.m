function [ x, y, z ] = phiSinv( XS, YS )
%PHISINV Inverse stereographic mapping for the points XS and YS
%on (z=0) plane onto the unit sphere. This centers on the South pole.
%   XS, YS - arrays of x and y coordinates where XS(i,j) is the x component
%   and YS(i,j) is the corresponding y component. XS and YS must be of the
%   same size. This function is applied entrywise and the outputs (x,y,z)
%   will have the same dimensions as the inputs.

if isequal(size(XS), size(YS)) || (isvector(XS) && isvector(YS) && numel(XS) == numel(YS))
    x = (2*XS)./(1 + XS.^2 + YS.^2);
    y = (2*YS)./(1 + XS.^2 + YS.^2);
    z = (-1 + XS.^2 + YS.^2) ./ (1 + XS.^2 + YS.^2);
else
    error('Input arguments must be of the same size')
end



end


function [xx, yy] = wavefront_makeGrid(NGrid)
%Makes the vecotors xx, yy which are vectors of length Ngrid+1 that span 
%the range -2 to 2.
%   NGrid is a scaler quantity for the number of cells one would want.
	xx = linspace(-2,2,NGrid+1);
    yy = xx;
end
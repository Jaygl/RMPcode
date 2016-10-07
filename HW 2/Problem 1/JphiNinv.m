function [ J ] = JphiNinv( XN,YN )
%JPHININV Computes the Jacobian of our stereographic mapping phiNinv at the
%(x,y) pair (XN, YN). 
%   Computes the Jacobian via the formula derived in 1.5.

D = (XN^2+YN^2+1);
C = (XN^2+YN^2-1);

J(1,1) = 2/D + (4*XN^2) / D^2;
J(1,2) = (-4*XN*YN) / D^2;
J(2,1) = (-4*XN*YN) / D^2;
J(2,2) = 2/D + (4*YN^2) / D^2;
J(3,1) = (2 * XN * C) / D^2 - (2 * XN)/ D^2;
J(3,2) = (2 * YN * C) / D^2 - (2 * YN)/ D^2;

end


function [gamma gammadot] = phiPushCurveForward( ax, bx, ay, by )
%PHIPUSHCURVEFORWARD Computes gamma (path) and gammadot (velocity) for the 
%mapping of the curve c(t) = (ax*t+bx, ay*t+by) in the (x,y) plane onto the
%sphere via the stereographic mapping. gammadot is calculated at time t = 0
%on the range [-1:1]. This plots the curve and the velocity at t = 0.
%   ax, bx, ay, by are all constants for the parametrically defined curve
%   c(t) = (ax*t+bx, ay*t+by)


t = [-1:.01:1]';
%Compute curve c(t) = (ax*t + bx, ay*t + by)
c = [ax .* t + bx, ay .* t + by];
%Derivative of c(t) = cdot
cdot = [ax, ay]; 
%Map our curve from (XN,YN) to (x,y,z)
[gamma(:,1) gamma(:,2) gamma(:,3)] = phiNinv(c(:,1), c(:,2));

idx = find(t == 0);
%Compute gammadot at time t = 0.
A = JphiNinv(c(idx,1), c(idx,2));
[gammadot] = A*cdot';

%Plot the resulting path gamma and the tangent at t=0.
plot3(gamma(:,1), gamma(:,2), gamma(:,3), 'linewidth', 2)
hold on
quiver3(gamma(idx,1), gamma(idx,2), gamma(idx, 3), gammadot(1), gammadot(2), ...
    gammadot(3), 'linewidth', 2)
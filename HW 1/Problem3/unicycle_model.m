function [ xVectorNext ] = unicycle_model( xVectorCurrent, v, w )
%UNICYCLE_MODEL This function propogates the unicycle model one time step
%forward.
%   xVectorCurrent is a 3x1 array with fields x,y,theta
%   v is the linear velocity
%   w is the angular velocity

A = [cos(xVectorCurrent(3,1)) 0; ...
    sin(xVectorCurrent(3,1)) 0; ...
    0 1];

xVectorNext = xVectorCurrent + A * [v; w];

end


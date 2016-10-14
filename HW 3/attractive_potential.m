function [ UAttr ] = attractive_potential( xEval, potential )
%ATTRACTIVE_POTENTIAL Summary of this function goes here
%   Detailed explanation goes here

d = sqrt((xEval(1) - potential.xGoal(1))^2 + (xEval(2) - potential.xGoal(2))^2);

if strcmp(potential.type, 'quadratic')
    p = 2;
elseif strcmp(potential.type, 'conic')
    p = 1;
else
    Error('Not a valid potential type.')
end

UAttr = d^p;
end

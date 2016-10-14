function [ U ] = potential_total( xEval,world,potential )
%POTENTIAL_TOTAL Summary of this function goes here
%   Detailed explanation goes here

URep = sphere_potential(xEval,world);
UAttr = attractive_potential(xEval,potential);

U = URep + (potential.alpha)*UAttr;
end


function [ gradUAttr ] = potential_attractive( xEval, potential )
%POTENTIAL_ATTRACTIVE Summary of this function goes here
%   Detailed explanation goes here

if strcmp(potential.type, 'quadratic')
    gradUAttr = [2*(xEval(1) - potential.xGoal(1)); 2*(xEval(2) - potential.xGoal(2))];
elseif strcmp(potential.type, 'conic')
    d = sqrt((xEval(1) - potential.xGoal(1))^2 + (xEval(2) - potential.xGoal(2))^2);
    gradUAttr = [(xEval(1) - potential.xGoal(1))/d; (xEval(2) - potential.xGoal(2))/d];
else
    Error('Not a valid potential type.')
end


end



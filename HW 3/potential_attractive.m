function [ gradUAttr ] = potential_attractive( xEval, potential )
%Determines the Attractive potential at a point xEval by the potential of
%type 'potential'
%   xEval is a 2x1 vector with entries [x y].
%   potential is a struct following the definition in the homework. It has
%   fields xGoal (goal location), alpha (weight), and type

if strcmp(potential.type, 'quadratic')
    gradUAttr = [2*(xEval(1) - potential.xGoal(1)); 2*(xEval(2) - potential.xGoal(2))];
elseif strcmp(potential.type, 'conic')
    d = sqrt((xEval(1) - potential.xGoal(1))^2 + (xEval(2) - potential.xGoal(2))^2);
    gradUAttr = [(xEval(1) - potential.xGoal(1))/d; (xEval(2) - potential.xGoal(2))/d];
else
    Error('Not a valid potential type.')
end


end


